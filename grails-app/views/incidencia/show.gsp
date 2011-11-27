<%@ page import="es.almacen.incidencias.Incidencia" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}"/>
    <title>${incidenciaInstance?.titulo}</title>
</head>
<body>
<div class="body">
    <div id="breadCrumbText">${incidenciaInstance?.titulo}</div>
    <div class="cuaderno">
        <div class="cuadernoUp"></div>
        <div class="cuadernoBody">
            <h1><g:message code="incidencia.show" args="${[incidenciaInstance.titulo, incidenciaInstance.id]}"/></h1>
            <div class="row">
                <label><g:message code="incidencia.id.label" default="Id"/></label>
                <div class="value">${fieldValue(bean: incidenciaInstance, field: "id")}</div>
            </div>
            <div class="row">
                <label><g:message code="incidencia.estadoIncidencia.label" default="Estado Incidencia"/></label>
                <div class="value">${incidenciaInstance?.estadoIncidencia?.encodeAsHTML()}</div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.servicio.label" default="Servicio"/></label>
                <div class="value">
                    <%-- TODO: Esto hace queries para obtener el servicio [HACER UN DTO]--%>
                    <g:showServicio
                            name="servicio"
                            serviceCodigo="${incidenciaInstance?.servicio?.codigo}"
                            serviceName="${incidenciaInstance?.servicio?.nombre}"
                            servicePabellon="${incidenciaInstance?.servicio?.pabellon}"
                            servicePlanta="${incidenciaInstance?.servicio?.planta}"
                    />
                    <%--
                    <g:link controller="servicio" action="show" id="${incidenciaInstance?.servicio?.id}">${incidenciaInstance?.servicio?.encodeAsHTML()}</g:link>
                    --%>
                </div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.prioridad.label" default="Prioridad"/></label>
                <div class="value">${fieldValue(bean: incidenciaInstance, field: "prioridad")}</div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.titulo.label" default="titulo"/></label>
                <div class="value">${fieldValue(bean: incidenciaInstance, field: "titulo")}</div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.servicioTecnico.label" default="Servicio técnico"/></label>
                <div class="value">
                    <g:link controller="servicio" action="show" id="${incidenciaInstance?.servicioTecnico?.id}">${incidenciaInstance?.servicioTecnico?.encodeAsHTML()}</g:link>
                </div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.nombreContacto.label" default="Nombre Contacto"/></label>
                <div class="value">
                    <g:link controller="usuario" action="show" id="${incidenciaInstance?.contacto?.id}">${incidenciaInstance?.contacto?.encodeAsHTML()}</g:link>
                </div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.tlfContacto.label" default="Tlf Contacto"/></label>
                <div class="value">${fieldValue(bean: incidenciaInstance, field: "tlfContacto")}</div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.dateCreated.label" default="Date Created"/></label>
                <div class="value"><g:formatDate date="${incidenciaInstance?.dateCreated}"/></div>
            </div>

            <div class="row">
                <label><g:message code="incidencia.lastUpdated.label" default="Last Updated"/></label>
                <div class="value"><g:formatDate date="${incidenciaInstance?.lastUpdated}"/></div>
            </div>



            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${incidenciaInstance?.id}"/>
                    <sec:ifAnyGranted roles="ROLE_TECNICO, ROLE_ADMIN">
                        <input type="button" class="thickbox button addMaterial" value="${message(code: 'default.button.addMat.label', default: 'Add Mat')}" alt="#TB_inline?height=300&width=400&inlineId=addMat"/>
                    </sec:ifAnyGranted>
                    <sec:ifLoggedIn>
                        <input type="button" class="thickbox button addNote" value="${message(code: 'default.button.addNote.label', default: 'Add Note')}" alt="#TB_inline?height=300&width=400&inlineId=addNote"/>
                    </sec:ifLoggedIn>

                    <g:actionSubmit class="button edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/>
                    <g:actionSubmit class="button delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </g:form>
            </div>

            <div id="material">
                <h2>${message(code: 'incidencia.material.title', default: 'Material utilizado')}</h2>
                <div class="list">
                    <ul>
                        <g:each in="${incidenciaInstance.materialUtilizado}" var="mat">
                            <li>${mat.material} (${mat.cantidad})</li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
        <div class="cuadernoDown"></div>
    </div>

    <div class="hoja">
        <h2><g:message code="incidencia.notas.label" default="Notas"/></h2>
        <div class="list">
            <ul>
                <g:each in="${incidenciaInstance.notas}" var="inci">
                    <li class="nota">
                        <div class="headNota">
                            <div class="userNota"><g:link controller="usuario" action="show" id="${inci.owner.id}">${inci.owner?.encodeAsHTML()}</g:link></div>
                            <div class="dateNota"><g:formatDate date="${inci.dateCreated}"/></div>
                        </div>
                        <p>${inci.texto}</p>
                    </li>
                </g:each>
            </ul>
        </div>
    </div>

</div>

<script type="text/javascript" src="${resource(dir: 'js', file: 'thickbox.js')}"></script>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'thickbox.css')}" type="text/css" media="screen"/>

<sec:ifLoggedIn>
    <div id="addNote" style="display:none">
        <g:form>
            <h2>${message(code: 'incidencia.addNote.title', default: 'Add new note')}</h2>
            <TEXTAREA name="nota" rows="4"></textarea>
            <g:textField name="incidenciaId" value="${incidenciaInstance.id}" style="display:none"/>
            <div class="buttons">
                <g:actionSubmit class="button save" action="addNote" value="${message(code: 'default.button.addNote.label', default: 'Add Note')}"/>
            </div>
        </g:form>
    </div>
</sec:ifLoggedIn>

<sec:ifAnyGranted roles="ROLE_TECNICO, ROLE_ADMIN">
    <div id="addMat" style="display:none">
        <g:form>
            <h4>${message(code: 'incidencia.addNote.title', default: 'Add new note')}</h4>
            <TEXTAREA name="nota" rows="4" cols="20"></textarea>
            <g:actionSubmit class="button addNote" action="addNote" value="${message(code: 'default.button.addNote.label', default: 'Add Note')}"/>
        </g:form>
    </div>
</sec:ifAnyGranted>
</body>
</html>
