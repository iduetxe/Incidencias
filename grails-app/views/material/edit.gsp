

<%@ page import="es.almacen.incidencias.material.Material" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <div id="breadCrumbText"><g:message code="default.edit.label" args="[entityName]" /></div>
            <g:form method="post" >
                <g:hiddenField name="id" value="${materialInstance?.id}" />
                <g:hiddenField name="version" value="${materialInstance?.version}" />
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.edit.label" args="[entityName]" /></h1>

                        
				<div class="row">
                                  <label for="nombre"><g:message code="material.nombre.label" default="Nombre" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: materialInstance, field: 'nombre', 'errors')}"><g:textField name="nombre" value="${materialInstance?.nombre}" /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="referencia"><g:message code="material.referencia.label" default="Referencia" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: materialInstance, field: 'referencia', 'errors')}"><g:textField name="referencia" value="${materialInstance?.referencia}" /></div>
                            	</div>
                        
				<div class="row">
                                  <label for="cantidad"><g:message code="material.cantidad.label" default="Cantidad" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: materialInstance, field: 'cantidad', 'errors')}"><g:textField name="cantidad" value="${fieldValue(bean: materialInstance, field: 'cantidad')}" /></div>
                            	</div>
				<div class="row">
                                  <label for="usadoEn"><g:message code="material.usadoEn.label" default="Usado En" /></label>
                                  <div valign="top" class="value ${hasErrors(bean: materialInstance, field: 'usadoEn', 'errors')}">
<ul>
<g:each in="${materialInstance?.usadoEn?}" var="u">
    <li><g:link controller="materialUtilizado" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="materialUtilizado" action="create" params="['material.id': materialInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materialUtilizado.label', default: 'MaterialUtilizado')])}</g:link>
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
