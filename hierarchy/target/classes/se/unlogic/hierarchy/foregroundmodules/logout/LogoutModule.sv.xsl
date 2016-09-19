<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" version="4.0" encoding="UTF-8" />

	<xsl:include href="LogoutModuleTemplates.xsl" />
	
	<xsl:variable name="i18n.header" select="'Utloggad'" />
	<xsl:variable name="i18n.text" select="'Du är nu utloggad.'" />
</xsl:stylesheet>