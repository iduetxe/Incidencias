
<%@ page import="es.almacen.usuarios.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'usuario.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />
                        
                            <g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "username")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "name")}</td>
                        
                            <td><g:formatBoolean boolean="${usuarioInstance.accountExpired}" /></td>
                        
                            <td><g:formatBoolean boolean="${usuarioInstance.accountLocked}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
