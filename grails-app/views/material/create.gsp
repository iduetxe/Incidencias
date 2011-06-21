

<%@ page import="es.almacen.incidencias.material.Material" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:form action="save" >
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

                        
                            <div class="row">
                                <label for="nombre"><g:message code="material.nombre.label" default="Nombre" /></label>
                                <div  class="value ${hasErrors(bean: materialInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${materialInstance?.nombre}" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="referencia"><g:message code="material.referencia.label" default="Referencia" /></label>
                                <div  class="value ${hasErrors(bean: materialInstance, field: 'referencia', 'errors')}">
                                    <g:textField name="referencia" value="${materialInstance?.referencia}" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="cantidad"><g:message code="material.cantidad.label" default="Cantidad" /></label>
                                <div  class="value ${hasErrors(bean: materialInstance, field: 'cantidad', 'errors')}">
                                    <g:textField name="cantidad" value="${fieldValue(bean: materialInstance, field: 'cantidad')}" />
                                </div>
                            </div>
                        
	                    <div class="buttons">
				<g:submitButton name="create" class="button save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			    </div>
 	
                    </div>
                    <div class="cuadernoDown"> </div>
                </div>
           </g:form>
        </div>
    </body>
</html>
