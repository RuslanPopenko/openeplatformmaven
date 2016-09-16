package com.nordicpeak.flowengine.notifications;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import se.unlogic.emailutils.populators.EmailPopulator;
import se.unlogic.standardutils.annotations.RequiredIfSet;
import se.unlogic.standardutils.annotations.WebPopulate;
import se.unlogic.standardutils.dao.annotations.DAOManaged;
import se.unlogic.standardutils.dao.annotations.Key;
import se.unlogic.standardutils.dao.annotations.Table;
import se.unlogic.standardutils.xml.GeneratedElementable;
import se.unlogic.standardutils.xml.XMLElement;
import se.unlogic.standardutils.xml.XMLUtils;


@Table(name="flow_familiy_notification_settings")
@XMLElement(name="NotificationSettings")
public class FlowFamililyNotificationSettings extends GeneratedElementable{

	@DAOManaged
	@Key
	@XMLElement
	private Integer flowFamilyID;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendStatusChangedUserSMS;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendExternalMessageReceivedUserSMS;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceSubmittedUserSMS;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceArchivedUserSMS;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendStatusChangedUserEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendExternalMessageReceivedUserEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceSubmittedUserEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceArchivedUserEmail;

	@DAOManaged
	@WebPopulate(maxLength=255)
	@XMLElement
	private String flowInstanceSubmittedUserEmailSubject;

	@DAOManaged
	@WebPopulate(maxLength=65536)
	@XMLElement
	private String flowInstanceSubmittedUserEmailMessage;

	@DAOManaged
	@WebPopulate(maxLength=255)
	@XMLElement
	private String flowInstanceArchivedUserEmailSubject;

	@DAOManaged
	@WebPopulate(maxLength=65536)
	@XMLElement
	private String flowInstanceArchivedUserEmailMessage;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendExternalMessageReceivedManagerEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceAssignedManagerEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendStatusChangedManagerEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceSubmittedManagerEmail;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean sendFlowInstanceSubmittedGlobalEmail;

	@DAOManaged
	@WebPopulate(maxLength=255, populator=EmailPopulator.class)
	@RequiredIfSet(paramName="sendFlowInstanceSubmittedGlobalEmail")
	@XMLElement
	private String flowInstanceSubmittedGlobalEmailAddress;

	@DAOManaged
	@WebPopulate
	@XMLElement
	private boolean flowInstanceSubmittedGlobalEmailAttachPDF;
	
	public Integer getFlowFamilyID() {

		return flowFamilyID;
	}


	public void setFlowFamilyID(Integer flowFamilyID) {

		this.flowFamilyID = flowFamilyID;
	}


	public boolean isSendStatusChangedUserSMS() {

		return sendStatusChangedUserSMS;
	}


	public void setSendStatusChangedUserSMS(boolean sendStatusChangedUserSMS) {

		this.sendStatusChangedUserSMS = sendStatusChangedUserSMS;
	}


	public boolean isSendExternalMessageReceivedUserSMS() {

		return sendExternalMessageReceivedUserSMS;
	}


	public void setSendExternalMessageReceivedUserSMS(boolean sendExternalMessageReceivedUserSMS) {

		this.sendExternalMessageReceivedUserSMS = sendExternalMessageReceivedUserSMS;
	}


	public boolean isSendFlowInstanceSubmittedUserSMS() {

		return sendFlowInstanceSubmittedUserSMS;
	}


	public void setSendFlowInstanceSubmittedUserSMS(boolean sendFlowInstanceSubmittedUserSMS) {

		this.sendFlowInstanceSubmittedUserSMS = sendFlowInstanceSubmittedUserSMS;
	}


	public boolean isSendFlowInstanceArchivedUserSMS() {

		return sendFlowInstanceArchivedUserSMS;
	}


	public void setSendFlowInstanceArchivedUserSMS(boolean sendFlowInstanceArchivedUserSMS) {

		this.sendFlowInstanceArchivedUserSMS = sendFlowInstanceArchivedUserSMS;
	}


	public boolean isSendStatusChangedUserEmail() {

		return sendStatusChangedUserEmail;
	}


	public void setSendStatusChangedUserEmail(boolean sendStatusChangedUserEmail) {

		this.sendStatusChangedUserEmail = sendStatusChangedUserEmail;
	}


	public boolean isSendExternalMessageReceivedUserEmail() {

		return sendExternalMessageReceivedUserEmail;
	}


	public void setSendExternalMessageReceivedUserEmail(boolean sendExternalMessageReceivedUserEmail) {

		this.sendExternalMessageReceivedUserEmail = sendExternalMessageReceivedUserEmail;
	}


	public boolean isSendFlowInstanceSubmittedUserEmail() {

		return sendFlowInstanceSubmittedUserEmail;
	}


	public void setSendFlowInstanceSubmittedUserEmail(boolean sendFlowInstanceSubmittedUserEmail) {

		this.sendFlowInstanceSubmittedUserEmail = sendFlowInstanceSubmittedUserEmail;
	}


	public boolean isSendFlowInstanceArchivedUserEmail() {

		return sendFlowInstanceArchivedUserEmail;
	}


	public void setSendFlowInstanceArchivedUserEmail(boolean sendFlowInstanceArchivedUserEmail) {

		this.sendFlowInstanceArchivedUserEmail = sendFlowInstanceArchivedUserEmail;
	}


