<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
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
                        <g:hiddenField name="sort"    value="\${params.sort}" />
                        <g:hiddenField name="order"   value="\${params.order}" />
                        <table>
                            <thead>
                                <tr>
                                <%  excludedProps = Event.allEvents.toList() << 'version'
                                    allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
                                    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && !Collection.isAssignableFrom(it.type) }
                                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                                    props.eachWithIndex { p, i ->
                                        if (i < 6) {
                                            if (p.isAssociation()) { %>
                                    <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                                <%      } else { %>
                                    <g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
                                <%  }   }   } %>
                                </tr>
                                <tr>
                                     <%props.eachWithIndex { p, i ->%>
                                        <td class="inputSearch"><g:textField name="${p.name}" value="\${params.${p.name}}"/></td>
                                     <% } %>
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                                <tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
                                <%  props.eachWithIndex { p, i ->
                                        if (i == 0) { %>
                                    <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                                <%      } else if (i < 6) {
                                            if (p.type == Boolean.class || p.type == boolean.class) { %>
                                    <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                                <%          } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                                    <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                                <%          } else { %>
                                    <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                                <%  }   }   } %>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </g:form>
                </div>
                <div class="paginateButtons">
                    <g:paginate total="\${${propertyName}Total}" />
                    <a href="" class="searchButton" onclick="\$('#submitSearch').click(); return false;">search</a>
                </div>
            </div>
        </div>
    </body>
</html>
