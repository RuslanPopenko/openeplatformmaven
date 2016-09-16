<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>
	
	<xsl:include href="QueryAdminCommonTemplates.xsl"/>
	
	<xsl:variable name="i18n.UpdateQuery">Uppdatera fråga</xsl:variable>
	
	<xsl:variable name="i18n.Name">Namn</xsl:variable>
	<xsl:variable name="i18n.name">namn</xsl:variable>
	<xsl:variable name="i18n.Description">Beskrivning</xsl:variable>
	<xsl:variable name="i18n.description">beskrivning</xsl:variable>
	<xsl:variable name="i18n.HelpText">Hjälptext</xsl:variable>
	<xsl:variable name="i18n.helpText">Hjälptext</xsl:variable>
	<xsl:variable name="i18n.MoveAlternative">Flytta alternativ</xsl:variable>
	<xsl:variable name="i18n.DeleteAlternative">Är du säker på att du vill ta bort alternativet</xsl:variable>
	<xsl:variable name="i18n.AddAlternative">Lägg till alternativ</xsl:variable>
	<xsl:variable name="i18n.Alternative">Alternativ</xsl:variable>
	<xsl:variable name="i18n.SaveChanges">Spara ändringar</xsl:variable>
	
	<xsl:variable name="i18n.defaultQueryState">standardläge</xsl:variable>
	<xsl:variable name="i18n.DefaultQueryState.title">Standardläge</xsl:variable>
	
	<xsl:variable name="i18n.DefaultQueryState.description">Välj vilket standardläge som frågan skall ha.</xsl:variable>
	<xsl:variable name="i18n.QueryState.VISIBLE">Valfri</xsl:variable>
	<xsl:variable name="i18n.QueryState.VISIBLE_REQUIRED">Obligatorisk</xsl:variable>
	<xsl:variable name="i18n.QueryState.HIDDEN">Dold</xsl:variable>
	
	<xsl:variable name="i18n.FreeTextAlternative">Fritextalternativ</xsl:variable>
	<xsl:variable name="i18n.FreeTextAlternativeDescription">Välj om frågan skall ha ett fritextalternativ</xsl:variable>
	<xsl:variable name="i18n.freeTextAlternative">fritextalternativ</xsl:variable>
	
	<xsl:variable name="i18n.RequiredField">Du måste fylla i fältet</xsl:variable>
	<xsl:variable name="i18n.AlternativeRequired">Du måste fylla i ett namn för alternativ</xsl:variable>
	<xsl:variable name="i18n.ToFewAlternatives">Du måste skapa minst 2 alternativ för frågan!</xsl:variable>
	<xsl:variable name="i18n.UnknownValidationError">Ett okänt valideringsfel har uppstått!</xsl:variable>
	<xsl:variable name="i18n.TooLongFieldContent">För långt innehåll i fältet</xsl:variable>
	<xsl:variable name="i18n.InvalidFormat">Ogiltigt format på innehållet i fältet</xsl:variable>
	
	<xsl:variable name="i18n.exportQuery.title">Exportera fråga</xsl:variable>
	<xsl:variable name="i18n.exportQuery.description">Välj om frågan skall inkluderas i den XML som skickas till andra system.</xsl:variable>
	<xsl:variable name="i18n.exportQuery">Exportera frågan</xsl:variable>
	<xsl:variable name="i18n.xsdElementName">XML-elementnamn</xsl:variable>
</xsl:stylesheet>
