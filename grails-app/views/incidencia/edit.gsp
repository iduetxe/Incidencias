<%@ page import="es.almacen.incidencias.Incidencia" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}"/>
    <title><g:message code="incidencia.title.edit" args="['IncidenciaInventada']" default="Editar Incidencia"/></title>
</head>
<body>
<div class="body">
    <div id="breadCrumbText"><g:message code="incidencia.title.edit" args="[incidenciaInstance?.titulo]" default="Editar Incidencia"/></div>
    <g:form method="post">
        <g:hiddenField name="id" value="${incidenciaInstance?.id}"/>
        <g:hiddenField name="version" value="${incidenciaInstance?.version}"/>
        <div class="cuaderno">
            <div class="cuadernoUp"></div>
            <div class="cuadernoBody">
                <h1><g:message code="default.edit.label" args="[entityName]"/></h1>


                <div class="row">
                    <label for="estadoIncidencia"><g:message code="incidencia.estadoIncidencia.label" default="Estado Incidencia"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'estadoIncidencia', 'errors')}"><g:select name="estadoIncidencia" from="${es.almacen.incidencias.EstadoIncidencia?.values()}" keys="${es.almacen.incidencias.EstadoIncidencia?.values()*.name()}" value="${incidenciaInstance?.estadoIncidencia?.name()}"/></div>
                </div>

                <div class="row">
                    <label for="servicio"><g:message code="incidencia.servicio.label" default="Servicio"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'servicio', 'errors')}"><g:select name="servicio.id" from="${es.almacen.servicios.Servicio.list()}" optionKey="id" value="${incidenciaInstance?.servicio?.id}"/></div>
                </div>

                <div class="row">
                    <label for="prioridad"><g:message code="incidencia.prioridad.label" default="Prioridad"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'prioridad', 'errors')}"><g:select name="prioridad" from="${1..5}" value="${fieldValue(bean: incidenciaInstance, field: 'prioridad')}"/></div>
                </div>

                <div class="row">
                    <label for="titulo"><g:message code="incidencia.titulo.label" default="titulo"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'titulo', 'errors')}"><g:textField name="titulo" value="${incidenciaInstance?.titulo}"/></div>
                </div>

                <div class="row">
                    <label for="tecnico"><g:message code="incidencia.tecnico.label" default="Tecnico"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'tecnico', 'errors')}">
                        <g:select name="tecnico.id" from="${es.almacen.usuarios.Usuario.list()}" optionKey="id" value="${incidenciaInstance?.tecnico?.id}" noSelection="['null': '']"/>
                    </div>
                </div>

                <div class="row">
                    <label for="nombreContacto"><g:message code="incidencia.nombreContacto.label" default="Nombre Contacto"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'nombreContacto', 'errors')}"><g:textField name="nombreContacto" value="${incidenciaInstance?.nombreContacto}"/></div>
                </div>

                <div class="row">
                    <label for="tlfContacto"><g:message code="incidencia.tlfContacto.label" default="Tlf Contacto"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'tlfContacto', 'errors')}"><g:textField name="tlfContacto" value="${incidenciaInstance?.tlfContacto}"/></div>
                </div>

                <div class="row">
                    <label for="notas"><g:message code="incidencia.notas.label" default="Notas"/></label>
                    <div valign="top" class="value ${hasErrors(bean: incidenciaInstance, field: 'notas', 'errors')}">
                        <ul>
                            <g:each in="${incidenciaInstance?.notas?}" var="n">
                                <li><g:link controller="nota" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="nota" action="create" params="['incidencia.id': incidenciaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'nota.label', default: 'Nota')])}</g:link>
                    </div>
                </div>

                <div class="buttons">
                    <g:actionSubmit class="button save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                    <g:actionSubmit class="button delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </div>

            </div>
            <div class="cuadernoDown"></div>
        </div>
    </g:form>
</div>
</body>
</html>
