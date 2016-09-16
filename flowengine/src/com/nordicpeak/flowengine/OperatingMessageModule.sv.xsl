<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>

	<xsl:include href="OperatingMessageModuleTemplates.xsl"/>
	
	<xsl:variable name="i18n.AddOperatingMessage">Lägg till driftmeddelande</xsl:variable>
	<xsl:variable name="i18n.UpdateOperatingMessage">Ändra driftmeddelande</xsl:variable>
	<xsl:variable name="i18n.Message">Meddelande</xsl:variable>
	<xsl:variable name="i18n.Publish">Publiceras</xsl:variable>
	<xsl:variable name="i18n.UnPublish">Avpubliceras</xsl:variable>
	<xsl:variable name="i18n.StartDate">Datum från</xsl:variable>
	<xsl:variable name="i18n.EndDate">Datum till</xsl:variable>
	<xsl:variable name="i18n.StartTime">Tid från</xsl:variable>
	<xsl:variable name="i18n.EndTime">Tid till</xsl:variable>
	<xsl:variable name="i18n.FlowFamilies">Antal e-tjänster</xsl:variable>
	<xsl:variable name="i18n.DisableFlows">Inaktivera e-tjänst</xsl:variable>
	<xsl:variable name="i18n.NoOperatingMessagesFound">Inga driftmeddelanden hittades</xsl:variable>
	<xsl:variable name="i18n.All">Alla</xsl:variable>
	<xsl:variable name="i18n.Yes">Ja</xsl:variable>
	<xsl:variable name="i18n.No">Nej</xsl:variable>
	<xsl:variable name="i18n.DeleteOperatingMessageConfirm">Är du säker på att du vill ta bort driftmeddelandet</xsl:variable>
	<xsl:variable name="i18n.DeleteOperatingMessageTitle">Ta bort driftmeddelande</xsl:variable>
	
	<xsl:variable name="i18n.Submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.SaveChanges">Spara ändringar</xsl:variable>
	
	<xsl:variable name="i18n.Validation.RequiredField" select="'Du måste fylla i fältet'"/>
	<xsl:variable name="i18n.Validation.InvalidFormat" select="'Felaktigt format på fältet'"/>
	<xsl:variable name="i18n.Validation.TooShort" select="'För kort innehåll i fältet'"/>
		
	<xsl:variable name="i18n.Validation.UnknownError" select="'Okänt fel på fältet'"/>
	<xsl:variable name="i18n.UnknownFault" select="'Ett okänt fel inträffade'"/>
	
	<xsl:variable name="i18n.Global">Visa driftmeddelandet för alla e-tjänster</xsl:variable>
	<xsl:variable name="i18n.ChooseFlowFamilies">Visa driftmeddelandet för specifika e-tjänster</xsl:variable>
	<xsl:variable name="i18n.DisableFlowsLabel">Inaktivera e-tjänsterna under perioden för driftmeddelandet</xsl:variable>
	
	<xsl:variable name="i18n.message">meddelande</xsl:variable>
	<xsl:variable name="i18n.startDate">datum från</xsl:variable>
	<xsl:variable name="i18n.startTime">tid från</xsl:variable>
	<xsl:variable name="i18n.endTime">datum till</xsl:variable>
	<xsl:variable name="i18n.disabledFlows">inaktivera e-tjänsterna</xsl:variable>
	<xsl:variable name="i18n.Validation.EndTimeBeforeStartTime">Slutdatum kan inte ligga före startdatum</xsl:variable>
	<xsl:variable name="i18n.Validation.DaysBetweenToSmall">Sluttid kan inte ligga före starttid</xsl:variable>
	<xsl:variable name="i18n.Validation.NoFlowFamilyChoosen">Du har inte valt några e-tjänster</xsl:variable>
	
	<xsl:variable name="i18n.Validation.TooLong.Part1">Innehållet i fältet </xsl:variable>
	<xsl:variable name="i18n.Validation.TooLong.Part2"> är </xsl:variable>
	<xsl:variable name="i18n.Validation.TooLong.Part3"> tecken, vilket överskrider maxgränsen på </xsl:variable>
	<xsl:variable name="i18n.Validation.TooLong.Part4"> tecken</xsl:variable>
</xsl:stylesheet>
