
<%@ page import="es.almacen.incidencias.Incidencia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'incidencia.label', default: 'Incidencia')}" />
        <title><g:message code="incidencia.title.list"/></title>
    </head>
    <body>
        <div id="breadCrumbText"><g:message code="incidencia.title.list"/></div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <div class="list">
                <g:form action="list" method="POST">
                    <g:submitButton name="submit" value="subimt" style="display:none" id="submitSearch"/>
                    <g:hiddenField name="sort"    value="${params.sort}" />
                    <g:hiddenField name="order"   value="${params.order}" />
                    <table>
                        <thead>
                            <tr>
                                <g:sortableColumn property="id" title="${message(code: 'incidencia.id.label', default: 'Id')}" />
                                <g:sortableColumn property="estadoIncidencia" title="${message(code: 'incidencia.estadoIncidencia.label', default: 'Estado Incidencia')}" />
                                <th><g:message code="incidencia.servicio.label" default="Servicio" /></th>
                                <g:sortableColumn property="prioridad" title="${message(code: 'incidencia.prioridad.label', default: 'Prioridad')}" />
                                <g:sortableColumn property="titulo" title="${message(code: 'incidencia.titulo.label', default: 'Titulo')}" />
                                <th><g:message code="incidencia.tecnico.label" default="Tecnico" /></th>
                            </tr>
                            <tr>
                                <td class="inputSearch"><g:textField name="id"        value="${params.id}"      /></td>
                                <td class="inputSearch"><g:textField name="estado"    value="${params.estado}"  /></td>
                                <td class="inputSearch"><g:textField name="servicio"  value="${params.servicio}"/></td>
                                <td class="inputSearch"><g:textField name="prioridad" value="${params.prioridad}"    /></td>
                                <td class="inputSearch"><g:textField name="titulo"    value="${params.titulo}"  /></td>
                                <td class="inputSearch"><g:textField name="tecnico"   value="${params.tecnico}" /></td>
                            </tr>
                        </thead>
                        <tbody>
                        <g:each in="${incidenciaInstanceList}" status="i" var="incidenciaInstance">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="show" id="${incidenciaInstance.id}">${fieldValue(bean: incidenciaInstance, field: "id")}</g:link></td>
                                <td>${fieldValue(bean: incidenciaInstance, field: "estadoIncidencia")}</td>
                                <td>${fieldValue(bean: incidenciaInstance, field: "servicio")}</td>
                                <td>${fieldValue(bean: incidenciaInstance, field: "prioridad")}</td>
                                <td>${fieldValue(bean: incidenciaInstance, field: "titulo")}</td>
                                <td>${fieldValue(bean: incidenciaInstance, field: "tecnico")}</td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </g:form>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${incidenciaInstanceTotal}" params="${params}"/>
                <a href="" class="searchButton" onclick="$('#submitSearch').click(); return false;">search</a>
            </div>
        </div>
    </body>
</html>
