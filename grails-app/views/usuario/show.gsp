
<%@ page import="es.almacen.usuarios.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>${usuarioInstance.name}</title>
    </head>
    <body>
        <div id="breadCrumbText">${fieldValue(bean: usuarioInstance, field: "name")}</div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="cuaderno">
		<div class="cuadernoUp"> </div>
		<div class="cuadernoBody">
            		<h1>${fieldValue(bean: usuarioInstance, field: "name")}</h1>

                    
			<div class="row">
                            	<label><g:message code="usuario.id.label" default="Id" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "id")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.username.label" default="Username" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "username")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.password.label" default="Password" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "password")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.name.label" default="Name" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "name")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.accountExpired.label" default="Account Expired" /></label>
                            
	                        <div class="value"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.accountLocked.label" default="Account Locked" /></label>
                            
	                        <div class="value"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.enabled.label" default="Enabled" /></label>
                            
	                        <div class="value"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="usuario.passwordExpired.label" default="Password Expired" /></label>
                            
	                        <div class="value"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></div>
                            
                        </div>
                    

		        <div class="buttons">
                		<g:form>
		                    <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                    			<g:actionSubmit class="button edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    			<g:actionSubmit class="button delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                		</g:form>
            		</div>
 
                </div>
                <div class="cuadernoDown"> </div>
            </div>
       </div>
    </body>
</html>
