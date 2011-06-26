
<%@ page import="es.almacen.incidencias.material.Material" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="breadCrumbText"><g:message code="default.show.label" args="[entityName]" /></div>
        <div class="body">
            <div class="cuaderno">
		<div class="cuadernoUp"> </div>
		<div class="cuadernoBody">
            		<h1><g:message code="default.show.label" args="[entityName]" /></h1>

                    
			<div class="row">
                            	<label><g:message code="material.id.label" default="Id" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: materialInstance, field: "id")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="material.nombre.label" default="Nombre" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: materialInstance, field: "nombre")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="material.referencia.label" default="Referencia" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: materialInstance, field: "referencia")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="material.cantidad.label" default="Cantidad" /></label>
                            
	                        <div valign="top" class="value">${fieldValue(bean: materialInstance, field: "cantidad")}</div>
                            
                        </div>
                    
			<div class="row">
                            	<label><g:message code="material.usadoEn.label" default="Usado En" /></label>
                            
                            	<div class="value">
                	                <ul>
                       		        <g:each in="${materialInstance.usadoEn}" var="u">
                                	    <li><g:link controller="materialUtilizado" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                                	</g:each>
                                	</ul>
                            	</div>
                            
                        </div>
                    

		        <div class="buttons">
                		<g:form>
		                    <g:hiddenField name="id" value="${materialInstance?.id}" />
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
