<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" version="4.0" encoding="ISO-8859-1"/>
	
	<xsl:template match="document">
		
		<link rel="stylesheet" href="{/document/contextpath}/static/f/{/document/module/sectionID}/{/document/module/moduleID}/css/login.css" />
		
		<div class="contentitem loginModule">	
			<xsl:apply-templates select="LoginFailed"/>
			<xsl:apply-templates select="AccountDisabled"/>
			<xsl:apply-templates select="Login"/>
		</div>		
	</xsl:template>
	
	<xsl:template match="Login">
		<h1 class="form-signin-heading"><xsl:value-of select="$Login.header"/></h1>
		
		<xsl:call-template name="LoginForm"/>
	</xsl:template>
	 
	<xsl:template match="AccountDisabled">
		<h1><xsl:value-of select="$AccountDisabled.header"/></h1>
		
		<div class="alert alert-danger" role="alert">
	      <strong><xsl:value-of select="$AccountDisabled.text"/></strong>
	    </div>
	</xsl:template>		
	
	<xsl:template match="LoginFailed">
		<h1><xsl:value-of select="$LoginFailed.header"/></h1>
		
		<div class="alert alert-danger" role="alert">
			<strong><xsl:value-of select="$LoginFailed.text"/></strong>
		</div>
		
		<xsl:call-template name="LoginForm"/>
	</xsl:template>	
	
	<xsl:template name="LoginForm">
		<form id="loginmoduleform" method="post" ACCEPT-CHARSET="ISO-8859-1" action="{/document/uri}" class="form-signin" role="form">
			
			<input type="hidden" name="redirect" value="{/document/redirect}"></input>
			
			<label for="username" class="sr-only"><xsl:value-of select="$LoginForm.username"/></label>
			<input id="username" type="text" name="username" size="40" class="form-control" required="" autofocus="" placeholder="{$LoginForm.username}"></input>
			<label for="password" class="sr-only"><xsl:value-of select="$LoginForm.password"/></label>
			<input type="password" id="password" name="password" size="40" class="form-control" placeholder="{$LoginForm.password}" required=""></input>
			
			<button type="submit" value="{$LoginForm.submit}" class="btn btn-lg btn-primary btn-block"><xsl:value-of select="$LoginForm.submit"/></button>
			
			<xsl:if test="/document/newPasswordModuleAlias or /document/registrationModuleAlias">
				<table>
					<tr>
						<td colspan="2" align="center" class="text-align-center">
							<xsl:if test="/document/newPasswordModuleAlias">
								<a id="newPasswordLink" href="{/document/requestinfo/contextpath}{/document/newPasswordModuleAlias}">
									<img class="alignbottom marginleft" src="{/document/contextpath}/static/f/{/document/module/sectionID}/{/document/module/moduleID}/pics/user_unlocked.png" />
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$requestNewPassword"/>
								</a>
								<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
							</xsl:if>
							<xsl:if test="/document/registrationModuleAlias">
								<a id="registrationLink" href="{/document/requestinfo/contextpath}{/document/registrationModuleAlias}">
									<img class="alignbottom marginleft" src="{/document/contextpath}/static/f/{/document/module/sectionID}/{/document/module/moduleID}/pics/user_add.png" />
									<xsl:text>&#160;</xsl:text>
									<xsl:value-of select="$createNewAccount"/>
								</a>
							</xsl:if>
						</td>
					</tr>
				</table>
	
			</xsl:if>
		</form>

	
	</xsl:template>	
</xsl:stylesheet>