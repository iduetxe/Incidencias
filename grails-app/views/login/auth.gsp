<head>
    <meta name='layout' content='main' />
    <title><g:message code="auth.login.title"/></title>

</head>

<body>
	<div id='login' class="cuaderno">
		<div class="cuadernoUp" ></div>
		<div class="cuadernoBody">
				<h1><g:message code="auth.login.header"/></h1>
				<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
					<div class="row">
						<label for='username'><g:message code="auth.login.id"/></label>
						<input type='text' name='j_username' id='username' />
					</div>
					<div class="row">
						<label for='password'> <g:message code="auth.login.password"/></label>
						<input type='password' name='j_password' id='password' />
					</div>
					<div class="row">
						<label for='remember_me'><g:message code="auth.login.rememberme"/></label>
						<input type='checkbox' name='${rememberMeParameter}' id='remember_me'
						<g:if test='${hasCookie}'>checked='checked'</g:if> />
					</div>
					<div class="buttons">
						<input class="button login" type='submit' value='<g:message code="auth.login.loginButton"/>' />
					</div>
				</form>
		</div>
		<div class="cuadernoDown"></div>
	</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
