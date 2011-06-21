
<%@ page import="es.almacen.incidencias.Nota" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nota.label', default: 'Nota')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="cuaderno">
		<div class="cuadernoUp"> </div>
		<div class="cuadernoBody">
            		<h1><g:message code="default.show.label" args="[entityName]" /></h1>

                    
			<div class="row">
                            	<label><g:message code="nota.id.label" default="Id" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: notaInstance, field: "id")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="nota.owner.label" default="Owner" /></label>
                            
                            	<div class="value">
					<g:link controller="usuario" action="show" id="${notaInstance?.owner?.id}">${notaInstance?.owner?.encodeAsHTML()}</g:link>
				</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="nota.incidencia.label" default="Incidencia" /></label>
                            
                            	<div class="value">
					<g:link controller="incidencia" action="show" id="${notaInstance?.incidencia?.id}">${notaInstance?.incidencia?.encodeAsHTML()}</g:link>
				</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="nota.texto.label" default="Texto" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: notaInstance, field: "texto")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="nota.dateCreated.label" default="Date Created" /></label>
                            
                            	<div class="value"><g:formatDate date="${notaInstance?.dateCreated}" /></div>
                            
                        </div>
                    

		        <div class="buttons">
                		<g:form>
		                    <g:hiddenField name="id" value="${notaInstance?.id}" />
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
