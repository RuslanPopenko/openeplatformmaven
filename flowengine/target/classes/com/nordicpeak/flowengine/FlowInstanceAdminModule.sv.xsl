<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:import href="BaseFlowBrowserModule.sv.xsl"/>
	
	<xsl:include href="FlowInstanceAdminModuleTemplates.xsl"/>

<xsl:variable name="java.noManagersSelected">Ingen handläggare vald.</xsl:variable>

	<xsl:variable name="i18n.Help">Hjälp</xsl:variable>
	
	<xsl:variable name="i18n.Emergency">akut</xsl:variable>
	<xsl:variable name="i18n.Owned">mina</xsl:variable>
	<xsl:variable name="i18n.Flagged">flaggade</xsl:variable>
	<xsl:variable name="i18n.Active">aktiva</xsl:variable>
	<xsl:variable name="i18n.UnAssigned">obehandlade</xsl:variable>
	
	<xsl:variable name="i18n.EmergencyTab">Ärenden du behöver agera på</xsl:variable>
	<xsl:variable name="i18n.OwnedTab">Tilldelade</xsl:variable>
	<xsl:variable name="i18n.FlaggedTab">Flaggade</xsl:variable>
	<xsl:variable name="i18n.ActiveTab">Aktiva</xsl:variable>
	<xsl:variable name="i18n.UnAssignedTab">Obehandlade</xsl:variable>
	
	<xsl:variable name="i18n.Flow">E-tjänst</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceID">Ärendenummer</xsl:variable>
	<xsl:variable name="i18n.Status">Status</xsl:variable>
	<xsl:variable name="i18n.Date">Datum</xsl:variable>
	<xsl:variable name="i18n.Priority">Prioritet</xsl:variable>
	
	<xsl:variable name="i18n.CurrentStatus">Aktuell status:</xsl:variable>
	<xsl:variable name="i18n.SaveChanges">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.SaveAndClose">Spara och stäng</xsl:variable>
	
	<xsl:variable name="i18n.PrioritizedInstancesDescription.Part1">Du har</xsl:variable>
	<xsl:variable name="i18n.PrioritizedInstancesDescription.Part2">ärenden som du behöver agera på, klicka på knappen "Välj" för att fortsätta.</xsl:variable>
	<xsl:variable name="i18n.PrioritizedInstancesHelp">
<h2 data-icon-before="?" class="h1 full">Ärenden du behöver agera på</h2>
Hjälptext här...
	</xsl:variable>
	
	<xsl:variable name="i18n.UserAssignedInstancesDescription.Part1">Du har</xsl:variable>
	<xsl:variable name="i18n.UserAssignedInstancesDescription.Part2">tilldelade ärenden, klicka på knappen "Välj" för att fortsätta.</xsl:variable>
	<xsl:variable name="i18n.UserAssignedInstancesHelp">
<h2 data-icon-before="?" class="h1 full">Tilldelade ärenden</h2>
Hjälptext här...
	</xsl:variable>
	
	<xsl:variable name="i18n.BookmarkedInstancesDescription.Part1">Det finns</xsl:variable>
	<xsl:variable name="i18n.BookmarkedInstancesDescription.Part2">ärenden som du behöver agera på, klicka på knappen "Välj" för att fortsätta.</xsl:variable>
	<xsl:variable name="i18n.BookmarkedInstancesHelp">
<h2 data-icon-before="?" class="h1 full">Flaggade ärenden</h2>
Hjälptext här...
	</xsl:variable>
	
	<xsl:variable name="i18n.ActiveInstancesDescription.Part1">Du har</xsl:variable>
	<xsl:variable name="i18n.ActiveInstancesDescription.Part2">aktiva ärenden, klicka på knappen "Välj" för att fortsätta.</xsl:variable>
	<xsl:variable name="i18n.ActiveInstancesHelp">
