
<%@ page import="es.almacen.servicios.Servicio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'servicio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'servicio.nombre.label', default: 'Nombre')}" />
                        
                            <th><g:message code="servicio.responsable.label" default="Responsable" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${servicioInstanceList}" status="i" var="servicioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${servicioInstance.id}">${fieldValue(bean: servicioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: servicioInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: servicioInstance, field: "responsable")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${servicioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
