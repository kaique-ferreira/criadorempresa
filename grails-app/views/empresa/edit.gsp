<%@ page import="criadorempresa.Empresa"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'empresa.label', default: 'Empresa')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#edit-empresa" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-empresa" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${empresaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${empresaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<g:if test="${empresaInstance?.logotipo}">
			<li class="fieldcontain"><span class="property-value"> <img
					width="100" height="100"
					src="${createLink(controller:'empresa', action:'logotipo', id: empresaInstance.id)}" />
			</span></li>
		</g:if>

		<g:if test="${empresaInstance?.filePayload}">
			<li class="fieldcontain"><span class="property-value"> <a
					href="${createLink(controller:'empresa', action:'docEmpresa', id: empresaInstance.id)}">Baixar
						contrato social</a>
			</span></li>
		</g:if>

		<g:uploadForm url="[resource:empresaInstance, action:'update']"	>
			<g:hiddenField name="version" value="${empresaInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:uploadForm>
	</div>
</body>
</html>
