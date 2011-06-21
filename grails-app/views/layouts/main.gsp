<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Gestion de Incidencias" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

        <g:javascript library="jquery" plugin="jquery"/>
        <crumbs:resources/>
        <%-- Sobreescribo el css que necesita el breadcrumb--%>
        <link rel="stylesheet" href="${resource(dir:'css',file:'breadcrumb.css')}" />

        <g:layoutHead />
        <g:javascript library="application" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;"></div>
	<g:render template="/layouts/error" />
	<g:render template="/layouts/head" />
    <g:render template="/layouts/breadcrumb" />
	<g:render template="/layouts/navigation"/>
	<div id="content">
	        <g:layoutBody />
	</div>
	<g:render template="/layouts/foot" />
	<div id="backCircle"></div>
    </body>
</html>
