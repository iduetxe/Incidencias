<div class="nav">
            <span class="menuButton"><g:link class="list" action="list" controller="incidencia"><g:message code="menu.incidencia.list" /></g:link></span>
	<sec:ifLoggedIn>
            <span class="menuButton"><g:link class="create" action="create" controller="incidencia"><g:message code="menu.incidencia.new" args="[entityName]" /></g:link></span>
	</sec:ifLoggedIn>

    <sec:ifAnyGranted roles="ROLE_TECNICO, ROLE_ADMIN">
            <span class="menuButton"><g:link class="list" action="list" controller="material"><g:message code="menu.material.list"/></g:link></span>
	</sec:ifAnyGranted>
</div>

