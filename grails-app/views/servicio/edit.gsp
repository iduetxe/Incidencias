

<%@ page import="es.almacen.servicios.Servicio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:form method="post" >
                <g:hiddenField name="id" value="${servicioInstance?.id}" />
                <g:hiddenField name="version" value="${servicioInstance?.version}" />
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>

                        
				<div class="row">
                                  <label for="nombre"><g:message code="servicio.nombre.label" default="Nombre" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'nombre', 'errors')}"><g:textField name="nombre" value="${servicioInstance?.nombre}" /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="responsable"><g:message code="servicio.responsable.label" default="Responsable" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'responsable', 'errors')}"><g:select name="responsable.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${servicioInstance?.responsable?.id}"  /></div>
                            	</div>
                        
		        <div class="buttons">
                	    <g:actionSubmit class="button save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			    <g:actionSubmit class="button delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		        </div>
 
                     </div>
		     <div class="cuadernoDown"></div>
                </div>
           </g:form>
        </div>
    </body>
</html>
