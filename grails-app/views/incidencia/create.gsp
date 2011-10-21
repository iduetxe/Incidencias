

<%@ page import="es.almacen.incidencias.EstadoIncidencia; es.almacen.incidencias.Incidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <!-- AUTOSUGEST -->
        <g:loadAutocompleter/>

    </head>
    <body>
        <div class="body">
            <g:form action="save" >
                <div class="cuaderno">
                    <div class="cuadernoUp"> </div>
                    <div class="cuadernoBody">
            		<h1><g:message code="default.create.label" args="[entityName]" /></h1>

                        
                            <div class="row">
                                <label for="estadoIncidencia"><g:message code="incidencia.estadoIncidencia.label" default="Estado Incidencia" /></label>
                                <div  class="value">
                                    ${EstadoIncidencia.ABIERTA}
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="servicioId"><g:message code="incidencia.servicio.label" default="Servicio" /></label>
%{--
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'servicio', 'error_input')}">
                                    <g:select name="servicio.id" from="${es.almacen.servicios.Servicio.list()}" optionKey="id" value="${incidenciaInstance?.servicio?.id}"  />
                                </div>
--}%
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'servicioId', 'error_input')}">
                                    <g:selectService name="servicioId"></g:selectService>
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="prioridad"><g:message code="incidencia.prioridad.label" default="Prioridad" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'prioridad', 'error_input')}">
                                    <g:select name="prioridad" from="${1..5}" value="${fieldValue(bean: incidenciaInstance, field: 'prioridad')}"  />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="titulo"><g:message code="incidencia.titulo.label" default="Titulo" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'titulo', 'error_input')}">
                                    <g:textField name="titulo" value="${incidenciaInstance?.titulo}" />
                                </div>
                            </div>
%{--

                            <div class="row">
                                <label for="servicioTecnico"><g:message code="incidencia.servicioTecnico.label" default="Servicio Tecnico" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'servicioTecnico', 'errors')}">
                                    <g:select name="servicioTecnico.id" from="${es.almacen.servicios.Servicio.list()}" optionKey="id" value="${incidenciaInstance?.servicioTecnico?.id}" noSelection="['null': '']" />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="tecnico"><g:message code="incidencia.tecnico.label" default="Tecnico" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'tecnico', 'errors')}">
                                    <g:select name="tecnico.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${incidenciaInstance?.tecnico?.id}" noSelection="['null': '']" />
                                </div>
                            </div>
--}%

                            <div class="row">
                                <label for="contacto"><g:message code="incidencia.contacto.label" default="Contacto" /></label>
                                <div  class="value">
                                    <sec:username />
                                </div>
                            </div>
                        
                            <div class="row">
                                <label for="tlfContacto"><g:message code="incidencia.tlfContacto.label" default="Tlf Contacto" /></label>
                                <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'tlfContacto', 'error_input')}">
                                    <g:textField name="tlfContacto" value="${incidenciaInstance?.tlfContacto}" />
                                </div>
                            </div>
                        
	                    <div class="buttons">
				<g:submitButton name="create" class="button save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			    </div>
                    </div>
                    <div class="cuadernoDown"> </div>
                </div>


                <div class="hoja">
                    <h2><g:message code="incidencia.addDescripcion.label" default="Añadir descripción"/></h2>
                    <div  class="value ${hasErrors(bean: incidenciaInstance, field: 'titulo', 'error_input')}">
                        <g:textArea name="nota" rows="10" cols="10"/>
                    </div>
                </div>

           </g:form>
        </div>
    </body>
</html>
