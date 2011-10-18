

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
            <div id="breadCrumbText"><g:message code="default.edit.label" args="[entityName]" /></div>
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
                        
				<div class="row">
                                  <label for="tipoServicio"><g:message code="servicio.tipoServicio.label" default="Tipo Servicio" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'tipoServicio', 'errors')}"><g:select name="tipoServicio" from="${es.almacen.servicios.TipoServicio?.values()}" keys="${es.almacen.servicios.TipoServicio?.values()*.name()}" value="${servicioInstance?.tipoServicio?.name()}"  /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="pabellon"><g:message code="servicio.pabellon.label" default="Pabellon" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'pabellon', 'errors')}"><g:textField name="pabellon" value="${servicioInstance?.pabellon}" /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="planta"><g:message code="servicio.planta.label" default="Planta" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'planta', 'errors')}"><g:textField name="planta" value="${fieldValue(bean: servicioInstance, field: 'planta')}" /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="usuarios"><g:message code="servicio.usuarios.label" default="Usuarios" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: servicioInstance, field: 'usuarios', 'errors')}">
<ul>
<g:each in="${servicioInstance?.usuarios?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="usuario" action="create" params="['servicio.id': servicioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</div>
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
