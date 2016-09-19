<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>

	<xsl:include href="TextTagAdminModuleTemplates.xsl"/>
	
	<xsl:variable name="i18n.TextTagDescription">Taggar används för att kunna få olika texter beroende på aktuell profil i e-tjänsteplattformen. Läs mer om hur du använder taggar under "Hjälp" nedan.</xsl:variable>
	
	<xsl:variable name="i18n.Name">Taggens namn</xsl:variable>
	<xsl:variable name="i18n.Description">Beskrivning</xsl:variable>
	<xsl:variable name="i18n.NoTextTags">Det finns inga taggar</xsl:variable>
	<xsl:variable name="i18n.AddTextTag">Lägg till tagg</xsl:variable>
	<xsl:variable name="i18n.Update">Ändra</xsl:variable>
	<xsl:variable name="i18n.DeleteTextTagConfirm">Är du säker på att du vill ta bort taggen</xsl:variable>
	<xsl:variable name="i18n.Add">Lägg till</xsl:variable>
	<xsl:variable name="i18n.CancelConfirm">Är du säker på att du vill avbryta utan att spara</xsl:variable>
	<xsl:variable name="i18n.Cancel">Avbryt</xsl:variable>
	<xsl:variable name="i18n.UpdateTextTag">Ändra tagg</xsl:variable>
	<xsl:variable name="i18n.SaveChanges">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.TextTagType">Formulärtyp</xsl:variable>
	<xsl:variable name="i18n.TextField">Textfält</xsl:variable>
	<xsl:variable name="i18n.Editor">Editor</xsl:variable>
	<xsl:variable name="i18n.DefaultValue">Standardvärde</xsl:variable>
	<xsl:variable name="i18n.name">taggens namn</xsl:variable>
	<xsl:variable name="i18n.description">beskrivning</xsl:variable>
	<xsl:variable name="i18n.textTagType">formulärtyp</xsl:variable>
	<xsl:variable name="i18n.defaultValue">standardvärde</xsl:variable>
	<xsl:variable name="i18n.TextTagNameExists">Det finns redan en tagg med det angivna namnet</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedTextTagNotFound">Den begärda taggen hittades inte</xsl:variable>
	
	<xsl:variable name="i18n.TextTagTitle.Part1">Det finns</xsl:variable>
	<xsl:variable name="i18n.TextTagTitle.Part2">tagg</xsl:variable>
	<xsl:variable name="i18n.TextTagTitle.Part2.Plural">taggar</xsl:variable>

	<xsl:variable name="i18n.Help">Hjälp</xsl:variable>
	<xsl:variable name="i18n.TextTagAdminHelp">Inkludera taggar i texter genom att skriva: ${taggens namn}. För att erhålla olika värden per profil, gå in under profiler och ställ in önskade värden för den aktuella taggen.</xsl:variable>
	
	<xsl:variable name="i18n.validation.requiredField" select="'Du måste fylla i fältet'"/>
	<xsl:variable name="i18n.validation.invalidFormat" select="'Felaktigt format på fältet'"/>
	<xsl:variable name="i18n.validation.tooShort" select="'För kort innehåll i fältet'"/>
	<xsl:variable name="i18n.validation.tooLong" select="'För långt innehåll i fältet'"/>	
	<xsl:variable name="i18n.validation.unknownError" select="'Okänt fel på fältet'"/>
	<xsl:variable name="i18n.unknownFault" select="'Ett okänt fel har uppstått'"/>
	
</xsl:stylesheet>
