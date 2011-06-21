
<%@ page import="es.almacen.incidencias.Nota" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nota.label', default: 'Nota')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'nota.id.label', default: 'Id')}" />
                        
                            <th><g:message code="nota.owner.label" default="Owner" /></th>
                        
                            <th><g:message code="nota.incidencia.label" default="Incidencia" /></th>
                        
                            <g:sortableColumn property="texto" title="${message(code: 'nota.texto.label', default: 'Texto')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'nota.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${notaInstanceList}" status="i" var="notaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${notaInstance.id}">${fieldValue(bean: notaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: notaInstance, field: "owner")}</td>
                        
                            <td>${fieldValue(bean: notaInstance, field: "incidencia")}</td>
                        
                            <td>${fieldValue(bean: notaInstance, field: "texto")}</td>
                        
                            <td><g:formatDate date="${notaInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${notaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
