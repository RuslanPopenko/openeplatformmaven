package com.nordicpeak.flowengine.notifications;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import se.unlogic.emailutils.framework.FileAttachment;
import se.unlogic.emailutils.framework.SimpleEmail;
import se.unlogic.emailutils.populators.EmailPopulator;
import se.unlogic.hierarchy.core.annotations.CheckboxSettingDescriptor;
import se.unlogic.hierarchy.core.annotations.EventListener;
import se.unlogic.hierarchy.core.annotations.HTMLEditorSettingDescriptor;
import se.unlogic.hierarchy.core.annotations.InstanceManagerDependency;
import se.unlogic.hierarchy.core.annotations.ModuleSetting;
import se.unlogic.hierarchy.core.annotations.TextFieldSettingDescriptor;
import se.unlogic.hierarchy.core.annotations.WebPublic;
import se.unlogic.hierarchy.core.annotations.XSLVariable;
import se.unlogic.hierarchy.core.beans.*;
import se.unlogic.hierarchy.core.enums.CRUDAction;
import se.unlogic.hierarchy.core.enums.EventSource;
import se.unlogic.hierarchy.core.events.CRUDEvent;
import se.unlogic.hierarchy.core.exceptions.AccessDeniedException;
import se.unlogic.hierarchy.core.exceptions.ModuleConfigurationException;
import se.unlogic.hierarchy.core.exceptions.URINotFoundException;
import se.unlogic.hierarchy.core.interfaces.ForegroundModuleDescriptor;
import se.unlogic.hierarchy.core.interfaces.ForegroundModuleResponse;
import se.unlogic.hierarchy.core.interfaces.SMSSender;
import se.unlogic.hierarchy.core.interfaces.SectionInterface;
import se.unlogic.hierarchy.core.interfaces.ViewFragment;
import se.unlogic.hierarchy.core.utils.ModuleViewFragmentTransformer;
import se.unlogic.hierarchy.core.utils.ViewFragmentModule;
import se.unlogic.hierarchy.foregroundmodules.AnnotatedForegroundModule;
import se.unlogic.openhierarchy.foregroundmodules.siteprofile.interfaces.SiteProfile;
import se.unlogic.standardutils.collections.CollectionUtils;
import se.unlogic.standardutils.dao.AnnotatedDAO;
import se.unlogic.standardutils.dao.AnnotatedDAOWrapper;
import se.unlogic.standardutils.dao.HighLevelQuery;
import se.unlogic.standardutils.dao.QueryParameterFactory;
import se.unlogic.standardutils.dao.SimpleAnnotatedDAOFactory;
import se.unlogic.standardutils.db.tableversionhandler.TableVersionHandler;
import se.unlogic.standardutils.db.tableversionhandler.UpgradeResult;
import se.unlogic.standardutils.db.tableversionhandler.XMLDBScriptProvider;
import se.unlogic.standardutils.io.BinarySizes;
import se.unlogic.standardutils.io.FileUtils;
import se.unlogic.standardutils.string.AnnotatedBeanTagSourceFactory;
import se.unlogic.standardutils.string.SingleTagSource;
import se.unlogic.standardutils.string.TagReplacer;
import se.unlogic.standardutils.string.TagSource;
import se.unlogic.standardutils.validation.ValidationException;
import se.unlogic.standardutils.xml.XMLUtils;
import se.unlogic.webutils.http.RequestUtils;
import se.unlogic.webutils.http.URIParser;
import se.unlogic.webutils.populators.annotated.AnnotatedRequestPopulator;

import com.nordicpeak.flowengine.FlowBrowserModule;
import com.nordicpeak.flowengine.beans.DefaultInstanceMetadata;
import com.nordicpeak.flowengine.beans.DefaultStatusMapping;
import com.nordicpeak.flowengine.beans.Flow;
import com.nordicpeak.flowengine.beans.FlowFamily;
import com.nordicpeak.flowengine.beans.FlowInstance;
import com.nordicpeak.flowengine.beans.FlowInstanceEvent;
import com.nordicpeak.flowengine.beans.FlowType;
import com.nordicpeak.flowengine.beans.QueryDescriptor;
import com.nordicpeak.flowengine.beans.QueryInstanceDescriptor;
import com.nordicpeak.flowengine.beans.Status;
import com.nordicpeak.flowengine.beans.Step;
import com.nordicpeak.flowengine.dao.FlowEngineDAOFactory;
import com.nordicpeak.flowengine.enums.ContentType;
import com.nordicpeak.flowengine.enums.QueryState;
import com.nordicpeak.flowengine.enums.SenderType;
import com.nordicpeak.flowengine.events.ExternalMessageAddedEvent;
import com.nordicpeak.flowengine.events.ManagersChangedEvent;
import com.nordicpeak.flowengine.events.StatusChangedByManagerEvent;
import com.nordicpeak.flowengine.events.SubmitEvent;
import com.nordicpeak.flowengine.interfaces.FlowNotificationHandler;
import com.nordicpeak.flowengine.interfaces.ImmutableFlow;
import com.nordicpeak.flowengine.interfaces.ImmutableFlowInstance;
import com.nordicpeak.flowengine.interfaces.PDFProvider;
import com.nordicpeak.flowengine.interfaces.QueryHandler;
import com.nordicpeak.flowengine.managers.FlowInstanceManager;
import com.nordicpeak.flowengine.managers.ImmutableFlowInstanceManager;
import com.nordicpeak.flowengine.queries.contactdetailquery.ContactDetailQueryInstance;
import com.nordicpeak.flowengine.queries.organizationdetailquery.OrganizationDetailQueryInstance;

public class StandardFlowNotificationHandler extends AnnotatedForegroundModule implements FlowNotificationHandler, ViewFragmentModule<ForegroundModuleDescriptor> {

	public static final Field[] FLOW_INSTANCE_RELATIONS = {FlowInstance.EVENTS_RELATION, FlowInstanceEvent.ATTRIBUTES_RELATION, FlowInstance.FLOW_RELATION, FlowInstance.FLOW_STATE_RELATION, Flow.FLOW_TYPE_RELATION, Flow.FLOW_FAMILY_RELATION, FlowType.ALLOWED_GROUPS_RELATION, FlowType.ALLOWED_USERS_RELATION, Flow.STEPS_RELATION, Flow.FLOW_FAMILY_RELATION, FlowFamily.MANAGER_GROUPS_RELATION, FlowFamily.MANAGER_USERS_RELATION, Step.QUERY_DESCRIPTORS_RELATION, QueryDescriptor.EVALUATOR_DESCRIPTORS_RELATION, Flow.DEFAULT_FLOW_STATE_MAPPINGS_RELATION, DefaultStatusMapping.FLOW_STATE_RELATION, QueryDescriptor.QUERY_INSTANCE_DESCRIPTORS_RELATION, FlowInstance.MANAGERS_RELATION};

