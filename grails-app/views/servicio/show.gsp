
<%@ page import="es.almacen.servicios.Servicio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <div class="cuaderno">
		<div class="cuadernoUp"> </div>
		<div class="cuadernoBody">
            		<h1><g:message code="default.show.label" args="[entityName]" /></h1>

                    
			<div class="row">
                            	<label><g:message code="servicio.id.label" default="Id" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: servicioInstance, field: "id")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="servicio.nombre.label" default="Nombre" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: servicioInstance, field: "nombre")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="servicio.responsable.label" default="Responsable" /></label>
                            
                            	<div class="value">
					<g:link controller="usuario" action="show" id="${servicioInstance?.responsable?.id}">${servicioInstance?.responsable?.encodeAsHTML()}</g:link>
				</div>
                            
                        </div>
                    

		        <div class="buttons">
                		<g:form>
		                    <g:hiddenField name="id" value="${servicioInstance?.id}" />
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
