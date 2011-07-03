
<%@ page import="es.almacen.incidencias.material.Material" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <!-- AUTOSUGEST -->
        <script src="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.js')}"  type="text/javascript"></script>
        <link rel="stylesheet" href="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.css')}" type="text/css"> </link>
    </head>
    <body>
        <div class="body">
            <div id="breadCrumbText"><g:message code="default.list.label" args="[entityName]" /></div>
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:form action="list" method="POST">
                <div class="listTableContainer">
                    <div class="list">
                            <g:submitButton name="submit" value="subimt" style="display:none" id="submitSearch"/>
                            <g:hiddenField name="sort"    value="${params.sort}" />
                            <g:hiddenField name="order"   value="${params.order}" />
                            <table>
                                <thead>
                                    <tr>

                                        <g:sortableColumn property="id" title="${message(code: 'material.id.label', default: 'Id')}" />

                                        <g:sortableColumn property="nombre" title="${message(code: 'material.nombre.label', default: 'Nombre')}" />

                                        <g:sortableColumn property="referencia" title="${message(code: 'material.referencia.label', default: 'Referencia')}" />

                                        <g:sortableColumn property="cantidad" title="${message(code: 'material.cantidad.label', default: 'Cantidad')}" />

                                    </tr>
                                    <tr>

                                            <td class="inputSearch"><g:textField name="id" value="${params.id}"/></td>

                                            <td class="inputSearch"><g:textField name="nombre" value="${params.nombre}"/></td>

                                            <td class="inputSearch"><g:textField name="referencia" value="${params.referencia}"/></td>

                                            <td class="inputSearch"><g:textField name="cantidad" value="${params.cantidad}"/></td>

                                    </tr>
                                </thead>
                                <tbody>
                                <g:each in="${materialInstanceList}" status="i" var="materialInstance">
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                        <td><g:link action="show" id="${materialInstance.id}">${fieldValue(bean: materialInstance, field: "id")}</g:link></td>

                                        <td>${fieldValue(bean: materialInstance, field: "nombre")}</td>

                                        <td>${fieldValue(bean: materialInstance, field: "referencia")}</td>

                                        <td>${fieldValue(bean: materialInstance, field: "cantidad")}</td>

                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${materialInstanceTotal}" />
                        <a href="" class="searchButton" onclick="$('#submitSearch').click(); return false;">search</a>
                    </div>
                </div>
                <div class="hoja">
                    <h2><g:message code="material.list.filtro" default="Etiquetas a mostrar"/></h2>
                    <div class="list">

                        <input type="text" id="tagSuggest" autocomplete="off"/>
                        <script type="text/javascript">

//                        $("#tagSuggest").click(function() {
//                            $("#tagSuggest").val('');
//                        });
//                        $("#tagSuggest").blur(function() {
 //                           $("#tagSuggest").val('');
//                        });
                        $("#tagSuggest").autocomplete({
                                url:'<g:createLink controller="material" action="listTags" />',
//                                sortFunction: function(a, b, filter) {
//                                    return 0;
//                               },
                               showResult: function(value, data) {
                                  return '<p style="text-transform:capitalize">' + value + '</p>';
                               },
                                onItemSelect: function(item) {
                                    var text =  item.value;
                                    if (item.data.length) {
                                        text += ' <i>' + item.data.join(', ') + '</i>';
                                    }
                                    var li = '<li><div class="buttons"><div class="delete"/></div><span>'+text+'</span><input type="hidden" value="'+text+'" name="tags"/></li>';
                                    $("#listTagsSelected").append(li);
                                    $("#tagSuggest").val('');
                                },
                                maxItemsToShow: 5
                            });
                        </script>


                        <ul id="listTagsSelected">
                            <g:each in="${tagList}" var="tag">
                                <li>
                                    <g:checkBox name="tags" value="${tag}"/>${tag}
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </g:form>
        </div>
    </body>
</html>
