
<%@ page import="es.almacen.servicios.Servicio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <div id="breadCrumbText"><g:message code="default.list.label" args="[entityName]" /></div>
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <div class="listTableContainer">
                <div class="list">
                    <g:form action="list" method="POST">
                        <g:submitButton name="submit" value="subimt" style="display:none" id="submitSearch"/>
                        <g:hiddenField name="sort"    value="${params.sort}" />
                        <g:hiddenField name="order"   value="${params.order}" />
                        <table>
                            <thead>
                                <tr>
                                
                                    <g:sortableColumn property="id" title="${message(code: 'servicio.id.label', default: 'Id')}" />
                                
                                    <g:sortableColumn property="nombre" title="${message(code: 'servicio.nombre.label', default: 'Nombre')}" />
                                
                                    <th><g:message code="servicio.responsable.label" default="Responsable" /></th>
                                
                                    <g:sortableColumn property="tipoServicio" title="${message(code: 'servicio.tipoServicio.label', default: 'Tipo Servicio')}" />
                                
                                    <g:sortableColumn property="pabellon" title="${message(code: 'servicio.pabellon.label', default: 'Pabellon')}" />
                                
                                    <g:sortableColumn property="planta" title="${message(code: 'servicio.planta.label', default: 'Planta')}" />
                                
                                </tr>
                                <tr>
                                     
                                        <td class="inputSearch"><g:textField name="id" value="${params.id}"/></td>
                                     
                                        <td class="inputSearch"><g:textField name="nombre" value="${params.nombre}"/></td>
                                     
                                        <td class="inputSearch"><g:textField name="responsable" value="${params.responsable}"/></td>
                                     
                                        <td class="inputSearch"><g:textField name="tipoServicio" value="${params.tipoServicio}"/></td>
                                     
                                        <td class="inputSearch"><g:textField name="pabellon" value="${params.pabellon}"/></td>
                                     
                                        <td class="inputSearch"><g:textField name="planta" value="${params.planta}"/></td>
                                     
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${servicioInstanceList}" status="i" var="servicioInstance">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                
                                    <td><g:link action="show" id="${servicioInstance.id}">${fieldValue(bean: servicioInstance, field: "id")}</g:link></td>
                                
                                    <td>${fieldValue(bean: servicioInstance, field: "nombre")}</td>
                                
                                    <td>${fieldValue(bean: servicioInstance, field: "responsable")}</td>
                                
                                    <td>${fieldValue(bean: servicioInstance, field: "tipoServicio")}</td>
                                
                                    <td>${fieldValue(bean: servicioInstance, field: "pabellon")}</td>
                                
                                    <td>${fieldValue(bean: servicioInstance, field: "planta")}</td>
                                
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </g:form>
                </div>
                <div class="paginateButtons">
                    <g:paginate total="${servicioInstanceTotal}" />
                    <a href="" class="searchButton" onclick="$('#submitSearch').click(); return false;">search</a>
                </div>
            </div>
        </div>
    </body>
</html>
