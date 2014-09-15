
<%@ page import="criadorempresa.Empresa"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'empresa.label', default: 'Empresa')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-empresa" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="list-empresa" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<fieldset class="form">
			<g:form action="index" method="GET">
				<div class="fieldcontain">
					<label for="query">Busca cnpj (digite enter para buscar):</label>
					<g:textField name="queryCnpj" value="${params.queryCnpj}" />
				</div>
			</g:form>
		</fieldset>

		<fieldset class="form">
			<g:form action="index" method="GET">
				<div class="fieldcontain">
					<label for="query">Busca Razao social (digite enter para
						buscar):</label>
					<g:textField name="queryRazaoSocial"
						value="${params.queryRazaoSocial}" />
				</div>
			</g:form>
		</fieldset>

		<fieldset class="form">
			<g:form action="index" method="GET">
				<div class="fieldcontain">
					<label for="query">Busca Municipio (digite enter para
						buscar):</label>
					<g:textField name="queryMunicipio" value="${params.queryMunicipio}" />
				</div>
			</g:form>
		</fieldset>

		<fieldset class="form">
			<g:form action="index" method="GET">
				<div class="fieldcontain">
					<label for="query">Busca UF (digite enter para
						buscar):</label>
					<g:textField name="queryUf" value="${params.queryUf}" />
				</div>
			</g:form>
		</fieldset>


		<table>
			<thead>
				<tr>
					<g:sortableColumn property="logotipo"
						title="${message(code: 'empresa.logotipo.label', default: 'Logotipo')}" />

					<g:sortableColumn property="razaoSocial"
						title="${message(code: 'empresa.razaoSocial.label', default: 'Razao Social')}" />

					<g:sortableColumn property="cnpj"
						title="${message(code: 'empresa.cnpj.label', default: 'Cnpj')}" />

					<g:sortableColumn property="logradouro"
						title="${message(code: 'empresa.logradouro.label', default: 'Logradouro')}" />

					<g:sortableColumn property="numero"
						title="${message(code: 'empresa.numero.label', default: 'Numero')}" />

					<g:sortableColumn property="uf"
						title="${message(code: 'empresa.uf.label', default: 'UF')}" />

					<g:sortableColumn property="municipio"
						title="${message(code: 'empresa.municipio.label', default: 'Municipio')}" />

					<g:sortableColumn property="telefone1"
						title="${message(code: 'empresa.telefone1.label', default: 'Telefone 1')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><img width="50" height="50"
							src="${createLink(controller:'empresa', action:'logotipo', id: empresaInstance.id)}" /></td>

						<td><g:link action="show" id="${empresaInstance.id}">
								${fieldValue(bean: empresaInstance, field: "razaoSocial")}
							</g:link></td>

						<td>
							${fieldValue(bean: empresaInstance, field: "cnpj")}
						</td>

						<td>
							${fieldValue(bean: empresaInstance, field: "logradouro")}
						</td>

						<td>
							${fieldValue(bean: empresaInstance, field: "numero")}
						</td>

						<td>
							${fieldValue(bean: empresaInstance, field: "uf")}
						</td>

						<td>
							${fieldValue(bean: empresaInstance, field: "municipio")}
						</td>

						<td>
							${fieldValue(bean: empresaInstance, field: "telefone1")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${empresaInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