<h2 data-icon-before="?" class="h1 full">Aktiva ärenden</h2>
Hjälptext här...
	</xsl:variable>
	
	<xsl:variable name="i18n.UnassignedInstancesDescription.Part1">Du har</xsl:variable>
	<xsl:variable name="i18n.UnassignedInstancesDescription.Part2">obehandlade ärenden, klicka på knappen "Välj" för att fortsätta.</xsl:variable>
	<xsl:variable name="i18n.UnassignedInstancesHelp">
<h2 data-icon-before="?" class="h1 full">Obehandlade ärenden</h2>
Hjälptext här...
	</xsl:variable>
	
	<xsl:variable name="i18n.NoFlowInstances">Inga ärenden</xsl:variable>
	<xsl:variable name="i18n.Choose">Välj</xsl:variable>
	
	<xsl:variable name="i18n.High">Hög</xsl:variable>
	<xsl:variable name="i18n.Medium">Medium</xsl:variable>
	
	<xsl:variable name="i18n.SearchFlowInstance">Sök ärende</xsl:variable>
	<xsl:variable name="i18n.SearchFlowInstanceDescription">Sök bland ärenden i systemet. Endast ärenden du har behörighet till visas.</xsl:variable>
	<xsl:variable name="i18n.SearchFormTitle">Sök på ärendenummer, fastighetsnamn, personnummer</xsl:variable>
		
	
	<xsl:variable name="i18n.FirstSubmitted">Inskickat</xsl:variable>
	<xsl:variable name="i18n.LastSubmitted">Senast kompletterat</xsl:variable>
	<xsl:variable name="i18n.LastChanged">Senast ändrat</xsl:variable>
	<xsl:variable name="i18n.Managers">Handläggare</xsl:variable>
	<xsl:variable name="i18n.LastSubmittedBy">Senast kompletterat av</xsl:variable>
	
	<xsl:variable name="i18n.by">av</xsl:variable>
	<xsl:variable name="i18n.NoManager">Ingen handläggare tilldelad</xsl:variable>
	
	<xsl:variable name="i18n.Details">Detaljer</xsl:variable>
	<xsl:variable name="i18n.ExternalMessages">Meddelanden</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceEvents">Ärendehistorik</xsl:variable>
	<xsl:variable name="i18n.NoExternalMessages">Inga meddelanden</xsl:variable>
	<xsl:variable name="i18n.NewMessage">Nytt meddelande</xsl:variable>
	<xsl:variable name="i18n.Action">Händelse</xsl:variable>
	<xsl:variable name="i18n.Person">Person</xsl:variable>
	<xsl:variable name="i18n.NoEvents">Ingen ärendehistorik</xsl:variable>
	
	<xsl:variable name="i18n.Message">Meddelande</xsl:variable>
	<xsl:variable name="i18n.AttachFiles">Bifoga filer</xsl:variable>
	<xsl:variable name="i18n.Close">Stäng</xsl:variable>
	<xsl:variable name="i18n.close">stäng</xsl:variable>
	<xsl:variable name="i18n.Cancel">Avbryt</xsl:variable>
	<xsl:variable name="i18n.ChooseFiles">Välj filer</xsl:variable>
	<xsl:variable name="i18n.MaximumFileSize">Maximal filstorlek vid uppladdning</xsl:variable>
	<xsl:variable name="i18n.SubmitMessage">Skicka meddelande</xsl:variable>
	
	<xsl:variable name="i18n.DeleteFile">Ta bort fil</xsl:variable>

	<xsl:variable name="i18n.ShowFlowInstance">Visa ärende</xsl:variable>
	<xsl:variable name="i18n.Or">Eller</xsl:variable>
	<xsl:variable name="i18n.UpdateFlowInstance">Ändra ärende</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstancePreviewNotificationTitle.Part1">Du granskar nu</xsl:variable>
	<xsl:variable name="i18n.FlowInstancePreviewNotificationTitle.Part2">ärende</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceFormNotificationTitle.Part1">Du ändrar nu</xsl:variable>
	<xsl:variable name="i18n.FlowInstanceFormNotificationTitle.Part2">ärende</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstanceSavedByManager">Ändringarna i ärendet sparades!</xsl:variable>
	
	<xsl:variable name="i18n.Hits.Part1">gav</xsl:variable>
	<xsl:variable name="i18n.Hits.Part2">träffar</xsl:variable>
	<xsl:variable name="i18n.SearchDone">Sökningen är klar</xsl:variable>
	
	<xsl:variable name="i18n.InternalMessages">Interna noteringar</xsl:variable>
	<xsl:variable name="i18n.SubmitInternalMessage">Spara notering</xsl:variable>
	<xsl:variable name="i18n.InternalMessage">Notering</xsl:variable>
	<xsl:variable name="i18n.NewInternalMessage">Ny notering</xsl:variable>
	<xsl:variable name="i18n.InternalMessagesTitle">Noteringar</xsl:variable>
	<xsl:variable name="i18n.NoInternalMessages">Inga noteringar</xsl:variable>
	
	<xsl:variable name="i18n.ChooseManager">Välj handläggare</xsl:variable>
	<xsl:variable name="i18n.SearchManager">Sök i listan</xsl:variable>
	<xsl:variable name="i18n.AddManager">Lägg till</xsl:variable>
	<xsl:variable name="i18n.DeleteManager">Ta bort</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstancePreviewError">Ett fel uppstod vid visning av ärendet.</xsl:variable>
		
	<xsl:variable name="i18n.FlowInstanceManagerClosedError">Den kopia av ansökan som du hade öppen har stängts.</xsl:variable>
	<xsl:variable name="i18n.StatusNotFoundValidationError">Den valda statusen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.InvalidStatusValidationError">Du har valt en ogiltig status.</xsl:variable>
	<xsl:variable name="i18n.OneOrMoreSelectedManagerUsersNotFoundError">En eller flera av de valda användarna hittade inte.</xsl:variable>
	<xsl:variable name="i18n.UnauthorizedManagerUserError.part1">Användaren</xsl:variable>
	<xsl:variable name="i18n.UnauthorizedManagerUserError.part2">har inte behörighet att handlägga detta ärende.</xsl:variable>
	
	<xsl:variable name="i18n.FileSizeLimitExceeded.part1">Filen </xsl:variable>
	<xsl:variable name="i18n.FileSizeLimitExceeded.part2"> har en storlek på </xsl:variable>
	<xsl:variable name="i18n.FileSizeLimitExceeded.part3"> vilket överskrider den maximalt tillåtna filstorleken på</xsl:variable>
	<xsl:variable name="i18n.FileSizeLimitExceeded.part4">.</xsl:variable>
	
	<xsl:variable name="i18n.ValidationError.UnableToParseRequest">Ett okänt fel uppstod vid filuppladdningen</xsl:variable>
	<xsl:variable name="i18n.ValidationError.ExternalMessageRequired">Du måste skriva ett meddelande</xsl:variable>
	<xsl:variable name="i18n.ValidationError.ExternalMessageToLong">Du har skrivit ett för långt meddelande</xsl:variable>
	<xsl:variable name="i18n.ValidationError.ExternalMessageToShort">Du har skrivit ett för kort meddelande</xsl:variable>
	<xsl:variable name="i18n.ValidationError.InternalMessageRequired">Du måste skriva en notering</xsl:variable>
	<xsl:variable name="i18n.ValidationError.InternalMessageToLong">Du har skrivit en för lång notering</xsl:variable>
	<xsl:variable name="i18n.ValidationError.InternalMessageToShort">Du har skrivit en för kort notering</xsl:variable>
	
	<xsl:variable name="i18n.DownloadFlowInstancePDF">Hämta kvittens i PDF-format</xsl:variable>	
	 
	 <xsl:variable name="i18n.saveBtnSuffix">och stäng</xsl:variable>
	 
	<xsl:variable name="i18n.SiteProfile">Kommun</xsl:variable>
	<xsl:variable name="i18n.Summary">Sammanfattning av öppna ärenden</xsl:variable>
	<xsl:variable name="i18n.DownloadFlowInstanceXML">Hämta ansökan i XML-format</xsl:variable>

</xsl:stylesheet>
