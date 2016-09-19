<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>

	<xsl:include href="StandardFlowNotificationHandlerTemplates.xsl"/>
	
	<xsl:variable name="java.statusChangedUserSMS">Statusen för ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har ändrats till $status.name</xsl:variable>
	<xsl:variable name="java.externalMessageReceivedUserSMS">Du har fått ett nytt meddelande kopplat till ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	
	<xsl:variable name="java.flowInstanceSubmittedUserSMS">Ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har skickats in.</xsl:variable>
	<xsl:variable name="java.flowInstanceArchivedUserSMS">Handläggningen av ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har slutförts.</xsl:variable>
	
	<xsl:variable name="java.statusChangedUserEmailSubject">Ny status för ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.statusChangedUserEmailMessage">
		
		&lt;p&gt;Hej $contact.firstname,&lt;/p&gt;
		
		&lt;p&gt;Statusen på ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har ändrats till $status.name.&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
		
	</xsl:variable>
	
	<xsl:variable name="java.externalMessageReceivedUserEmailSubject">Nytt meddelande kopplat till ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.externalMessageReceivedUserEmailMessage">
	
		&lt;p&gt;Hej $contact.firstname,&lt;/p&gt;
		
		&lt;p&gt;Du har fått ett nytt meddelande kopplat till ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID).&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.flowInstanceSubmittedUserEmailSubject">Ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har skickats in</xsl:variable>
	
	<xsl:variable name="java.flowInstanceSubmittedUserEmailMessage">
	
		&lt;p&gt;Hej $contact.firstname,&lt;/p&gt;
		
		&lt;p&gt;Här kommer en bekräftelse på att ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har skickats in.&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.flowInstanceArchivedUserEmailSubject">Handläggningen av ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har slutförts.</xsl:variable>
	<xsl:variable name="java.flowInstanceArchivedUserEmailMessage">
	
		&lt;p&gt;Hej $contact.firstname,&lt;/p&gt;
		
		&lt;p&gt;Handläggningen av ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har slutförts.&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.externalMessageReceivedManagerEmailSubject">Nytt meddelande kopplat till ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.externalMessageReceivedManagerEmailMessage">
	
		&lt;p&gt;Hej $manager.firstname,&lt;/p&gt;
		
		&lt;p&gt;Du har fått ett nytt meddelande kopplat till ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID).&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.flowInstanceAssignedManagerEmailSubject">Tilldelad ärende $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.flowInstanceAssignedManagerEmailMessage">
	
		&lt;p&gt;Hej $manager.firstname,&lt;/p&gt;
		
		&lt;p&gt;Du har tilldelats ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID).&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.statusChangedManagerEmailSubject">Statusen för ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) har ändrats till $status.name</xsl:variable>
	<xsl:variable name="java.statusChangedManagerEmailMessage">
	
		&lt;p&gt;Hej $manager.firstname,&lt;/p&gt;
		
		&lt;p&gt;Statusen på ärendet $flow.name (ärende nr. $flowInstance.flowInstanceID) som du är tilldelad har ändrats till $status.name.&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.flowInstanceSubmittedManagerEmailSubject">Nytt ärende $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.flowInstanceSubmittedManagerEmailMessage">
	
		&lt;p&gt;Hej,&lt;/p&gt;
		
		&lt;p&gt;Ett nytt ärende, $flow.name (ärende nr. $flowInstance.flowInstanceID) har skickats in av $poster.firstname $poster.lastname&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>
	
	<xsl:variable name="java.flowInstanceSubmittedGlobalEmailSubject">Nytt ärende $flow.name (ärende nr. $flowInstance.flowInstanceID)</xsl:variable>
	<xsl:variable name="java.flowInstanceSubmittedGlobalEmailMessage">
	
		&lt;p&gt;Hej,&lt;/p&gt;
		
		&lt;p&gt;Ett nytt ärende, $flow.name (ärende nr. $flowInstance.flowInstanceID) har skickats in av $poster.firstname $poster.lastname&lt;/p&gt;
		
		&lt;p&gt;Klicka på länken nedan för att visa ärendet:&lt;/p&gt;
		
		&lt;p&gt;
			&lt;a src="$flowInstance.url"&gt;$flowInstance.url&lt;/a&gt;
		&lt;/p&gt;
	
	</xsl:variable>	
	
	<xsl:variable name="i18n.UserNotifications">Notifikationer till medborgare</xsl:variable>
	<xsl:variable name="i18n.SendStatusChangedUserSMS">SMS vid byte av status</xsl:variable>
	<xsl:variable name="i18n.SendExternalMessageReceivedUserSMS">SMS vid nytt meddelande från handläggare</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceSubmittedUserSMS">SMS vid inskickat ärende</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceArchivedUserSMS">SMS vid avslutat ärende</xsl:variable>
	<xsl:variable name="i18n.SendStatusChangedUserEmail">E-post vid byte av status</xsl:variable>
	<xsl:variable name="i18n.SendExternalMessageReceivedUserEmail">E-post vid nytt meddelande från handläggare</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceSubmittedUserEmail">E-post vid inskickat ärende</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceArchivedUserEmail">E-post vid avslutat ärende</xsl:variable>
	<xsl:variable name="i18n.ManagerNotifications">Notifikationer till handläggare</xsl:variable>
	<xsl:variable name="i18n.SendExternalMessageReceivedManagerEmail">E-post vid nytt meddelande från medborgare</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceAssignedManagerEmail">E-post vid tilldelning av ärende</xsl:variable>
	<xsl:variable name="i18n.SendStatusChangedManagerEmail">E-post vid byte av status</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceSubmittedManagerEmail">E-post när nya ärenden skickas in</xsl:variable>
	<xsl:variable name="i18n.NoNotificationsEnabled">Inga notifikationer är aktiverade för denna e-tjänst</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstanceSubmittedUserEmailSubject">Rubrik på e-post meddelande vid inskickat ärende</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceSubmittedUserEmailMessage">Innehåll i e-post meddelande vid inskickat ärende</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstanceArchivedUserEmailSubject">Rubrik på e-post meddelande vid avslutat ärende</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceArchivedUserEmailMessage">Innehåll i e-post meddelande vid avslutat ärende</xsl:variable>
	
	<xsl:variable name="i18n.validation.requiredField" select="'Du måste fylla i fältet:'"/>
	<xsl:variable name="i18n.validation.invalidFormat" select="'Felaktigt format på fältet:'"/>
	<xsl:variable name="i18n.validation.tooShort" select="'För kort innehåll i fältet:'"/>
	<xsl:variable name="i18n.validation.tooLong" select="'För långt innehåll i fältet:'"/>	
	<xsl:variable name="i18n.validation.unknownError" select="'Okänt fel på fältet:'"/>
	<xsl:variable name="i18n.validation.unknownFault" select="'Ett okänt valideringsfel har uppstått.'"/>

	<xsl:variable name="i18n.ToggleTexts">[Visa/dölj texter]</xsl:variable>
	
	<xsl:variable name="i18n.UserTagsTable.description">Följande taggar kan användas i rubrik och meddelande</xsl:variable>
	<xsl:variable name="i18n.Tag">Tagg</xsl:variable>
	<xsl:variable name="i18n.Description">Beskrivning</xsl:variable>
	<xsl:variable name="i18n.FlowNameTag">E-tjänsten namn</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceIDTag">Ärende nummer</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceURLTag">Adress till ansökan</xsl:variable>
	<xsl:variable name="i18n.StatusTag">Ärende status</xsl:variable>
	<xsl:variable name="i18n.PosterFirstnameTag">Kontaktpersonens förnamn</xsl:variable>
	<xsl:variable name="i18n.PosterLastnameTag">Kontaktpersonens efternamn</xsl:variable>
	
	<xsl:variable name="i18n.GlobalNotifications">Generella notifikationer</xsl:variable>
	<xsl:variable name="i18n.SendFlowInstanceSubmittedGlobalEmail">E-post när nya ärenden skickas in</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceSubmittedGlobalEmailAddress">E-post adress för notifiering om nya ärenden</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceSubmittedGlobalEmailAttachPDF">Bifoga ärendet i PDF-format</xsl:variable>
</xsl:stylesheet>
