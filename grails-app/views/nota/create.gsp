

<%@ page import="es.almacen.incidencias.Nota" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'nota.label', default: 'Nota')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${notaInstance}">
            <div class="errors">
                <g:renderErrors bean="${notaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

                        
                            <div class="row">
                                <label for="owner"><g:message code="nota.owner.label" default="Owner" /></label>
                                <div  class="value ${hasErrors(bean: notaInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${notaInstance?.owner?.id}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="incidencia"><g:message code="nota.incidencia.label" default="Incidencia" /></label>
                                <div  class="value ${hasErrors(bean: notaInstance, field: 'incidencia', 'errors')}">
                                    <g:select name="incidencia.id" from="${es.almacen.incidencias.Incidencia.list()}" optionKey="id" value="${notaInstance?.incidencia?.id}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="texto"><g:message code="nota.texto.label" default="Texto" /></label>
                                <div  class="value ${hasErrors(bean: notaInstance, field: 'texto', 'errors')}">
                                    <g:textField name="texto" value="${notaInstance?.texto}" />
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
