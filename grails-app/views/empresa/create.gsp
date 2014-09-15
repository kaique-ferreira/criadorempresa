<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'empresa.label', default: 'Empresa')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

<script type="text/javascript">
	function mascara(t, mask) {
		var i = t.value.length;
		var saida = mask.substring(1, 0);
		var texto = mask.substring(i)
		if (texto.substring(0, 1) != saida) {
			t.value += texto.substring(0, 1);
		}
	}

	function showHideMatriz() {
		var e = document.getElementById('matriz');
		if (e.style.display == 'block')
			e.style.display = 'none';
		else
			e.style.display = 'block';
	}
</script>
</head>
<body>
	<a href="#create-empresa" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-empresa" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
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
		<g:uploadForm url="[resource:empresaInstance, action:'save']">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:uploadForm>
	</div>
</body>
</html>
