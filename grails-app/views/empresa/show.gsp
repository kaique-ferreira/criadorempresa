
<%@ page import="criadorempresa.Empresa"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'empresa.label', default: 'Empresa')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-empresa" class="skip" tabindex="-1"><g:message
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
	<div id="show-empresa" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list empresa">

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

			<g:if test="${empresaInstance?.razaoSocial}">
				<li class="fieldcontain"><span id="razaoSocial-label"
					class="property-label"><g:message
							code="empresa.razaoSocial.label" default="Razao Social" /></span> <span
					class="property-value" aria-labelledby="razaoSocial-label"><g:fieldValue
							bean="${empresaInstance}" field="razaoSocial" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.cnpj}">
				<li class="fieldcontain"><span id="cnpj-label"
					class="property-label"><g:message code="empresa.cnpj.label"
							default="Cnpj" /></span> <span class="property-value"
					aria-labelledby="cnpj-label"><g:fieldValue
							bean="${empresaInstance}" field="cnpj" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.logradouro}">
				<li class="fieldcontain"><span id="logradouro-label"
					class="property-label"><g:message
							code="empresa.logradouro.label" default="Logradouro" /></span> <span
					class="property-value" aria-labelledby="logradouro-label"><g:fieldValue
							bean="${empresaInstance}" field="logradouro" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.numero}">
				<li class="fieldcontain"><span id="numero-label"
					class="property-label"><g:message
							code="empresa.numero.label" default="Numero" /></span> <span
					class="property-value" aria-labelledby="numero-label"><g:fieldValue
							bean="${empresaInstance}" field="numero" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.complemento}">
				<li class="fieldcontain"><span id="complemento-label"
					class="property-label"><g:message
							code="empresa.complemento.label" default="Complemento" /></span> <span
					class="property-value" aria-labelledby="complemento-label"><g:fieldValue
							bean="${empresaInstance}" field="complemento" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.municipio}">
				<li class="fieldcontain"><span id="municipio-label"
					class="property-label"><g:message
							code="empresa.municipio.label" default="Municipio" /></span> <span
					class="property-value" aria-labelledby="municipio-label"><g:fieldValue
							bean="${empresaInstance}" field="municipio" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.uf}">
				<li class="fieldcontain"><span id="uf-label"
					class="property-label"><g:message code="empresa.uf.label"
							default="Uf" /></span> <span class="property-value"
					aria-labelledby="uf-label"><g:fieldValue
							bean="${empresaInstance}" field="uf" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.telefone1}">
				<li class="fieldcontain"><span id="telefone1-label"
					class="property-label"><g:message
							code="empresa.telefone1.label" default="Telefone1" /></span> <span
					class="property-value" aria-labelledby="telefone1-label"><g:fieldValue
							bean="${empresaInstance}" field="telefone1" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.telefone2}">
				<li class="fieldcontain"><span id="telefone2-label"
					class="property-label"><g:message
							code="empresa.telefone2.label" default="Telefone2" /></span> <span
					class="property-value" aria-labelledby="telefone2-label"><g:fieldValue
							bean="${empresaInstance}" field="telefone2" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.fax}">
				<li class="fieldcontain"><span id="fax-label"
					class="property-label"><g:message code="empresa.fax.label"
							default="Fax" /></span> <span class="property-value"
					aria-labelledby="fax-label"><g:fieldValue
							bean="${empresaInstance}" field="fax" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.email}">
				<li class="fieldcontain"><span id="email-label"
					class="property-label"><g:message code="empresa.email.label"
							default="Email" /></span> <span class="property-value"
					aria-labelledby="email-label"><g:fieldValue
							bean="${empresaInstance}" field="email" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.isMatriz}">
				<li class="fieldcontain"><span id="isMatriz-label"
					class="property-label"><g:message
							code="empresa.isMatriz.label" default="Is Matriz" /></span> <span
					class="property-value" aria-labelledby="isMatriz-label"><g:formatBoolean
							boolean="${empresaInstance?.isMatriz}" /></span></li>
			</g:if>

			<g:if test="${empresaInstance?.matriz}">
				<li class="fieldcontain"><span id="matriz-label"
					class="property-label"><g:message
							code="empresa.matriz.label" default="Matriz" /></span> <span
					class="property-value" aria-labelledby="matriz-label"><g:link
							controller="empresa" action="show"
							id="${empresaInstance?.matriz?.id}">
							${empresaInstance?.matriz?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${empresaInstance?.filiais}">
				<li class="fieldcontain"><span id="filiais-label"
					class="property-label"><g:message
							code="empresa.filiais.label" default="Filiais" /></span> <g:each
						in="${empresaInstance.filiais}" var="f">
						<span class="property-value" aria-labelledby="filiais-label"><g:link
								controller="empresa" action="show" id="${f.id}">
								${f?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>


		</ol>
		<g:form url="[resource:empresaInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${empresaInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:if test="${empresaInstance?.isMatriz && !empresaInstance?.filiais.empty}">
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('Tem certeza? Isso levará a exclusão de todas as filiais dessa empresa');" />
				</g:if>

				<g:if test="${!empresaInstance?.isMatriz || empresaInstance?.filiais.empty}">
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:if>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
