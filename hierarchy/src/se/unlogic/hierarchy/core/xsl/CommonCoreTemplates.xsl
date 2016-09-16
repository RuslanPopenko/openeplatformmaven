<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:template match="script">
	
		<script type="{type}" src="{/document/requestinfo/contextpath}{src}"/>
		
	</xsl:template>
	
	<xsl:template match="link">
	
		<link rel="{rel}" type="{type}" href="{/document/requestinfo/contextpath}{href}" media="{media}"/>
		
	</xsl:template>	

</xsl:stylesheet>