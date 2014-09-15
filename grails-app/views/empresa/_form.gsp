<%@ page import="criadorempresa.Empresa"%>



<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'razaoSocial', 'error')} required">
	<label for="razaoSocial"> <g:message
			code="empresa.razaoSocial.label" default="Razao Social" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="razaoSocial" maxlength="100" required=""
		value="${empresaInstance?.razaoSocial}" />

</div>

<g:if test="${!flash.editing}">
	<div
		class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'cnpj', 'error')} required">
		<label for="cnpj"> <g:message code="empresa.cnpj.label"
				default="Cnpj" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="cnpj" maxlength="18" required=""
			value="${empresaInstance?.cnpj}" 
			onkeypress="mascara(this,'##.###.###/####-##')" />

	</div>
</g:if>

<g:if test="${flash.editing}">
	<div
		class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'cnpj', 'error')} required">
		<label for="cnpj"> <g:message code="empresa.cnpj.label"
				default="Cnpj" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="cnpj" maxlength="18" required=""
			value="${empresaInstance?.cnpj}" readonly="readonly"
			onkeypress="mascara(this,'##.###.###/####-##')" />

	</div>
</g:if>



<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'logradouro', 'error')} required">
	<label for="logradouro"> <g:message
			code="empresa.logradouro.label" default="Logradouro" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="logradouro" maxlength="150" required=""
		value="${empresaInstance?.logradouro}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'numero', 'error')} required">
	<label for="numero"> <g:message code="empresa.numero.label"
			default="Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" min="0"
		value="${empresaInstance.numero}" required="" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'complemento', 'error')} ">
	<label for="complemento"> <g:message
			code="empresa.complemento.label" default="Complemento" />

	</label>
	<g:textField name="complemento" maxlength="150"
		value="${empresaInstance?.complemento}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'municipio', 'error')} required">
	<label for="municipio"> <g:message
			code="empresa.municipio.label" default="Municipio" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="municipio" maxlength="150" required=""
		value="${empresaInstance?.municipio}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'uf', 'error')} required">
	<label for="uf"> <g:message code="empresa.uf.label"
			default="Uf" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="uf" maxlength="2" required=""
		value="${empresaInstance?.uf}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'telefone1', 'error')} required">
	<label for="telefone1"> <g:message
			code="empresa.telefone1.label" default="Telefone1" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="telefone1" required=""
		value="${empresaInstance?.telefone1}"
		onkeypress="mascara(this, '## ## #####-####')" maxlength="16"
		placeholder="11 11 11111-1111" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'telefone2', 'error')} ">
	<label for="telefone2"> <g:message
			code="empresa.telefone2.label" default="Telefone2" />

	</label>
	<g:textField name="telefone2" value="${empresaInstance?.telefone2}"
		onkeypress="mascara(this, '## ## #####-####')" maxlength="16"
		placeholder="11 11 11111-1111" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'fax', 'error')} ">
	<label for="fax"> <g:message code="empresa.fax.label"
			default="Fax" />

	</label>
	<g:textField name="fax" value="${empresaInstance?.fax}"
		onkeypress="mascara(this, '## ## #####-####')" maxlength="16"
		placeholder="11 11 11111-1111" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'email', 'error')} ">
	<label for="email"> <g:message code="empresa.email.label"
			default="Email" />

	</label>
	<g:field type="email" name="email" value="${empresaInstance?.email}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'isMatriz', 'error')} ">
	<label for="isMatriz"> <g:message code="empresa.isMatriz.label"
			default="Matriz?" />

	</label>
	<g:checkBox name="isMatriz" value="${empresaInstance?.isMatriz}"
		onclick="showHideMatriz()" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'matriz', 'error')} "
	${empresaInstance?.isMatriz ? 'style=display:none' : 'style=display:block'}
	id="matriz">
	<label for="matriz"> <g:message code="empresa.matriz.label"
			default="Matriz" />

	</label>
	<g:select id="matriz" name="matriz.id"
		from="${criadorempresa.Empresa.list()}" optionKey="id"
		value="${empresaInstance?.matriz?.id}" class="many-to-one"
		noSelection="['null': '']" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload"> <g:message
			code="empresa.isMatriz.label" default="Escolha o contrato social" />

	</label> <input type="file" id="filePayload" name="filePayload" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'logotipo', 'error')} ">
	<label for="logotipo"> <g:message code="empresa.isMatriz.label"
			default="Escolha o logotipo" />

	</label> <input type="file" id="logotipo" name="logotipo" />

</div>

