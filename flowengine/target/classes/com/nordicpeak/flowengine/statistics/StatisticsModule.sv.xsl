<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>

	<xsl:include href="StatisticsModuleTemplates.xsl"/>
	
	<xsl:variable name="java.flowFamilyCountChartLabel">Publicerade e-tjänster</xsl:variable>
	<xsl:variable name="java.surveyRatingsChartLabel">Användarnöjdhet per vecka</xsl:variable>
	
	<xsl:variable name="java.csvWeek">Vecka</xsl:variable>
	<xsl:variable name="java.csvFlowInstanceCount">Antal ansökningar</xsl:variable>
	<xsl:variable name="java.csvFlowInstanceCountFile">antal ansökningar.csv</xsl:variable>
	<xsl:variable name="java.csvGlobalFlowCount">Antal e-tjänster</xsl:variable>
	<xsl:variable name="java.csvGlobalFlowCountFile">antal e-tjänster.csv</xsl:variable>
	<xsl:variable name="java.csvFamilyRating">Användarnöjdhet</xsl:variable>
	<xsl:variable name="java.csvFamilyRatingFile">användarnöjdhet.csv</xsl:variable>
	<xsl:variable name="java.csvStep">Steg</xsl:variable>
	<xsl:variable name="java.csvAbortCount">Avbrutna ansökningar</xsl:variable>
	<xsl:variable name="java.csvStepAbortCountFile">avbrutna ansökningar.csv</xsl:variable>
	<xsl:variable name="java.csvUnsubmittedCount">Antal ej inskickade ansökningar</xsl:variable>
	<xsl:variable name="java.csvStepUnsubmittedCountFile">antal ej inskickade ansökningar.csv</xsl:variable>
	
	<xsl:variable name="i18n.RatingPerWeek">Användarnöjdhet per vecka</xsl:variable>
	
	<xsl:variable name="i18n.FlowInstancesPerWeek">Antal ansökningar per vecka</xsl:variable>
	
	<xsl:variable name="i18n.FlowStepAbortCountChartLabel">Avbrutna ansökningar per steg</xsl:variable>
	<xsl:variable name="i18n.FlowStepUnsubmittedCountChartLabel">Antal ej inskickade ansökningar per steg</xsl:variable>
	<xsl:variable name="i18n.NoStatisticsAvailable">Det finns för närvarande ingen statstik tillgänglig för detta värde.</xsl:variable>
	
	<xsl:variable name="i18n.FlowFamilies">Välj e-tjänst</xsl:variable>
	<xsl:variable name="i18n.Version">Version </xsl:variable>
	<xsl:variable name="i18n.PublishedFlowFamiliesPerWeek">Antal publicerade e-tjänster per vecka</xsl:variable>
	<xsl:variable name="i18n.DownloadChartDataInCSVFormat">Ladda ner datat för detta diagram i CSV-format</xsl:variable>
	<xsl:variable name="i18n.DownloadChartData">Ladda ner</xsl:variable>
	
</xsl:stylesheet>