	private static final AnnotatedRequestPopulator<FlowFamililyNotificationSettings> POPULATOR = new AnnotatedRequestPopulator<FlowFamililyNotificationSettings>(FlowFamililyNotificationSettings.class);

	private static final AnnotatedBeanTagSourceFactory<Flow> FLOW_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<Flow>(Flow.class, "$flow.");
	private static final AnnotatedBeanTagSourceFactory<FlowInstance> FLOWINSTANCE_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<FlowInstance>(FlowInstance.class, "$flowInstance.");
	private static final AnnotatedBeanTagSourceFactory<Status> STATUS_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<Status>(Status.class, "$status.");
	private static final AnnotatedBeanTagSourceFactory<Contact> CONTACT_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<Contact>(Contact.class, "$contact.");
	private static final AnnotatedBeanTagSourceFactory<User> MANAGER_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<User>(User.class, "$manager.");
	private static final AnnotatedBeanTagSourceFactory<User> POSTER_TAG_SOURCE_FACTORY = new AnnotatedBeanTagSourceFactory<User>(User.class, "$poster.");

	@ModuleSetting
	@CheckboxSettingDescriptor(name="Enable fragment XML debug", description="Enables debugging of fragment XML")
	private boolean debugFragmententXML;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "SMS sender name", description = "The name of the sender used for SMS messages", required = true)
	private String smsSenderName = "Not set";

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Email sender name", description = "The name displayed in the sender field of sent e-mail", required = true)
	protected String emailSenderName = "Not set";

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Email sender address", description = "The sender address", required = true, formatValidator = EmailPopulator.class)
	protected String emailSenderAddress = "not.set@not.set.com";

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "User flow instance module URL", description = "The full URL of the user flow instance module", required = true)
	protected String userFlowInstanceModuleAlias = "not set";

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance admin module URL", description = "The full URL of the flow instance module", required = true)
	protected String flowInstanceAdminModuleAlias = "not set";

	//	@ModuleSetting
	//	@CheckboxSettingDescriptor(name = "Attach PDF to submit event emails", description="Controls if PDF's are attached to email notifications regarding submit events")
	//	protected boolean attachPDF = true;

	//	@ModuleSetting
	//	@TextFieldSettingDescriptor(name = "PDF filename (without file extension)", description = "Filename of the attached PDF (without file extension). Available tags: $flow.name, $flowInstance.flowInstanceID, $contact.*", required = true)
	//	protected String pdfFilename = "$flow.name, $flowInstance.flowInstanceID";

	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send SMS to users on status change", description = "Controls if SMS messages are the sent to the users when the status of their flow instance changes.")
	private boolean sendStatusChangedUserSMS;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "SMS to users on status change", description = "The SMS messages sent to the users when the status of their flow instance changes.", required = true)
	@XSLVariable(prefix = "java.")
	private String statusChangedUserSMS;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send SMS to users when new messages are received", description = "Controls if SMS messages are sent to the users when they receive new messages.")
	private boolean sendExternalMessageReceivedUserSMS;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "SMS to users when new messages are received", description = "The SMS messages sent to the users when they receive new messages.", required = true)
	@XSLVariable(prefix = "java.")
	private String externalMessageReceivedUserSMS;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send SMS to users on flow instance submit", description = "Controls if SMS messages are the sent to the users when they submit new flow instances.")
	private boolean sendFlowInstanceSubmittedUserSMS;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "SMS to sent users on flow instance submit", description = "The SMS message sent to the users when they submit new flow instances.", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedUserSMS;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send SMS to users when a flow instance is archived", description = "Controls if SMS messages are the sent to the users when their flow instances are archived.")
	private boolean sendFlowInstanceArchivedUserSMS;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "SMS sent to users when a flow instance is archived", description = "The SMS message sent to the users when their flow instances are archived.", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceArchivedUserSMS;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to users on status change", description = "Controls if email messages are the sent to the users when the status of their flow instances changes.")
	private boolean sendStatusChangedUserEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Status changed email subject (users)", description = "The subject of emails sent to the users when the status of their flow instance changes", required = true)
	@XSLVariable(prefix = "java.")
	private String statusChangedUserEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Status changed email message (users)", description = "The message of emails sent to the users when the status of their flow instance changes", required = true)
	@XSLVariable(prefix = "java.")
	private String statusChangedUserEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to users when new messages are received", description = "Controls if email messages are sent to the users when they receive new messages.")
	private boolean sendExternalMessageReceivedUserEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "New message received email subject (users)", description = "The subject of emails sent to the users when new messages are received", required = true)
	@XSLVariable(prefix = "java.")
	private String externalMessageReceivedUserEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "New message received email message (users)", description = "The message of emails sent to the users when new messages are received", required = true)
	@XSLVariable(prefix = "java.")
	private String externalMessageReceivedUserEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to users on flow instance submit", description = "Controls if email messages are the sent to the users when they submit new flow instances.")
	private boolean sendFlowInstanceSubmittedUserEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance submitted email subject", description = "The subject of emails sent to the users when they submit a new flow instance", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedUserEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Flow instance submitted email message", description = "The message of emails sent to the users when they submit a new flow instance", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedUserEmailMessage;




	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to users when flow instance is archived", description = "Controls if email messages are the sent to the users when their flow instances are archived.")
	private boolean sendFlowInstanceArchivedUserEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance archived email subject (users)", description = "The subject of emails sent to the users when their flow instances are archived", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceArchivedUserEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Flow instance archived email message (users)", description = "The message of emails sent to the users when their flow instances are archived", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceArchivedUserEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to managers when new messages are received from users", description = "Controls if email messages are sent to the managers when they receive new messages from users.")
	private boolean sendExternalMessageReceivedManagerEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "New message received email subject (managers)", description = "The subject of emails sent to the managers when new messages are received", required = true)
	@XSLVariable(prefix = "java.")
	private String externalMessageReceivedManagerEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "New message received email message (managers)", description = "The message of emails sent to the managers when new messages are received", required = true)
	@XSLVariable(prefix = "java.")
	private String externalMessageReceivedManagerEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to managers when they are assigned new flow instances", description = "Controls if email messages are sent to managers when they are assigned new flow instances.")
	private boolean sendFlowInstanceAssignedManagerEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Assigned new flow instance email subject (managers)", description = "The subject of emails sent to the managers when they are assigned new flow instances", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceAssignedManagerEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Assigned new flow instance email message (managers)", description = "The message of emails sent to the users when they are assigned new flow instances", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceAssignedManagerEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to managers on status change", description = "Controls if email messages are the sent to the users when the status of their flow instances changes.")
	private boolean sendStatusChangedManagerEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Status changed email subject (managers)", description = "The subject of emails sent to the managers when the status of their flow instance changes", required = true)
	@XSLVariable(prefix = "java.")
	private String statusChangedManagerEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Status changed email message (managers)", description = "The message of emails sent to the managers when the status of their flow instance changes", required = true)
	@XSLVariable(prefix = "java.")
	private String statusChangedManagerEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to managers when new flow instances are submitted", description = "Controls if email messages are the sent to managers when new flow instances are submitted.")
	private boolean sendFlowInstanceSubmittedManagerEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance submitted email subject (managers)", description = "The subject of emails sent to the managers when a new flow instance is submitted", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedManagerEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Flow instance submitted email message (managers)", description = "The message of emails sent to the managers when a new flow instance is submitted", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedManagerEmailMessage;



	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Send email to the specified address when new flow instances are submitted", description = "Controls if email messages are the sent to specified address when new flow instances are submitted.")
	private boolean sendFlowInstanceSubmittedGlobalEmail;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance submitted email subject (global)", description = "The subject of emails sent when a new flow instance is submitted", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedGlobalEmailSubject;

	@ModuleSetting
	@HTMLEditorSettingDescriptor(name = "Flow instance submitted email message (global)", description = "The message of emails sent when a new flow instance is submitted", required = true)
	@XSLVariable(prefix = "java.")
	private String flowInstanceSubmittedGlobalEmailMessage;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "Flow instance submitted email address (global)", description = "Global address to be notified when new flow instances are submitted", formatValidator=EmailPopulator.class)
	private String flowInstanceSubmittedGlobalEmailAddress;

	@ModuleSetting
	@CheckboxSettingDescriptor(name = "Attach PDF to flow instance submitted emails (global)", description = "Controls if generated PDF documents are attached to email messages when new flow instances are submitted.")
	private boolean flowInstanceSubmittedGlobalEmailAttachPDF;

	@ModuleSetting
	@TextFieldSettingDescriptor(name="PDF size limit for flow instance submitted emails (global)", description="The size limit in megabyte for PDF documents attached to email messages when new flow instances are submitted. If this size is exceeded no PDF is attached. No value set means no size limit.")
	private Integer flowInstanceSubmittedGlobalEmailPDFSizeLimit;

	@ModuleSetting
	@TextFieldSettingDescriptor(name = "PDF filename (without file extension)", description = "Filename of the attached PDF (without file extension). Available tags: $flow.name, $flow.version, $flowInstance.flowInstanceID, $poster.*", required = true)
	protected String pdfFilename = "$flow.name, $flowInstance.flowInstanceID";	
	
	@InstanceManagerDependency
	protected PDFProvider pdfProvider;

	@InstanceManagerDependency
	protected SMSSender smsSender;

	@InstanceManagerDependency(required = true)
	protected QueryHandler queryHandler;

	private AnnotatedDAOWrapper<FlowFamililyNotificationSettings, Integer> notificationSettingsDAO;
	private AnnotatedDAOWrapper<FlowFamily, Integer> flowFamilyDAO;

	private AnnotatedDAO<FlowInstance> flowInstanceDAO;

	protected QueryParameterFactory<FlowInstance, Integer> flowInstanceIDParamFactory;
	protected QueryParameterFactory<QueryInstanceDescriptor, Integer> queryInstanceDescriptorFlowInstanceIDParamFactory;

	private ModuleViewFragmentTransformer<ForegroundModuleDescriptor> viewFragmentTransformer;

	@Override
	public void init(ForegroundModuleDescriptor moduleDescriptor, SectionInterface sectionInterface, DataSource dataSource) throws Exception {

		super.init(moduleDescriptor, sectionInterface, dataSource);

		if(!systemInterface.getInstanceHandler().addInstance(FlowNotificationHandler.class, this)){

			throw new RuntimeException("Unable to register module in global instance handler using key " + FlowNotificationHandler.class.getSimpleName() + ", another instance is already registered using this key.");
		}

		if(!systemInterface.getInstanceHandler().addInstance(StandardFlowNotificationHandler.class, this)){

			throw new RuntimeException("Unable to register module in global instance handler using key " + StandardFlowNotificationHandler.class.getSimpleName() + ", another instance is already registered using this key.");
		}
		
		this.viewFragmentTransformer = new ModuleViewFragmentTransformer<ForegroundModuleDescriptor>(sectionInterface.getModuleXSLTCache(), this, systemInterface.getEncoding());

		this.viewFragmentTransformer.setDebugXML(debugFragmententXML);
	}

	@Override
	public void update(ForegroundModuleDescriptor descriptor, DataSource dataSource) throws Exception {

		super.update(descriptor, dataSource);

		this.viewFragmentTransformer.setDebugXML(debugFragmententXML);
	}

	@Override
	public void unload() throws Exception {

		if(this.equals(systemInterface.getInstanceHandler().getInstance(FlowNotificationHandler.class))){

			systemInterface.getInstanceHandler().removeInstance(FlowNotificationHandler.class);
		}

		if(this.equals(systemInterface.getInstanceHandler().getInstance(StandardFlowNotificationHandler.class))){

			systemInterface.getInstanceHandler().removeInstance(StandardFlowNotificationHandler.class);
		}
		
		super.unload();
	}

	@Override
	protected void createDAOs(DataSource dataSource) throws Exception {

		//Automatic table version handling
		UpgradeResult upgradeResult = TableVersionHandler.upgradeDBTables(dataSource, StandardFlowNotificationHandler.class.getName(), new XMLDBScriptProvider(this.getClass().getResourceAsStream("DB script.xml")));

		if(upgradeResult.isUpgrade()){

			log.info(upgradeResult.toString());
		}

		SimpleAnnotatedDAOFactory daoFactory = new SimpleAnnotatedDAOFactory(dataSource);

		notificationSettingsDAO = daoFactory.getDAO(FlowFamililyNotificationSettings.class).getWrapper(Integer.class);

		FlowEngineDAOFactory flowEngineDAOFactory = new FlowEngineDAOFactory(dataSource, systemInterface.getUserHandler(), systemInterface.getGroupHandler());

		flowInstanceDAO = flowEngineDAOFactory.getFlowInstanceDAO();
		flowInstanceIDParamFactory = flowInstanceDAO.getParamFactory("flowInstanceID", Integer.class);
		queryInstanceDescriptorFlowInstanceIDParamFactory = flowEngineDAOFactory.getQueryInstanceDescriptorDAO().getParamFactory("flowInstanceID", Integer.class);

		flowFamilyDAO = flowEngineDAOFactory.getFlowFamilyDAO().getWrapper(Integer.class);
		flowFamilyDAO.addRelations(FlowFamily.MANAGER_USERS_RELATION, FlowFamily.MANAGER_GROUPS_RELATION);
		flowFamilyDAO.setUseRelationsOnGet(true);
	}

	@EventListener(channel = FlowFamily.class)
	public void processEvent(CRUDEvent<FlowFamily> event, EventSource eventSource) {

		if(event.getAction() == CRUDAction.DELETE){

			for(FlowFamily flowFamily : event.getBeans()){

				log.info("Deleteing notification settings for flowFamiliyID: " + flowFamily.getFlowFamilyID());

				try{
					notificationSettingsDAO.deleteByID(flowFamily.getFlowFamilyID());

				}catch(SQLException e){

					log.error("Error deleteing notification settings for flowFamiliyID: " + flowFamily.getFlowFamilyID(), e);
				}
			}
		}
	}

	@Override
	public ViewFragment getCurrentSettingsView(ImmutableFlow flow, HttpServletRequest req, User user, URIParser uriParser) throws SQLException, TransformerConfigurationException, TransformerException {

		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(flow);

		Document doc = createDocument(req, uriParser);

		Element showSettingsElement = doc.createElement("ShowSettings");
		doc.getDocumentElement().appendChild(showSettingsElement);

		showSettingsElement.appendChild(notificationSettings.toXML(doc));

		return viewFragmentTransformer.createViewFragment(doc);
	}

	@Override
	public ViewFragment getUpdateSettingsView(ImmutableFlow flow, HttpServletRequest req, User user, URIParser uriParser, ValidationException validationException) throws TransformerConfigurationException, TransformerException, SQLException {

		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(flow);

		Document doc = createDocument(req, uriParser);

		Element updateSettingsElement = doc.createElement("UpdateSettings");
		doc.getDocumentElement().appendChild(updateSettingsElement);

		updateSettingsElement.appendChild(notificationSettings.toXML(doc));

		if(validationException != null){

			updateSettingsElement.appendChild(validationException.toXML(doc));
			updateSettingsElement.appendChild(RequestUtils.getRequestParameters(req, doc));
		}

		return viewFragmentTransformer.createViewFragment(doc);
	}

	@Override
	public void updateSettings(ImmutableFlow flow, HttpServletRequest req, User user, URIParser uriParser) throws ValidationException, Exception {

		if(req.getParameter("reset") != null){

			this.notificationSettingsDAO.deleteByID(flow.getFlowFamily().getFlowFamilyID());
			return;
		}

		FlowFamililyNotificationSettings notificationSettings = POPULATOR.populate(req);

		//Remove texts if they are set to default values
		if(notificationSettings.getFlowInstanceArchivedUserEmailMessage() != null && notificationSettings.getFlowInstanceArchivedUserEmailMessage().equals(flowInstanceArchivedUserEmailMessage)){

			notificationSettings.setFlowInstanceArchivedUserEmailMessage(null);
		}

		if(notificationSettings.getFlowInstanceArchivedUserEmailSubject() != null && notificationSettings.getFlowInstanceArchivedUserEmailSubject().equals(flowInstanceArchivedUserEmailSubject)){

			notificationSettings.setFlowInstanceArchivedUserEmailSubject(null);
		}

		if(notificationSettings.getFlowInstanceSubmittedUserEmailMessage() != null && notificationSettings.getFlowInstanceSubmittedUserEmailMessage().equals(flowInstanceSubmittedUserEmailMessage)){

			notificationSettings.setFlowInstanceSubmittedUserEmailMessage(null);
		}

		if(notificationSettings.getFlowInstanceSubmittedUserEmailSubject() != null && notificationSettings.getFlowInstanceSubmittedUserEmailSubject().equals(flowInstanceSubmittedUserEmailSubject)){

			notificationSettings.setFlowInstanceSubmittedUserEmailSubject(null);
		}

		notificationSettings.setFlowFamilyID(flow.getFlowFamily().getFlowFamilyID());

		notificationSettingsDAO.getAnnotatedDAO().addOrUpdate(notificationSettings, null);
	}

	private FlowFamililyNotificationSettings getNotificationSettings(ImmutableFlow flow) throws SQLException {

		FlowFamililyNotificationSettings notificationSettings = notificationSettingsDAO.get(flow.getFlowFamily().getFlowFamilyID());

		if(notificationSettings != null){

			if(notificationSettings.getFlowInstanceArchivedUserEmailMessage() == null){

				notificationSettings.setFlowInstanceArchivedUserEmailMessage(flowInstanceArchivedUserEmailMessage);
			}

			if(notificationSettings.getFlowInstanceArchivedUserEmailSubject() == null){

				notificationSettings.setFlowInstanceArchivedUserEmailSubject(flowInstanceArchivedUserEmailSubject);
			}

			if(notificationSettings.getFlowInstanceSubmittedUserEmailMessage() == null){

				notificationSettings.setFlowInstanceSubmittedUserEmailMessage(flowInstanceSubmittedUserEmailMessage);
			}

			if(notificationSettings.getFlowInstanceSubmittedUserEmailSubject() == null){

				notificationSettings.setFlowInstanceSubmittedUserEmailSubject(flowInstanceSubmittedUserEmailSubject);
			}

			return notificationSettings;
		}

		notificationSettings = new FlowFamililyNotificationSettings();

		notificationSettings.setFlowInstanceArchivedUserEmailMessage(flowInstanceArchivedUserEmailMessage);
		notificationSettings.setFlowInstanceArchivedUserEmailSubject(flowInstanceArchivedUserEmailSubject);
		notificationSettings.setFlowInstanceSubmittedUserEmailMessage(flowInstanceSubmittedUserEmailMessage);
		notificationSettings.setFlowInstanceSubmittedUserEmailSubject(flowInstanceSubmittedUserEmailSubject);
		notificationSettings.setSendExternalMessageReceivedManagerEmail(sendExternalMessageReceivedManagerEmail);
		notificationSettings.setSendExternalMessageReceivedUserEmail(sendExternalMessageReceivedUserEmail);
		notificationSettings.setSendExternalMessageReceivedUserSMS(sendExternalMessageReceivedUserSMS);
		notificationSettings.setSendFlowInstanceAssignedManagerEmail(sendFlowInstanceAssignedManagerEmail);
		notificationSettings.setSendFlowInstanceArchivedUserEmail(sendFlowInstanceArchivedUserEmail);
		notificationSettings.setSendFlowInstanceArchivedUserSMS(sendFlowInstanceArchivedUserSMS);
		notificationSettings.setSendStatusChangedManagerEmail(sendStatusChangedManagerEmail);
		notificationSettings.setSendFlowInstanceSubmittedManagerEmail(sendFlowInstanceSubmittedManagerEmail);
		notificationSettings.setSendFlowInstanceSubmittedUserEmail(sendFlowInstanceSubmittedUserEmail);
		notificationSettings.setSendFlowInstanceSubmittedUserSMS(sendFlowInstanceSubmittedUserSMS);
		notificationSettings.setSendStatusChangedManagerEmail(sendStatusChangedManagerEmail);
		notificationSettings.setSendStatusChangedUserEmail(sendStatusChangedUserEmail);
		notificationSettings.setSendStatusChangedUserSMS(sendStatusChangedUserSMS);
		notificationSettings.setSendFlowInstanceSubmittedGlobalEmail(sendFlowInstanceSubmittedGlobalEmail);
		notificationSettings.setFlowInstanceSubmittedGlobalEmailAddress(flowInstanceSubmittedGlobalEmailAddress);

		return notificationSettings;
	}

	public Document createDocument(HttpServletRequest req, URIParser uriParser) {

		Document doc = XMLUtils.createDomDocument();
		Element document = doc.createElement("Document");
		document.appendChild(RequestUtils.getRequestInfoAsXML(doc, req, uriParser));
		document.appendChild(this.sectionInterface.getSectionDescriptor().toXML(doc));
		document.appendChild(this.moduleDescriptor.toXML(doc));

		doc.appendChild(document);

		return doc;
	}

	public boolean equalsDefaultValues(FlowFamililyNotificationSettings other) {

		if(flowInstanceArchivedUserEmailMessage == null){

			if(other.getFlowInstanceArchivedUserEmailMessage() != null){
				return false;
			}

		}else if(!flowInstanceArchivedUserEmailMessage.equals(other.getFlowInstanceArchivedUserEmailMessage())){

			return false;
		}

		if(flowInstanceArchivedUserEmailSubject == null){

			if(other.getFlowInstanceArchivedUserEmailSubject() != null){
				return false;
			}

		}else if(!flowInstanceArchivedUserEmailSubject.equals(other.getFlowInstanceArchivedUserEmailSubject())){

			return false;
		}

		if(flowInstanceSubmittedGlobalEmailAddress == null){

			if(other.getFlowInstanceSubmittedGlobalEmailAddress() != null){
				return false;
			}

		}else if(!flowInstanceSubmittedGlobalEmailAddress.equals(other.getFlowInstanceSubmittedGlobalEmailAddress())){

			return false;
		}

		if(flowInstanceSubmittedUserEmailMessage == null){

			if(other.getFlowInstanceSubmittedUserEmailMessage() != null){
				return false;
			}

		}else if(!flowInstanceSubmittedUserEmailMessage.equals(other.getFlowInstanceSubmittedUserEmailMessage())){

			return false;
		}

		if(flowInstanceSubmittedUserEmailSubject == null){

			if(other.getFlowInstanceSubmittedUserEmailSubject() != null){
				return false;
			}

		}else if(!flowInstanceSubmittedUserEmailSubject.equals(other.getFlowInstanceSubmittedUserEmailSubject())){

			return false;
		}

		if(sendExternalMessageReceivedManagerEmail != other.isSendExternalMessageReceivedManagerEmail()){
			return false;
		}

		if(sendExternalMessageReceivedUserEmail != other.isSendExternalMessageReceivedUserEmail()){
			return false;
		}

		if(sendExternalMessageReceivedUserSMS != other.isSendExternalMessageReceivedUserSMS()){
			return false;
		}

		if(sendFlowInstanceArchivedUserEmail != other.isSendFlowInstanceArchivedUserEmail()){
			return false;
		}

		if(sendFlowInstanceArchivedUserSMS != other.isSendFlowInstanceArchivedUserSMS()){
			return false;
		}

		if(sendFlowInstanceAssignedManagerEmail != other.isSendFlowInstanceAssignedManagerEmail()){
			return false;
		}

		if(sendFlowInstanceSubmittedManagerEmail != other.isSendFlowInstanceSubmittedManagerEmail()){
			return false;
		}

		if(sendFlowInstanceSubmittedUserEmail != other.isSendFlowInstanceSubmittedUserEmail()){
			return false;
		}

		if(sendFlowInstanceSubmittedUserSMS != other.isSendFlowInstanceSubmittedUserSMS()){
			return false;
		}

		if(sendStatusChangedManagerEmail != other.isSendStatusChangedManagerEmail()){
			return false;
		}

		if(sendStatusChangedUserEmail != other.isSendStatusChangedUserEmail()){
			return false;
		}

		if(sendStatusChangedUserSMS != other.isSendStatusChangedUserSMS()){
			return false;
		}

		if(sendFlowInstanceSubmittedGlobalEmail != other.isSendFlowInstanceSubmittedGlobalEmail()){
			return false;
		}
		
		if(flowInstanceSubmittedGlobalEmailAttachPDF != other.isFlowInstanceSubmittedGlobalEmailAttachPDF()){
			return false;
		}

		return true;
	}

	@WebPublic(alias = "globalmailsubmit")
	public ForegroundModuleResponse triggerGlobalSubmit(HttpServletRequest req, HttpServletResponse res, User user, URIParser uriParser) throws ModuleConfigurationException, SQLException, AccessDeniedException, IOException, URINotFoundException {
		
		Integer flowInstanceID = uriParser.getInt(2);
		Integer eventID = uriParser.getInt(3);
		
		if(flowInstanceID == null || eventID == null){
			
			throw new URINotFoundException(uriParser);
		}
		
		FlowInstance flowInstance = getFlowInstance(flowInstanceID);
		
		if(flowInstance == null){
			
			throw new URINotFoundException(uriParser);
		}
		
		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(flowInstance.getFlow());
		
		if(notificationSettings.isSendFlowInstanceSubmittedGlobalEmail() && notificationSettings.getFlowInstanceSubmittedGlobalEmailAddress() != null){
			
			String filename = null;
			File pdfFile = null;
			
			if(notificationSettings.isFlowInstanceSubmittedGlobalEmailAttachPDF() && pdfProvider != null){
				
				pdfFile = pdfProvider.getPDF(flowInstanceID, eventID);
				
				if(pdfFile != null){
					
					if(flowInstanceSubmittedGlobalEmailPDFSizeLimit == null || flowInstanceSubmittedGlobalEmailPDFSizeLimit >= (pdfFile.length() * BinarySizes.MegaByte)){
						
						filename = pdfFilename;
						
					}else{

						pdfFile = null;
						
						log.warn("PDF file for flow instance " + flowInstance + " exceeds the size limit of " + flowInstanceSubmittedGlobalEmailPDFSizeLimit + " MB set for global email submit notifications and will not be attached to the generated email.");
					}
				}
			}
			
			sendGlobalEmail(flowInstance, notificationSettings.getFlowInstanceSubmittedGlobalEmailAddress(), flowInstanceSubmittedGlobalEmailSubject, flowInstanceSubmittedGlobalEmailMessage, filename, pdfFile);
			
			return new SimpleForegroundModuleResponse("Global email notification triggered for flow instance " + flowInstance);	
		}
		
		return new SimpleForegroundModuleResponse("Global email notifications are disabled for flow " + flowInstance.getFlow());
	}
	
	@EventListener(channel=FlowInstanceManager.class, priority = 50)
	public void processEvent(SubmitEvent event, EventSource eventSource) throws SQLException{

		if(event.getActionID() != null && (event.getActionID().equals(FlowBrowserModule.SUBMIT_ACTION_ID))){

			FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(event.getFlowInstanceManager().getFlowInstance().getFlow());

			Contact contact = getContact(event.getFlowInstanceManager());

			ImmutableFlowInstance flowInstance = event.getFlowInstanceManager().getFlowInstance();

			if(contact != null){

				if(contact.getMobilePhone() != null && notificationSettings.isSendFlowInstanceSubmittedUserSMS()){

					sendContactSMS(flowInstance, contact, flowInstanceSubmittedUserSMS);
				}

				if(contact.getEmail() != null && notificationSettings.isSendFlowInstanceSubmittedUserEmail()){

					sendContactEmail(flowInstance, contact, notificationSettings.getFlowInstanceSubmittedUserEmailSubject(), notificationSettings.getFlowInstanceSubmittedUserEmailMessage());
				}
			}


			if(notificationSettings.isSendFlowInstanceSubmittedManagerEmail()){

				sendManagerEmails(flowInstance, flowInstanceSubmittedManagerEmailSubject, flowInstanceSubmittedManagerEmailMessage, null, true);
			}

			if(notificationSettings.isSendFlowInstanceSubmittedGlobalEmail() && notificationSettings.getFlowInstanceSubmittedGlobalEmailAddress() != null){

				String filename = null;
				File pdfFile = null;
				
				if(notificationSettings.isFlowInstanceSubmittedGlobalEmailAttachPDF() && pdfProvider != null){
					
					pdfFile = pdfProvider.getPDF(flowInstance.getFlowInstanceID(), event.getEvent().getEventID());
					
					if(pdfFile != null){
						
						if(flowInstanceSubmittedGlobalEmailPDFSizeLimit == null || flowInstanceSubmittedGlobalEmailPDFSizeLimit >= (pdfFile.length() * BinarySizes.MegaByte)){
							
							filename = pdfFilename;
							
						}else{

							pdfFile = null;
							
							log.warn("PDF file for flow instance " + flowInstance + " exceeds the size limit of " + flowInstanceSubmittedGlobalEmailPDFSizeLimit + " MB set for global email submit notifications and will not be attached to the generated email.");
						}
					}
				}
				
				sendGlobalEmail(flowInstance, notificationSettings.getFlowInstanceSubmittedGlobalEmailAddress(), flowInstanceSubmittedGlobalEmailSubject, flowInstanceSubmittedGlobalEmailMessage, filename, pdfFile);
			}


		}else if(event.getActionID() != null){

			log.warn("Submit event received with unsupported action ID: " + event.getActionID());
		}
	}

	@EventListener(channel=FlowInstance.class)
	public void processEvent(ExternalMessageAddedEvent event, EventSource eventSource) throws SQLException{

		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(event.getFlowInstance().getFlow());

		if(event.getSenderType() == SenderType.MANAGER){

			//System.out.println("Trigger manager added external message event for " + event.getFlowInstance());

			if(notificationSettings.isSendExternalMessageReceivedUserEmail() || notificationSettings.isSendExternalMessageReceivedUserSMS()){

				Contact contact = getContact(event.getFlowInstance(), event.getSiteProfile());

				if(contact != null){

					if(notificationSettings.isSendExternalMessageReceivedUserEmail()){

						sendContactEmail(event.getFlowInstance(), contact, externalMessageReceivedUserEmailSubject, externalMessageReceivedUserEmailMessage);
					}

					if(notificationSettings.isSendExternalMessageReceivedUserSMS()){

						sendContactSMS(event.getFlowInstance(), contact, externalMessageReceivedUserSMS);
					}
				}
			}

		}else if(event.getSenderType() == SenderType.USER){

			//System.out.println("Trigger user added external message event for " + event.getFlowInstance());

			if(notificationSettings.isSendExternalMessageReceivedManagerEmail()){

				sendManagerEmails(event.getFlowInstance(), externalMessageReceivedManagerEmailSubject, externalMessageReceivedManagerEmailMessage, null, false);
			}

		}else{

			log.warn("External message added event received with unsupported sender type: " + event.getSenderType());
		}


	}

	@EventListener(channel=FlowInstance.class)
	public void processEvent(StatusChangedByManagerEvent event, EventSource eventSource) throws SQLException{

		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(event.getFlowInstance().getFlow());

		//Check which type of notification the contact should get
		if(event.getPreviousStatus().getContentType() != ContentType.ARCHIVED && event.getFlowInstance().getStatus().getContentType() == ContentType.ARCHIVED){

			//System.out.println("Trigger flow instance archived event for " + event.getFlowInstance());

			if(notificationSettings.isSendFlowInstanceArchivedUserEmail() || notificationSettings.isSendFlowInstanceArchivedUserSMS()){

				Contact contact = getContact(event.getFlowInstance(), event.getSiteProfile());

				if(contact != null){

					if(notificationSettings.isSendFlowInstanceArchivedUserEmail()){

						sendContactEmail(event.getFlowInstance(), contact, notificationSettings.getFlowInstanceArchivedUserEmailSubject(), notificationSettings.getFlowInstanceArchivedUserEmailMessage());
					}

					if(notificationSettings.isSendFlowInstanceArchivedUserSMS()){

						sendContactSMS(event.getFlowInstance(), contact, flowInstanceArchivedUserSMS);
					}
				}
			}

		}else{

			//System.out.println("Trigger status changed event for " + event.getFlowInstance());

			if(notificationSettings.isSendStatusChangedUserEmail() || notificationSettings.isSendStatusChangedUserSMS()){

				Contact contact = getContact(event.getFlowInstance(), event.getSiteProfile());

				if(contact != null){

					if(notificationSettings.isSendStatusChangedUserEmail()){

						sendContactEmail(event.getFlowInstance(), contact, statusChangedUserEmailSubject, statusChangedUserEmailMessage);
					}

					if(notificationSettings.isSendStatusChangedUserSMS()){

						sendContactSMS(event.getFlowInstance(), contact, statusChangedUserSMS);
					}
				}
			}
		}

		if(notificationSettings.isSendStatusChangedManagerEmail()){

			sendManagerEmails(event.getFlowInstance(), statusChangedManagerEmailSubject, statusChangedManagerEmailMessage, CollectionUtils.getList(event.getUser()), false);
		}
	}

	@EventListener(channel=FlowInstance.class)
	public void processEvent(ManagersChangedEvent event, EventSource eventSource) throws SQLException{

		FlowFamililyNotificationSettings notificationSettings = getNotificationSettings(event.getFlowInstance().getFlow());

		if(notificationSettings.isSendFlowInstanceAssignedManagerEmail()){

			List<User> excludedManagers = new ArrayList<User>();

			if(event.getPreviousManagers() != null){

				excludedManagers.addAll(event.getPreviousManagers());
			}

			if(event.getUser() != null){

				excludedManagers.add(event.getUser());
			}

			sendManagerEmails(event.getFlowInstance(), flowInstanceAssignedManagerEmailSubject, flowInstanceAssignedManagerEmailMessage, excludedManagers, false);
		}
	}

	@Override
	public ForegroundModuleDescriptor getModuleDescriptor() {

		return moduleDescriptor;
	}

	@Override
	public List<LinkTag> getLinkTags() {

		return links;
	}

	@Override
	public List<ScriptTag> getScriptTags() {

		return scripts;
	}

	private void sendContactEmail(ImmutableFlowInstance flowInstance, Contact contact, String subject, String message) {

		if(contact.getEmail() == null || subject == null || message == null){

			return;
		}

		TagReplacer tagReplacer = new TagReplacer();

		tagReplacer.addTagSource(FLOWINSTANCE_TAG_SOURCE_FACTORY.getTagSource((FlowInstance)flowInstance));
		tagReplacer.addTagSource(FLOW_TAG_SOURCE_FACTORY.getTagSource((Flow)flowInstance.getFlow()));
		tagReplacer.addTagSource(STATUS_TAG_SOURCE_FACTORY.getTagSource((Status)flowInstance.getStatus()));
		tagReplacer.addTagSource(CONTACT_TAG_SOURCE_FACTORY.getTagSource(contact));
		tagReplacer.addTagSource(new SingleTagSource("$flowInstance.url",userFlowInstanceModuleAlias + "/overview/" + flowInstance.getFlow().getFlowID() + "/" + flowInstance.getFlowInstanceID()));

		SimpleEmail email = new SimpleEmail();

		try{
			email.addRecipient(contact.getEmail());
			email.setMessageContentType(SimpleEmail.HTML);
			email.setSenderName(emailSenderName);
			email.setSenderAddress(emailSenderAddress);
			email.setSubject(tagReplacer.replace(subject));
			email.setMessage(tagReplacer.replace(message));

			systemInterface.getEmailHandler().send(email);

		}catch(Exception e){

			log.info("Error generating/sending email " + email, e);
		}
	}

	private void sendContactSMS(ImmutableFlowInstance flowInstance, Contact contact, String message) {

		if(contact.getMobilePhone() == null || smsSender == null || message == null){

			return;
		}

		TagReplacer tagReplacer = new TagReplacer();

		tagReplacer.addTagSource(FLOWINSTANCE_TAG_SOURCE_FACTORY.getTagSource((FlowInstance)flowInstance));
		tagReplacer.addTagSource(FLOW_TAG_SOURCE_FACTORY.getTagSource((Flow)flowInstance.getFlow()));
		tagReplacer.addTagSource(STATUS_TAG_SOURCE_FACTORY.getTagSource((Status)flowInstance.getStatus()));
		tagReplacer.addTagSource(CONTACT_TAG_SOURCE_FACTORY.getTagSource(contact));
		tagReplacer.addTagSource(new SingleTagSource("$flowInstance.url",userFlowInstanceModuleAlias + "/overview/" + flowInstance.getFlow().getFlowID() + "/" + flowInstance.getFlowInstanceID()));

		SimpleSMS simpleSMS = new SimpleSMS();

		try{
			simpleSMS.setSenderName(smsSenderName);
			simpleSMS.setMessage(tagReplacer.replace(message));
//			simpleSMS.addRecipient(contact.getMobilePhone());
			simpleSMS.setRecipients(Arrays.asList(contact.getMobilePhone()));
			smsSender.send(simpleSMS);

		}catch(Exception e){

			log.info("Error generating/sending sms " + simpleSMS, e);
		}
	}

	private void sendManagerEmails(ImmutableFlowInstance flowInstance, String subject, String message, List<User> excludedManagers, boolean useFlowFamilyManagers) throws SQLException {

		if(subject == null || message == null){

			return;
		}

		List<User> managers;

		if(useFlowFamilyManagers){

			managers = getFlowFamilyManagers(flowInstance.getFlow().getFlowFamily().getFlowFamilyID());

		}else{

			managers = getCurrentManagers(flowInstance.getFlowInstanceID());
		}

		if(managers == null || (excludedManagers != null && excludedManagers.containsAll(managers))){

			return;
		}

		if(excludedManagers != null){

			managers.removeAll(excludedManagers);
		}

		List<TagSource> sharedTagSources = new ArrayList<TagSource>(4);

		sharedTagSources.add(FLOWINSTANCE_TAG_SOURCE_FACTORY.getTagSource((FlowInstance)flowInstance));
		sharedTagSources.add(FLOW_TAG_SOURCE_FACTORY.getTagSource((Flow)flowInstance.getFlow()));
		sharedTagSources.add(STATUS_TAG_SOURCE_FACTORY.getTagSource((Status)flowInstance.getStatus()));
		sharedTagSources.add(new SingleTagSource("$flowInstance.url",flowInstanceAdminModuleAlias + "/overview/" + flowInstance.getFlowInstanceID()));

		if(flowInstance.getPoster() != null){

			sharedTagSources.add(POSTER_TAG_SOURCE_FACTORY.getTagSource(flowInstance.getPoster()));
		}

		for(User manager : managers){

			TagReplacer tagReplacer = new TagReplacer();

			tagReplacer.addTagSource(MANAGER_TAG_SOURCE_FACTORY.getTagSource(manager));
			tagReplacer.addTagSources(sharedTagSources);

			SimpleEmail email = new SimpleEmail();

			try{
				email.addRecipient(manager.getEmail());
				email.setMessageContentType(SimpleEmail.HTML);
				email.setSenderName(emailSenderName);
				email.setSenderAddress(emailSenderAddress);
				email.setSubject(tagReplacer.replace(subject));
				email.setMessage(tagReplacer.replace(message));

				systemInterface.getEmailHandler().send(email);

			}catch(Exception e){

				log.info("Error generating/sending email " + email, e);
			}
		}
	}

	private void sendGlobalEmail(ImmutableFlowInstance flowInstance, String address, String subject, String message, String fileName, File file) {

		if(subject == null || message == null){

			return;
		}

		TagReplacer tagReplacer = new TagReplacer();

		tagReplacer.addTagSource(FLOWINSTANCE_TAG_SOURCE_FACTORY.getTagSource((FlowInstance)flowInstance));
		tagReplacer.addTagSource(FLOW_TAG_SOURCE_FACTORY.getTagSource((Flow)flowInstance.getFlow()));
		tagReplacer.addTagSource(STATUS_TAG_SOURCE_FACTORY.getTagSource((Status)flowInstance.getStatus()));
		tagReplacer.addTagSource(new SingleTagSource("$flowInstance.url",flowInstanceAdminModuleAlias + "/overview/" + flowInstance.getFlowInstanceID()));

		if(flowInstance.getPoster() != null){

			tagReplacer.addTagSource(POSTER_TAG_SOURCE_FACTORY.getTagSource(flowInstance.getPoster()));
		}

		SimpleEmail email = new SimpleEmail();

		try{
			email.addRecipient(address);
			email.setMessageContentType(SimpleEmail.HTML);
			email.setSenderName(emailSenderName);
			email.setSenderAddress(emailSenderAddress);
			email.setSubject(tagReplacer.replace(subject));
			email.setMessage(tagReplacer.replace(message));

			if(fileName != null && file != null){
				
				String generatedFilename = tagReplacer.replace(pdfFilename) + ".pdf";

				email.add(new FileAttachment(file, FileUtils.toValidHttpFilename(generatedFilename)));
			}
			
			systemInterface.getEmailHandler().send(email);

		}catch(Exception e){

			log.info("Error generating/sending email " + email, e);
		}

	}

	private List<User> getFlowFamilyManagers(Integer flowFamilyID) throws SQLException {

		FlowFamily flowFamily = flowFamilyDAO.get(flowFamilyID);

		if(flowFamily != null){

			List<User> managers = null;

			if(flowFamily.getManagerUserIDs() != null){

				managers = systemInterface.getUserHandler().getUsers(flowFamily.getAllowedUserIDs(), false, true);
			}

			if(flowFamily.getManagerGroupIDs() != null){

				List<User> groupUsers = systemInterface.getUserHandler().getUsersByGroups(flowFamily.getManagerGroupIDs(), true);

				if(managers != null){

					CollectionUtils.addNewEntries(managers, groupUsers);

					return managers;
				}

				return groupUsers;
			}
		}

		return null;
	}

	private List<User> getCurrentManagers(Integer flowInstanceID) throws SQLException {

		FlowInstance flowInstance = getFlowInstance(flowInstanceID);

		if(flowInstance != null){

			return flowInstance.getManagers();
		}

		return null;
	}

	private Contact getContact(FlowInstance flowInstance, SiteProfile siteProfile) {

		try{
			flowInstance = getFlowInstance(flowInstance.getFlowInstanceID());

			if(flowInstance == null){

				return null;
			}

			ImmutableFlowInstanceManager instanceManager = new ImmutableFlowInstanceManager(flowInstance, queryHandler, null, new DefaultInstanceMetadata(siteProfile));

			return getContact(instanceManager);

		}catch(Exception e){

			log.error("Error creating immutable flow instance manager for flow instance " + flowInstance, e);
		}

		return null;
	}

	private FlowInstance getFlowInstance(Integer flowInstanceID) throws SQLException {

		HighLevelQuery<FlowInstance> query = new HighLevelQuery<FlowInstance>(FLOW_INSTANCE_RELATIONS);

		query.addParameter(flowInstanceIDParamFactory.getParameter(flowInstanceID));

		query.addRelationParameter(QueryInstanceDescriptor.class, queryInstanceDescriptorFlowInstanceIDParamFactory.getParameter(flowInstanceID));

		return flowInstanceDAO.get(query);
	}

	private Contact getContact(FlowInstanceManager flowInstanceManager) {

		//TODO add support for contact person query

		ContactDetailQueryInstance contactDetailQueryInstance = flowInstanceManager.getQuery(ContactDetailQueryInstance.class);

		if(contactDetailQueryInstance != null && contactDetailQueryInstance.isPopulated() && contactDetailQueryInstance.getQueryInstanceDescriptor().getQueryState() != QueryState.HIDDEN){

			return new Contact(contactDetailQueryInstance.getFirstname(), contactDetailQueryInstance.getLastname(), contactDetailQueryInstance.getEmail(), contactDetailQueryInstance.getMobilePhone());
		}

		OrganizationDetailQueryInstance organizationDetailQueryInstance = flowInstanceManager.getQuery(OrganizationDetailQueryInstance.class);

		if(organizationDetailQueryInstance != null && organizationDetailQueryInstance.isPopulated() && organizationDetailQueryInstance.getQueryInstanceDescriptor().getQueryState() != QueryState.HIDDEN){

			return new Contact(organizationDetailQueryInstance.getFirstname(), organizationDetailQueryInstance.getLastname(), organizationDetailQueryInstance.getEmail(), organizationDetailQueryInstance.getMobilePhone());
		}

		return null;
	}
}
