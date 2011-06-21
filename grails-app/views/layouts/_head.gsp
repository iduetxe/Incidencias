<div id="header">
	<div class="title">
        <a href="${createLink(uri: '/')}">
	        <p class="header-main"><g:message code="layout.head.title"/></p>
        	<p class="header-sub"><g:message code="layout.head.subtitle"/></p>
        </a>
	</div>
	<div class="infoUser">
		<sec:ifLoggedIn>
			<h3><sec:username /> </h3><g:link controller="logout">(<g:message code="layout.head.logout"/>)</g:link>
		</sec:ifLoggedIn>
		<sec:ifNotLoggedIn>
			<g:link controller='login' action='auth'><g:message code="layout.head.login"/></g:link>
		</sec:ifNotLoggedIn>
	</div>
</div>
