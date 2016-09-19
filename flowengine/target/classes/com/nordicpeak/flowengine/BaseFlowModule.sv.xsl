<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:import href="BaseFlowModuleTemplates.xsl"/>
	
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>
	
	<xsl:variable name="i18n.FlowInstanceID">Ärendenummer</xsl:variable>
	
	<xsl:variable name="i18n.previousStep">Föregående steg</xsl:variable>
	<xsl:variable name="i18n.nextStep">Nästa steg</xsl:variable>
	
	<xsl:variable name="i18n.SaveBoxDescription">Vill du fortsätta med din ansökan vid ett senare tillfälle så kan du spara den när som helst.</xsl:variable>
	<xsl:variable name="i18n.ShortSaveBoxDescription">Du kan spara din ansökan för att fortsätta senare.</xsl:variable>
	<xsl:variable name="i18n.Save">Spara ansökan</xsl:variable>
	<xsl:variable name="i18n.save">Spara</xsl:variable>

	<xsl:variable name="i18n.PreviewNotEnabledForCurrentFlow">Det är inte möjligt att förhandsgranska den här e-tjänsten.</xsl:variable>
	<xsl:variable name="i18n.PreviewOnlyAvailableWhenFlowFullyPopulated">För att kunna förhansdsgranska måste du först fylla i samtliga steg.</xsl:variable>
	<xsl:variable name="i18n.SubmitOnlyAvailableWhenFlowFullyPopulated">För att kunna spara och skicka in måste du först fylla i samtliga steg.</xsl:variable>
	<xsl:variable name="i18n.FileUploadException.part1">Det gick inte att tolka informationen från din webbläsare. Kontrollera att du inte bifogat mer än </xsl:variable>
	<xsl:variable name="i18n.FileUploadException.part2"> MB.</xsl:variable>
	<xsl:variable name="i18n.UnknownValidationError">Ett okänt valideringsfel har uppstått!</xsl:variable>
	<xsl:variable name="i18n.preview">Förhandsgranska</xsl:variable>
	<xsl:variable name="i18n.submit">Skicka in</xsl:variable>
	<xsl:variable name="i18n.signAndSubmit">Signera och skicka in</xsl:variable>
	<xsl:variable name="i18n.payHeader">Betala</xsl:variable>
	<xsl:variable name="i18n.payAndSubmit">Godkänn betalning</xsl:variable>
	
	<xsl:variable name="i18n.flowInstance">ansökan</xsl:variable>
	<xsl:variable name="i18n.noAnsweredQueriesInThisStep">Det finns inga besvarade frågor i detta steg.</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstanceSaved">Din ansökan sparades! Om du vill fortsätta senare hittar du din ansökan under Mina ärenden.</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceManagerSubmitted">Din ansökan är nu inskickad.</xsl:variable>
	<xsl:variable name="i18n.Receipt">Kvittens</xsl:variable>
	<xsl:variable name="i18n.PostedBy">Inskickat av</xsl:variable>
	<xsl:variable name="i18n.Print">Skriv ut</xsl:variable>
	<xsl:variable name="i18n.DownloadPDF">Hämta PDF</xsl:variable>
	
	<xsl:variable name="i18n.StepDescription.Part1">Steg</xsl:variable>
	<xsl:variable name="i18n.StepDescription.Part2">av</xsl:variable>
	
	<xsl:variable name="i18n.UnableToPopulateQueryInstance">Ett fel vid populering av ansökan!</xsl:variable>
	<xsl:variable name="i18n.UnableToSaveQueryInstance">Ett fel uppstod när ansökan skulle sparas!</xsl:variable>
	<xsl:variable name="i18n.UnableToResetQueryInstance">Ett fel uppstod när ansökan skulle rensas!</xsl:variable>
	<xsl:variable name="i18n.NoQueriesInCurrentStep">Det finns inga frågor att besvara i detta steg.</xsl:variable>
	
	<xsl:variable name="i18n.AjaxLoading">Var god vänta</xsl:variable>
	<xsl:variable name="i18n.AjaxCancel">Avbryt</xsl:variable>
	<xsl:variable name="i18n.AjaxRetry">Försök igen</xsl:variable>
	<xsl:variable name="i18n.AjaxReload">Ladda om sidan</xsl:variable>
	<xsl:variable name="i18n.UnExpectedAjaxError">Ett oväntat fel har inträffat!</xsl:variable>
	<xsl:variable name="i18n.UnExpectedAjaxErrorDescription">Använd knapparna nedan för att försöka igen eller ladda om sidan.</xsl:variable>
	
	<xsl:variable name="i18n.SubmitLoading">Var god vänta</xsl:variable>
	
	<xsl:variable name="i18n.SigningProviderNotFoundError">Signeringstjänsten kunde inte hittas.</xsl:variable>
	
	<xsl:variable name="i18n.Previous">Föregående</xsl:variable>
	<xsl:variable name="i18n.Next">Nästa</xsl:variable>
	
	<xsl:variable name="i18n.saveBtnSuffix">ansökan</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstanceConcurrentlyModified">Denna ansökan har ändrats sedan du öppnade den och kan därför inte sparas. Klicka här för att öppna den senaste versionen, observera att dina eventuella ändringar kommer att gå förlorade.</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceConcurrentlyModifiedConfirm">Är du säker på att du vill öppna senaste versionen och därmed förlora eventuella ändringar?</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceConcurrentlyModifiedLinkTitle">Öppna den senaste versionen</xsl:variable>
	<xsl:variable name="i18n.MultiSignStatus">Flerparts-signering</xsl:variable>
	
	<xsl:variable name="i18n.SubmittedEvent">Inskickad</xsl:variable>
	<xsl:variable name="i18n.SignedEvent">Signerad</xsl:variable>
	<xsl:variable name="i18n.PayedEvent">Betald</xsl:variable>
	<xsl:variable name="i18n.UpdatedEvent">Ändrad</xsl:variable>
	<xsl:variable name="i18n.StatusUpdatedEvent">Status ändrad</xsl:variable>
	<xsl:variable name="i18n.ManagersUpdatedEvent">Handläggare ändrad</xsl:variable>
	<xsl:variable name="i18n.CustomerNotificationEvent">Notifiering skickad</xsl:variable>
	<xsl:variable name="i18n.CustomerMessageSentEvent">Meddelande skickat till handläggare</xsl:variable>
	<xsl:variable name="i18n.ManagerMessageSentEvent">Meddelande skickat till kund</xsl:variable>
	<xsl:variable name="i18n.OtherEvent">Annan händelse</xsl:variable>
	
</xsl:stylesheet>
