

<%@ page import="es.almacen.servicios.Servicio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
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
                                <label for="nombre"><g:message code="servicio.nombre.label" default="Nombre" /></label>
                                <div  class="value ${hasErrors(bean: servicioInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${servicioInstance?.nombre}" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="responsable"><g:message code="servicio.responsable.label" default="Responsable" /></label>
                                <div  class="value ${hasErrors(bean: servicioInstance, field: 'responsable', 'errors')}">
                                    <g:select name="responsable.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${servicioInstance?.responsable?.id}"  />
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
