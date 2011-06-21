

<%@ page import="es.almacen.usuarios.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="cuaderno">
                    <div class="cuadernoUp"></div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

                        
                            <div class="row">
                                <label for="username"><g:message code="usuario.username.label" default="Username" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${usuarioInstance?.username}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="password"><g:message code="usuario.password.label" default="Password" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${usuarioInstance?.password}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="name"><g:message code="usuario.name.label" default="Name" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${usuarioInstance?.name}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="accountExpired"><g:message code="usuario.accountExpired.label" default="Account Expired" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="accountLocked"><g:message code="usuario.accountLocked.label" default="Account Locked" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="enabled"><g:message code="usuario.enabled.label" default="Enabled" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
                                </div>
                            <div>
                        
                            <div class="row">
                                <label for="passwordExpired"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></label>
                                <div  class="value ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
                                </div>
                            <div>
                        
                    </div>
                    <div class="cuadernoDown"> </div>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