	public String getFlowInstanceSubmittedUserEmailSubject() {

		return flowInstanceSubmittedUserEmailSubject;
	}


	public void setFlowInstanceSubmittedUserEmailSubject(String flowInstanceSubmittedUserEmailSubject) {

		this.flowInstanceSubmittedUserEmailSubject = flowInstanceSubmittedUserEmailSubject;
	}


	public String getFlowInstanceSubmittedUserEmailMessage() {

		return flowInstanceSubmittedUserEmailMessage;
	}


	public void setFlowInstanceSubmittedUserEmailMessage(String flowInstanceSubmittedUserEmailMessage) {

		this.flowInstanceSubmittedUserEmailMessage = flowInstanceSubmittedUserEmailMessage;
	}


	public String getFlowInstanceArchivedUserEmailSubject() {

		return flowInstanceArchivedUserEmailSubject;
	}


	public void setFlowInstanceArchivedUserEmailSubject(String flowInstanceArchivedUserEmailSubject) {

		this.flowInstanceArchivedUserEmailSubject = flowInstanceArchivedUserEmailSubject;
	}


	public String getFlowInstanceArchivedUserEmailMessage() {

		return flowInstanceArchivedUserEmailMessage;
	}


	public void setFlowInstanceArchivedUserEmailMessage(String flowInstanceArchivedUserEmailMessage) {

		this.flowInstanceArchivedUserEmailMessage = flowInstanceArchivedUserEmailMessage;
	}


	public boolean isSendExternalMessageReceivedManagerEmail() {

		return sendExternalMessageReceivedManagerEmail;
	}


	public void setSendExternalMessageReceivedManagerEmail(boolean sendExternalMessageReceivedManagerEmail) {

		this.sendExternalMessageReceivedManagerEmail = sendExternalMessageReceivedManagerEmail;
	}


	public boolean isSendFlowInstanceAssignedManagerEmail() {

		return sendFlowInstanceAssignedManagerEmail;
	}


	public void setSendFlowInstanceAssignedManagerEmail(boolean sendFlowInstanceAssignedManagerEmail) {

		this.sendFlowInstanceAssignedManagerEmail = sendFlowInstanceAssignedManagerEmail;
	}


	public boolean isSendStatusChangedManagerEmail() {

		return sendStatusChangedManagerEmail;
	}


	public void setSendStatusChangedManagerEmail(boolean sendStatusChangedManagerEmail) {

		this.sendStatusChangedManagerEmail = sendStatusChangedManagerEmail;
	}


	public boolean isSendFlowInstanceSubmittedManagerEmail() {

		return sendFlowInstanceSubmittedManagerEmail;
	}


	public void setSendFlowInstanceSubmittedManagerEmail(boolean sendFlowInstanceSubmittedManagerEmail) {

		this.sendFlowInstanceSubmittedManagerEmail = sendFlowInstanceSubmittedManagerEmail;
	}

	@Override
	public Element toXML(Document doc) {

		Element settingsElement = super.toXML(doc);

		if(sendStatusChangedUserSMS ||	sendExternalMessageReceivedUserSMS || sendFlowInstanceSubmittedUserSMS || sendFlowInstanceArchivedUserSMS || sendStatusChangedUserEmail || sendExternalMessageReceivedUserEmail || sendFlowInstanceSubmittedUserEmail || sendFlowInstanceArchivedUserEmail){

			XMLUtils.appendNewElement(doc, settingsElement, "HasEnabledUserNotifications");
		}

		if(sendExternalMessageReceivedManagerEmail || sendFlowInstanceAssignedManagerEmail || sendStatusChangedManagerEmail || sendFlowInstanceSubmittedManagerEmail){

			XMLUtils.appendNewElement(doc, settingsElement, "HasEnabledManagerNotifications");
		}

		if(sendFlowInstanceSubmittedGlobalEmail){

			XMLUtils.appendNewElement(doc, settingsElement, "HasEnabledGlobalNotifications");
		}

		return settingsElement;
	}



	public boolean isSendFlowInstanceSubmittedGlobalEmail() {

		return sendFlowInstanceSubmittedGlobalEmail;
	}



	public void setSendFlowInstanceSubmittedGlobalEmail(boolean sendFlowInstanceSubmittedGlobalEmail) {

		this.sendFlowInstanceSubmittedGlobalEmail = sendFlowInstanceSubmittedGlobalEmail;
	}



	public String getFlowInstanceSubmittedGlobalEmailAddress() {

		return flowInstanceSubmittedGlobalEmailAddress;
	}



	public void setFlowInstanceSubmittedGlobalEmailAddress(String flowInstanceSubmittedGlobalEmailAddress) {

		this.flowInstanceSubmittedGlobalEmailAddress = flowInstanceSubmittedGlobalEmailAddress;
	}


	
	public boolean isFlowInstanceSubmittedGlobalEmailAttachPDF() {
	
		return flowInstanceSubmittedGlobalEmailAttachPDF;
	}


	
	public void setFlowInstanceSubmittedGlobalEmailAttachPDF(boolean flowInstanceSubmittedGlobalEmailAttachPDF) {
	
		this.flowInstanceSubmittedGlobalEmailAttachPDF = flowInstanceSubmittedGlobalEmailAttachPDF;
	}
}
