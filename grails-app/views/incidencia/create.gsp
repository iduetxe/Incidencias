

<%@ page import="es.almacen.incidencias.Incidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${incidenciaInstance}">
            <div class="errors">
                <g:renderErrors bean="${incidenciaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

                        
                            <div class="row">
                                <label for="estadoIncidencia"><g:message code="incidencia.estadoIncidencia.label" default="Estado Incidencia" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'estadoIncidencia', 'errors')}">
                                    <g:select name="estadoIncidencia" from="${es.almacen.incidencias.EstadoIncidencia?.values()}" keys="${es.almacen.incidencias.EstadoIncidencia?.values()*.name()}" value="${incidenciaInstance?.estadoIncidencia?.name()}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="servicio"><g:message code="incidencia.servicio.label" default="Servicio" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'servicio', 'errors')}">
                                    <g:select name="servicio.id" from="${es.almacen.servicios.Servicio.list()}" optionKey="id" value="${incidenciaInstance?.servicio?.id}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="prioridad"><g:message code="incidencia.prioridad.label" default="Prioridad" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'prioridad', 'errors')}">
                                    <g:select name="prioridad" from="${1..5}" value="${fieldValue(bean: incidenciaInstance, field: 'prioridad')}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="titulo"><g:message code="incidencia.titulo.label" default="titulo" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${incidenciaInstance?.titulo}" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="tecnico"><g:message code="incidencia.tecnico.label" default="Tecnico" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'tecnico', 'errors')}">
                                    <g:select name="tecnico.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${incidenciaInstance?.tecnico?.id}" noSelection="['null': '']" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="nombreContacto"><g:message code="incidencia.nombreContacto.label" default="Nombre Contacto" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'nombreContacto', 'errors')}">
                                    <g:textField name="nombreContacto" value="${incidenciaInstance?.nombreContacto}" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="tlfContacto"><g:message code="incidencia.tlfContacto.label" default="Tlf Contacto" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'tlfContacto', 'errors')}">
                                    <g:textField name="tlfContacto" value="${incidenciaInstance?.tlfContacto}" />
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
