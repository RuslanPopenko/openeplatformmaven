<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:import href="BaseFlowBrowserModule.sv.xsl"/>
	
	<xsl:include href="classpath://se/unlogic/hierarchy/core/utils/usergrouplist/UserGroupList.sv.xsl"/>
	
	<xsl:include href="FlowAdminModuleTemplates.xsl"/>
	
	<xsl:output encoding="UTF-8" method="html" version="4.0"/>
	
	<xsl:variable name="java.flowNameCopySuffix"> (kopia)</xsl:variable>
	
	<xsl:variable name="i18n.flowName">E-tjänst</xsl:variable>
		
	<xsl:variable name="i18n.Flowslist.title">E-tjänster</xsl:variable>
	<xsl:variable name="i18n.Flowlist.description">Nedan visas samtliga e-tjänster i systemet.</xsl:variable>
	<xsl:variable name="i18n.typeOfFlow">Typ av e-tjänst</xsl:variable>
	<xsl:variable name="i18n.internal">Intern</xsl:variable>
	<xsl:variable name="i18n.external">Extern</xsl:variable>
	<xsl:variable name="i18n.externalLink">Länk till e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.OpenExternalFlow">Öppna e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.flowType">Typ</xsl:variable>
	<xsl:variable name="i18n.flowCategory">Kategori</xsl:variable>
	<xsl:variable name="i18n.steps">Steg</xsl:variable>
	<xsl:variable name="i18n.queries">Frågor</xsl:variable>
	<xsl:variable name="i18n.instances">Ansökningar</xsl:variable>
	<xsl:variable name="i18n.status">Status</xsl:variable>
	<xsl:variable name="i18n.noFlowsFound">Inga e-tjänster hittades.</xsl:variable>
	<xsl:variable name="i18n.disabled">Inaktiverad</xsl:variable>
	<xsl:variable name="i18n.published">Publicerad</xsl:variable>
	<xsl:variable name="i18n.notPublished">Ej publicerad</xsl:variable>
	<xsl:variable name="i18n.deleteFlowDisabledIsPublished">Den här e-tjänsten kan inte tas bort eftersom den är publicerad.</xsl:variable>
	<xsl:variable name="i18n.deleteFlowDisabledHasInstances">Den här e-tjänsten kan inte tas bort eftersom det finns en eller flera ansökningar kopplade till den.</xsl:variable>
	<xsl:variable name="i18n.deleteFlowConfirm">Ta bort e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.deleteFlow.title">Ta bort e-tjänsten</xsl:variable>
		
	<xsl:variable name="i18n.addFlow">Lägg till e-tjänst</xsl:variable>

	<xsl:variable name="i18n.AddFlow.title">Lägg till e-tjänst</xsl:variable>
	<xsl:variable name="i18n.AddFlow.submit">Lägg till</xsl:variable>
	
	<xsl:variable name="i18n.UpdateFlow.title">Uppdatera e-tjänsten: </xsl:variable>
	<xsl:variable name="i18n.UpdateFlow.submit">Spara ändringar</xsl:variable>

	<xsl:variable name="i18n.name">Namn</xsl:variable>
	<xsl:variable name="i18n.description">Beskrivning</xsl:variable>
	<xsl:variable name="i18n.shortDescription">Kort beskrivning</xsl:variable>
	<xsl:variable name="i18n.longDescription">Längre beskrivning</xsl:variable>
	<xsl:variable name="i18n.submittedMessage">Meddelande vid inlämnad ansökan</xsl:variable>
	<xsl:variable name="i18n.publishDate">Publiceringsdatum</xsl:variable>
	<xsl:variable name="i18n.unPublishDate">Avpubliceringsdatum</xsl:variable>
	<xsl:variable name="i18n.usePreview">Aktivera förhandsgranskning</xsl:variable>

	<xsl:variable name="i18n.contact.title">Kontaktuppgifter - Frågor om e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.contact.name">Namn</xsl:variable>
	<xsl:variable name="i18n.contact.email">E-post</xsl:variable>
	<xsl:variable name="i18n.contact.phone">Telefon</xsl:variable>
	<xsl:variable name="i18n.owner.title">Kontaktuppgifter - Personuppgiftsansvarig</xsl:variable>
	<xsl:variable name="i18n.owner.name">Namn</xsl:variable>
	<xsl:variable name="i18n.owner.email">E-post</xsl:variable>

	<xsl:variable name="i18n.SelectedFlowTypeNotFound">Den valda typen hittades inte!</xsl:variable>
	<xsl:variable name="i18n.FlowTypeAccessDenied">Du har inte behörighet till den valda typen!</xsl:variable>

	<xsl:variable name="i18n.validation.requiredField" select="'Du måste fylla i fältet:'"/>
	<xsl:variable name="i18n.validation.invalidFormat" select="'Felaktigt format på fältet:'"/>
	<xsl:variable name="i18n.validation.tooShort" select="'För kort innehåll i fältet:'"/>
	<xsl:variable name="i18n.validation.tooLong" select="'För långt innehåll i fältet:'"/>	
	<xsl:variable name="i18n.validation.unknownError" select="'Okänt fel på fältet:'"/>
	<xsl:variable name="i18n.validation.unknownFault" select="'Ett okänt valideringsfel har uppstått.'"/>
	<xsl:variable name="i18n.enableFlow">Aktivera e-tjänsten</xsl:variable>
	
	<xsl:variable name="i18n.baseInfo">Grundinformation</xsl:variable>
	<xsl:variable name="i18n.enabled">Aktiverad</xsl:variable>
	<xsl:variable name="i18n.preview">Förhandsgranskning</xsl:variable>
	<xsl:variable name="i18n.icon">Ikon</xsl:variable>
	<xsl:variable name="i18n.stepsAndQueries">Frågor och steg</xsl:variable>
	<xsl:variable name="i18n.statuses">Statusar</xsl:variable>
	<xsl:variable name="i18n.flowContainsNoSteps">Inga steg hittades.</xsl:variable>
	<xsl:variable name="i18n.flowHasNoStatuses">Inga statusar hittades.</xsl:variable>
	
	<xsl:variable name="i18n.updateFlowBaseInfo.title">Uppdatera e-tjänstens grundinformation</xsl:variable>
		
	<xsl:variable name="i18n.stepAndQueryManipulationDisabledHasInstances">Det går inte att redigera frågorna och stegen för denna e-tjänst eftersom det finns en eller flera ansökningar kopplade till den.</xsl:variable>
	<xsl:variable name="i18n.stepAndQueryManipulationDisabledIsPublished">Det går inte att redigera frågorna och stegen för denna e-tjänst eftersom den är publicerad.</xsl:variable>
	<xsl:variable name="i18n.updateStep.title">Uppdatera steget</xsl:variable>
	<xsl:variable name="i18n.deleteStep.confirm.part1">Ta bort steget</xsl:variable>
	<xsl:variable name="i18n.deleteStep.confirm.part2">och eventuella frågor kopplade till steget?</xsl:variable>
	<xsl:variable name="i18n.deleteStep.title">Ta bort steget</xsl:variable>
	
	<xsl:variable name="i18n.updateQuery.title">Uppdatera frågan</xsl:variable>
	<xsl:variable name="i18n.deleteQuery.confirm">Ta bort frågan</xsl:variable>
	<xsl:variable name="i18n.deleteQuery.title">Ta bort frågan</xsl:variable>
	<xsl:variable name="i18n.addStep">Lägg till steg</xsl:variable>
	<xsl:variable name="i18n.addQuery">Lägg till fråga</xsl:variable>
	<xsl:variable name="i18n.sortStepsAndQueries">Sortera frågor och steg</xsl:variable>
	
	<xsl:variable name="i18n.AddQueryDescriptor.title">Lägg till fråga</xsl:variable>
	<xsl:variable name="i18n.step">Steg</xsl:variable>
	<xsl:variable name="i18n.queryType">Frågetyp</xsl:variable>
	<xsl:variable name="i18n.AddQueryDescriptor.submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.SelectedStepNotFound">Det valda steget hittades inte.</xsl:variable>
	<xsl:variable name="i18n.SelectedQueryTypeNotFound">Den valda frågetypen hittades inte.</xsl:variable>
	
	<xsl:variable name="i18n.AddStep.title">Lägg till steg</xsl:variable>
	<xsl:variable name="i18n.AddStep.submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.UpdateStep.title">Uppdatera steget: </xsl:variable>
	<xsl:variable name="i18n.UpdateStep.submit">Spara ändringar</xsl:variable>
	
	<xsl:variable name="i18n.AddStatus.title">Lägg till status</xsl:variable>
	<xsl:variable name="i18n.AddStatus.submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.UpdateStatus.title">Uppdatera status: </xsl:variable>
	<xsl:variable name="i18n.UpdateStatus.submit">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.isUserMutable">Tillåt användare att ändra ansökningar med denna status</xsl:variable>
	<xsl:variable name="i18n.isUserDeletable">Tillåt användare att ta bort ansökningar med denna status</xsl:variable>
	<xsl:variable name="i18n.isAdminMutable">Tillåt handläggare att ändra ansökningar med denna status</xsl:variable>
	<xsl:variable name="i18n.isAdminDeletable">Tillåt handläggare att ta bort med denna status</xsl:variable>
	<xsl:variable name="i18n.defaultStatusMappings.title">Statusmappningar</xsl:variable>
	<xsl:variable name="i18n.defaultStatusMappings.description">Använd denna status vid följande händelser.</xsl:variable>
	<xsl:variable name="i18n.managingTime">Handläggningstid</xsl:variable>
	<xsl:variable name="i18n.required">obligatorisk</xsl:variable>
	<xsl:variable name="i18n.managingTime.description">Antalet dagar som ärenden får befinna sig i denna status innan de för handläggaren blir markerad som akuta.</xsl:variable>
	
	<xsl:variable name="i18n.deleteStatusDisabledHasInstances">Den här statusen kan inte tas bort eftersom det finns en eller flera ansökningar kopplade till den.</xsl:variable>
	<xsl:variable name="i18n.updateStatus.link.title">Uppdatera statusen</xsl:variable>
	<xsl:variable name="i18n.deleteStatus.link.title">Ta bort statusen</xsl:variable>
	<xsl:variable name="i18n.deleteStatus.confirm">Ta bort statusen</xsl:variable>
	<xsl:variable name="i18n.addStatus">Lägg till status</xsl:variable>
	
	<xsl:variable name="i18n.statusContentType.title">Innehåll</xsl:variable>
	<xsl:variable name="i18n.statusContentType.description">Välj vilken typ av ärenden som den här statusen kommer att innehålla.</xsl:variable>
	<xsl:variable name="i18n.contentType.NEW">Sparade men ej inskickade ärenden</xsl:variable>
	<xsl:variable name="i18n.contentType.WAITING_FOR_MULTISIGN">Väntar på multipartsignering</xsl:variable>
	<xsl:variable name="i18n.contentType.WAITING_FOR_PAYMENT">Väntar på betalning</xsl:variable>
	<xsl:variable name="i18n.contentType.SUBMITTED">Inskickade ärenden</xsl:variable>
	<xsl:variable name="i18n.contentType.IN_PROGRESS">Ärenden under behandling</xsl:variable>
	<xsl:variable name="i18n.contentType.WAITING_FOR_COMPLETION">Väntar på komplettering</xsl:variable>
	<xsl:variable name="i18n.contentType.ARCHIVED">Arkiverade ärenden</xsl:variable>

	<xsl:variable name="i18n.contentType">Innehåll</xsl:variable>
	<xsl:variable name="i18n.permissions">Behörigheter</xsl:variable>
	
	<xsl:variable name="i18n.updateFlowIcon.link.title">Uppdatera ikon</xsl:variable>
	
	<xsl:variable name="i18n.UpdateFlowIcon.title">Uppdatera ikon för e-tjänsten:</xsl:variable>
	<xsl:variable name="i18n.currentIcon">Aktuell ikon</xsl:variable>
	<xsl:variable name="i18n.defaultIcon">(standard ikon)</xsl:variable>
	<xsl:variable name="i18n.restoreDefaultIcon">Återställ standard ikon</xsl:variable>
	<xsl:variable name="i18n.uploadNewIcon">Ladda upp ny ikon (png, jpg, gif eller bmp format)</xsl:variable>
	<xsl:variable name="i18n.UpdateFlowIcon.submit">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.UnableToParseRequest">Det gick inte att tolka informationen från din webbläsare.</xsl:variable>
	<xsl:variable name="i18n.UnableToParseIcon">Den gick att tolka ikonen.</xsl:variable>
	<xsl:variable name="i18n.InvalidIconFileFormat">Felaktig filformat endast ikoner i png, jpg, gif eller bmp format är tillåtna.</xsl:variable>

	<xsl:variable name="i18n.defaultQueryState">Standardläge</xsl:variable>
	<xsl:variable name="i18n.defaultQueryState.title">Standardläge</xsl:variable>
	<xsl:variable name="i18n.defaultQueryState.description">Välj vilket standardläge som frågan skall ha.</xsl:variable>
	<xsl:variable name="i18n.queryState.VISIBLE">Valfri</xsl:variable>
	<xsl:variable name="i18n.queryState.VISIBLE_REQUIRED">Obligatorisk</xsl:variable>
	<xsl:variable name="i18n.queryState.HIDDEN">Dold</xsl:variable>

	<xsl:variable name="i18n.SortFlow.title">Sortera frågor och steg</xsl:variable>
	<xsl:variable name="i18n.SortFlow.description">Observera att en fråga som har regler inte kan placeras efter de frågor som reglerna påverkar.</xsl:variable>
	<xsl:variable name="i18n.SortFlow.submit">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.MoveStep">Flytta steg</xsl:variable>
	<xsl:variable name="i18n.MoveQuery">Flytta fråga</xsl:variable>
	
	<xsl:variable name="i18n.NoStepSortindex">Det gick inte att hitta sorteringsindex för alla steg.</xsl:variable>
	<xsl:variable name="i18n.NoQueryDescriptorSortindex">Det gick inte att hitta sorteringsindex för alla frågor.</xsl:variable>
	<xsl:variable name="i18n.InvalidQuerySortIndex">En eller flera frågor har felaktigt sorteringsindex. Frågor med regler får inte ligga efter de frågor som de påverkar. De frågor som påverkas av regler får inte ligga före frågan med regeln.</xsl:variable>
	
	<xsl:variable name="i18n.UnableToFindStepsForAllQueries">Det gick inte att koppla alla frågor till steg.</xsl:variable>
	<xsl:variable name="i18n.updateEvaluator.title">Uppdatera regel</xsl:variable>
	<xsl:variable name="i18n.deleteEvaluator.confirm">Ta bort regel</xsl:variable>
	<xsl:variable name="i18n.deleteEvaluator.title">Ta bort regel</xsl:variable>
	<xsl:variable name="i18n.addEvaluator.title">Lägg till regel kopplad till frågan</xsl:variable>
	<xsl:variable name="i18n.AddEvaluatorDescriptor.title">Lägg till regel kopplad till frågan</xsl:variable>
	<xsl:variable name="i18n.evaluatorType">Regeltyp</xsl:variable>
	<xsl:variable name="i18n.AddEvaluatorDescriptor.submit">Lägg till regel</xsl:variable>
	
	<xsl:variable name="i18n.SelectedEvaluatorTypeNotFound">Den valda regeltypen hittades inte</xsl:variable>
	<xsl:variable name="i18n.evaluatorTypeID">Regeltyp</xsl:variable>
	<xsl:variable name="i18n.flowVersion">version</xsl:variable>
	<xsl:variable name="i18n.versions">Versioner</xsl:variable>
	<xsl:variable name="i18n.version.title">Version</xsl:variable>
	<xsl:variable name="i18n.flowHasNoOtherVersions">Det finns inga andra versioner av denna e-tjänst.</xsl:variable>
	
	<xsl:variable name="i18n.addNewVersion">Lägg till en ny version</xsl:variable>
	<xsl:variable name="i18n.createNewFlow">Skapa en ny e-tjänst</xsl:variable>
	
	<xsl:variable name="i18n.deleteFlowFamilyDisabledHasInstances">Det går inte att ta bort den här e-tjänsten för en eller flera av dess versioner har ansökningar kopplade till sig.</xsl:variable>
	<xsl:variable name="i18n.deleteFlowFamilyDisabledIsPublished">Det går inte att ta bort den här e-tjänsten för en eller flera av dess versioner är publicerade.</xsl:variable>
	<xsl:variable name="i18n.deleteFlowFamilyConfirm">Är du säker på att du vill ta bort samtliga versioner av e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.deleteFlowFamily.title">Ta bort samtliga versioner av e-tjänsten</xsl:variable>
	
	<xsl:variable name="i18n.versions.description">Tabellen nedan visar samtliga versioner av denna e-tjänst. Markera en e-tjänst i listan för att skapa en ny version eller en helt ny e-tjänst baserat på den valda versionen.</xsl:variable>
	<xsl:variable name="i18n.FlowNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	<xsl:variable name="i18n.unknownQueryType">Okänd frågetyp</xsl:variable>
	<xsl:variable name="i18n.unknownEvaluatorType">Okänd regeltyp</xsl:variable>
	<xsl:variable name="i18n.administrateStandardStatuses">Adm. standardstatusar</xsl:variable>
	<xsl:variable name="i18n.ListStandardStatuses.title">Standardstatusar</xsl:variable>
	<xsl:variable name="i18n.ListStandardStatuses.description">Nedan visas samtliga standardstatusar i systemet.</xsl:variable>
	<xsl:variable name="i18n.noStandardStatusesFound">Inga standardstatusar hittades.</xsl:variable>
	<xsl:variable name="i18n.addStandardStatus">Lägg till standardstatus</xsl:variable>
	<xsl:variable name="i18n.AddStandardStatus.title">Lägg till standardstatus</xsl:variable>
	<xsl:variable name="i18n.UpdateStandardStatus.title">Uppdatera standardstatus</xsl:variable>
	<xsl:variable name="i18n.updateStandardStatus.link.title">Uppdatera standardstatus</xsl:variable>
	<xsl:variable name="i18n.deleteStandardStatus.confirm">Ta bort standardstatus</xsl:variable>
	<xsl:variable name="i18n.deleteStandardStatus.link.title">Ta bort standardstatus</xsl:variable>
	<xsl:variable name="i18n.addStandardStatuses">Lägg till standardstatusar</xsl:variable>
	<xsl:variable name="i18n.RequestedFlowFamilyNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	<xsl:variable name="i18n.FlowFamilyCannotBeDeleted">Den begärda e-tjänsten kan inte tas bort då en eller flera versioner av den är publicerade eller har ansökningar knuta till sig.</xsl:variable>
	<xsl:variable name="i18n.testFlow">Testa e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.downloadxsd.title">Ladda ner XSD schema</xsl:variable>
	
	<xsl:variable name="i18n.tags">Taggar</xsl:variable>
	<xsl:variable name="i18n.checks.title">Krav för e-tjänsten (ett per rad)</xsl:variable>
	<xsl:variable name="i18n.checks">Krav för e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.administrateFlowTypesAndCategories">Adm. typer och kategorier</xsl:variable>
	<xsl:variable name="i18n.ListFlowTypes.title">Typer</xsl:variable>
	<xsl:variable name="i18n.ListFlowTypes.description">Nedan visas en lista på de typer som du har behörighet att komma åt. Klicka på en typ för att administrera dess kategorier.</xsl:variable>
	<xsl:variable name="i18n.categories">Kategorier</xsl:variable>
	<xsl:variable name="i18n.noFlowTypesFound">Inga typer hittades</xsl:variable>
	<xsl:variable name="i18n.addFlowType">Lägg till typ</xsl:variable>
	<xsl:variable name="i18n.flowFamilies">E-tjänster</xsl:variable>
	<xsl:variable name="i18n.deleteFlowTypeDisabledHasFlows">Den här typen går inte att ta bort för den har en eller flera e-tjänster kopplade till sig!</xsl:variable>
	<xsl:variable name="i18n.deleteFlowType">Ta bort typen</xsl:variable>
	<xsl:variable name="i18n.showFlowType">Visa typen</xsl:variable>
	<xsl:variable name="i18n.updateFlowType">Uppdatera typen</xsl:variable>
	<xsl:variable name="i18n.access">Åtkomst</xsl:variable>
	<xsl:variable name="i18n.allowedGroups">Grupper:</xsl:variable>
	<xsl:variable name="i18n.allowedUsers">Användare:</xsl:variable>
	<xsl:variable name="i18n.onlyModuleAdminAccess">Endast globala administatörer har åtkomst till denna typ.</xsl:variable>
	<xsl:variable name="i18n.allowedQueryTypes">Frågetyper</xsl:variable>
	<xsl:variable name="i18n.noAllowedQueryTypes">Inga frågetyper tillåts för denna typ.</xsl:variable>
	<xsl:variable name="i18n.noCategory">Ingen kategori</xsl:variable>
	<xsl:variable name="i18n.noCategories">Det finns inga kategorier för den här typen</xsl:variable>
	<xsl:variable name="i18n.updateCategory">Uppdatera kategorin</xsl:variable>
	<xsl:variable name="i18n.deleteCategory">Ta bort kategorin</xsl:variable>
	<xsl:variable name="i18n.addCategory">Lägg till kategori</xsl:variable>
	<xsl:variable name="i18n.AddFlowType.title">Lägg till typ</xsl:variable>
	<xsl:variable name="i18n.AddFlowType.submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.UpdateFlowType.title">Uppdatera typen</xsl:variable>
	<xsl:variable name="i18n.UpdateFlowType.submit">Spara ändringar</xsl:variable>
	<xsl:variable name="i18n.AddCategory.title">Lägg till kategori</xsl:variable>
	<xsl:variable name="i18n.AddCategory.submit">Lägg till</xsl:variable>
	<xsl:variable name="i18n.UpdateCategory.title">Uppdatera kategorin</xsl:variable>
	<xsl:variable name="i18n.UpdateCategory.submit">Spara ändringar</xsl:variable>
	
	<xsl:variable name="i18n.Managers">Handläggare</xsl:variable>
	<xsl:variable name="i18n.ManagersDescription">Följande grupper och användare får handlägga ärenden för denna e-tjänst.</xsl:variable>
	<xsl:variable name="i18n.UpdateFlowFamilyManagers">Välj handläggare</xsl:variable>
	<xsl:variable name="i18n.NoManagers">Inga handläggare har åtkomst till ärenden för den här e-tjänsten.</xsl:variable>
	<xsl:variable name="i18n.UpdateManagers.title">Uppdatera handläggare för e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.UpdateManagers.submit">Spara ändringar</xsl:variable>
	
	<xsl:variable name="i18n.AddFlowCategoryNotFound">Den begärda kategorin hittades inte.</xsl:variable>
	<xsl:variable name="i18n.AddCategoryFailedFlowTypeNotFound">Den begärda typen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedCategoryNotFound">Den begärda kategorin hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedCategoryNotFound">Den begärda kategorin hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedFlowTypeNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedFlowTypeNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	<xsl:variable name="i18n.ShowFailedFlowTypeNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedStepNotFound">Det begärda steget hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedStepNotFound">Det begärda steget hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedQueryDescriptorNotFound">Den begärda frågan hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedQueryDescriptorNotFound">Den begärda frågan hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedEvaluatorDescriptorNotFound">Den begärda regeln hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedEvaluatorDescriptorNotFound">Den begärda regeln hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedStatusNotFound">Den begärda statusen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedStatusNotFound">Den begärda statusen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.UpdateFailedStandardStatusNotFound">Den begärda standardstatusen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.DeleteFailedStandardStatusNotFound">Den begärda standardstatusen hittades inte.</xsl:variable>
	<xsl:variable name="i18n.FlowTypeQueryTypeAccessDenied">Den här typen av e-tjänster har inte behörighet att använda den valda frågetypen.</xsl:variable>
	<xsl:variable name="i18n.requireAuthentication">Kräv inloggning</xsl:variable>
	<xsl:variable name="i18n.requirersAuthentication">Kräver inloggning</xsl:variable>
	<xsl:variable name="i18n.requireSigning">Kräv signering</xsl:variable>
	<xsl:variable name="i18n.requiresSigning">Kräver signering</xsl:variable>
	<xsl:variable name="i18n.MissingDefaultStatusMapping">E-tjänsten går inte att publicera då dess statusar inte innehåller samtliga obligatoriska statusmappningar. Klicka ur "Aktivera" e-tjänsten" och spara gå sedan tillbaka till e-tjänstöversikten för att kontrollera statusarna.</xsl:variable>
	
	<xsl:variable name="i18n.UnauthorizedManagerUserError.Part1">Användaren</xsl:variable>
	<xsl:variable name="i18n.UnauthorizedManagerUserError.Part2">handlägger aktiva ärenden för den här e-tjänsten och får därför inte plockas bort</xsl:variable>
	
	<xsl:variable name="i18n.exportFlow.title">Exportera e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.EvaluatorExportException.Part1">Ett fel uppstod när regelen</xsl:variable>
	<xsl:variable name="i18n.EvaluatorExportException.Part2">skulle exporteras, kontakta administratören för mer information.</xsl:variable>
	<xsl:variable name="i18n.QueryExportException.Part1">Ett fel uppstod när frågan</xsl:variable>
	<xsl:variable name="i18n.QueryExportException.Part2">skulle exporteras, kontakta administratören för mer information.</xsl:variable>
	<xsl:variable name="i18n.FlowImportFlowFamlilyNotFound">Den begärda e-tjänsten hittades inte.</xsl:variable>
	
	<xsl:variable name="i18n.SelectImportTargetType.title">Välj typ</xsl:variable>
	<xsl:variable name="i18n.SelectImportTargetType.description">Välj vilken typ av e-tjänst du vill importera.</xsl:variable>
	<xsl:variable name="i18n.ImportFlow.NewVersion.title">Importera ny version av e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.ImportFlow.NewVersion.description">Använd formuläret nedan för att importera en ny version. Filen du väljer måste vara av typen oeflow.</xsl:variable>
	<xsl:variable name="i18n.ImportFlow.NewFamily.title">Importera ny e-tjänst av typen</xsl:variable>
	<xsl:variable name="i18n.ImportFlow.NewFamily.description">Använd formuläret nedan för att importera en ny e-tjänst. Filen du väljer måste vara av typen oeflow.</xsl:variable>
	<xsl:variable name="i18n.selectFlowFile">Välj fil</xsl:variable>	
	
	<xsl:variable name="i18n.ImportFlow.submit">Importera</xsl:variable>

	<xsl:variable name="i18n.importFlow">Importera e-tjänst</xsl:variable>
	<xsl:variable name="i18n.importNewFlowVersion">Importera en ny version</xsl:variable>
	
	<xsl:variable name="i18n.QueryTypeNotAllowedInFlowTypeValidationError.Part1">Frågan</xsl:variable>
	<xsl:variable name="i18n.QueryTypeNotAllowedInFlowTypeValidationError.Part2">är av en typ som inte tillåts i e-tjänster av typen</xsl:variable>
	<xsl:variable name="i18n.QueryTypeNotAllowedInFlowTypeValidationError.Part3">.</xsl:variable>
	
	<xsl:variable name="i18n.EvaluatorTypeNotFound.Part1">Regeltypen för regeln</xsl:variable>
	<xsl:variable name="i18n.EvaluatorTypeNotFound.Part2">hittades inte.</xsl:variable>
	
	<xsl:variable name="i18n.QueryTypeNotFound.Part1">Frågetypen för frågan</xsl:variable>
	<xsl:variable name="i18n.QueryTypeNotFound.Part2">hittades inte.</xsl:variable>
	
	<xsl:variable name="i18n.EvaluatorImportException.Part1">Ett fel uppstod när regeln</xsl:variable>
	<xsl:variable name="i18n.EvaluatorImportException.Part2">skulle importeras, kontakta administratören för mer information.</xsl:variable>
	<xsl:variable name="i18n.QueryImportException.Part1">Ett fel uppstod när frågan</xsl:variable>
	<xsl:variable name="i18n.QueryImportException.Part2">skulle importeras, kontakta administratören för mer information.</xsl:variable>
	
	<xsl:variable name="i18n.InvalidFileExtension.Part1">Filen</xsl:variable>
	<xsl:variable name="i18n.InvalidFileExtension.Part2">är av en felaktig filtyp.</xsl:variable>
	<xsl:variable name="i18n.InvalidFileExtension.Part3">Följande filtyper är tillåtna:</xsl:variable>
	
	<xsl:variable name="i18n.UnableToParseFile.part1">Den gick inte att tolka innehållet filen </xsl:variable>
	<xsl:variable name="i18n.UnableToParseFile.part2">.</xsl:variable>
	<xsl:variable name="i18n.UnauthorizedManagerUserError.MemberOfGroups">medlem i</xsl:variable>
	
	<xsl:variable name="i18n.showSubmitSurvey">Visa användarundersökning vid inskickad ansökan</xsl:variable>
	<xsl:variable name="i18n.showsSubmitSurvey">Visar användarundersökning vid inskickad ansökan</xsl:variable>
	
	<xsl:variable name="i18n.FlowSurveysTitle">Användarundersökningar</xsl:variable>
	
	<xsl:variable name="i18n.UpdateNotificationSettings">Ändra inställningar</xsl:variable>
	<xsl:variable name="i18n.Notifications">Notifieringar</xsl:variable>
	<xsl:variable name="i18n.UpdateNotifications.title">Notifieringsinställningar för e-tjänsten</xsl:variable>
	<xsl:variable name="i18n.UpdateNotifications.reset.confirm">Är du helt säker på att du vill återställa standardvärden för notifieringar för denna e-tjänst?</xsl:variable>
	<xsl:variable name="i18n.UpdateNotifications.reset">Återställ standardvärden</xsl:variable>
	<xsl:variable name="i18n.UpdateNotifications.submit">Spara ändringar</xsl:variable>
	
	
	<xsl:variable name="i18n.StatisticsSettings">Statistik inställningar</xsl:variable>
	<xsl:variable name="i18n.StatisticsMode.None">Generera ingen statistik</xsl:variable>
	<xsl:variable name="i18n.StatisticsMode.Internal">Generera statistik men visa den endast för interna användare</xsl:variable>
	<xsl:variable name="i18n.StatisticsMode.Public">Generera statistik och visa den publikt</xsl:variable>
</xsl:stylesheet>
