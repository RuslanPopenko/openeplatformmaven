<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>

	<xsl:include href="classpath://com/nordicpeak/flowengine/queries/common/xsl/QueryCommon.sv.xsl"/>
	<xsl:include href="OrganizationDetailQueryTemplates.xsl"/>
	
	<xsl:variable name="i18n.Name">Företagets namn</xsl:variable>
	<xsl:variable name="i18n.OrganizationNumber">Organisationsnummer</xsl:variable>
	<xsl:variable name="i18n.Address">Adress</xsl:variable>
	<xsl:variable name="i18n.ZipCode">Postnummer</xsl:variable>
	<xsl:variable name="i18n.PostalAddress">Ort</xsl:variable>
	<xsl:variable name="i18n.ContactPerson">Kontaktperson</xsl:variable>
	<xsl:variable name="i18n.Firstname">Förnamn</xsl:variable>
	<xsl:variable name="i18n.Lastname">Efternamn</xsl:variable>
	<xsl:variable name="i18n.FirstnameAndLastname">För- &amp; Efternamn</xsl:variable>
	<xsl:variable name="i18n.MobilePhone">Mobiltelefon</xsl:variable>
	<xsl:variable name="i18n.Email">E-postadress</xsl:variable>
	<xsl:variable name="i18n.Phone">Telefon</xsl:variable>
	
	<xsl:variable name="i18n.ChooseContactChannels">Kontaktvägar</xsl:variable>
	
	<xsl:variable name="i18n.AllowContactBySMS">Kontakta mig via SMS</xsl:variable>
	<xsl:variable name="i18n.ContactBySMS">SMS</xsl:variable>
	<xsl:variable name="i18n.ContactByEmail">E-post</xsl:variable>
	
	<xsl:variable name="i18n.And">&amp;</xsl:variable>
	
	<xsl:variable name="i18n.ChooseOrganization">Välj företag</xsl:variable>
	<xsl:variable name="i18n.OrganizationDescription">Välj ett av din befintliga företag eller registrera ett nytt</xsl:variable>
	<xsl:variable name="i18n.NewOrganization">Nytt företag</xsl:variable>
	
	<xsl:variable name="i18n.AddToMyOrganizations">Lägg till det här företagets uppgifter under mina företag</xsl:variable>
	<xsl:variable name="i18n.UpdateToMyOrganizations">Uppdatera företagets uppgifter under mina företag</xsl:variable>
	
	<xsl:variable name="i18n.UnableToPersistOrganization">Det gick inte att spara företagets uppgifter till mina företag. Försök igen</xsl:variable>
	
	<xsl:variable name="i18n.NameExists">Du har redan registrerat ett företag med det angivna namnet</xsl:variable>
	<xsl:variable name="i18n.OrganizationNumberExists">Du har redan registrerat ett företag med det angivna organisationsnumret</xsl:variable>
	
	<xsl:variable name="i18n.RequiredField">Det här fältet är obligatoriskt!</xsl:variable>
	<xsl:variable name="i18n.TooLongFieldContent.part1">Innehållet i det här fältet är </xsl:variable>
	<xsl:variable name="i18n.TooLongFieldContent.part2"> tecken vilket överskrider maxgränsen på </xsl:variable>
	<xsl:variable name="i18n.TooLongFieldContent.part3"> tecken!</xsl:variable>
	<xsl:variable name="i18n.InvalidFormat">Felaktigt format på fältet</xsl:variable>
	<xsl:variable name="i18n.UnknownValidationError">Ett okänt valideringsfel har uppstått!</xsl:variable>
	<xsl:variable name="i18n.NoContactChannelChoosen">Du måste välja minst ett kontaktsätt!</xsl:variable>
	
</xsl:stylesheet>
