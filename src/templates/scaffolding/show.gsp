<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="breadCrumbText"><g:message code="default.show.label" args="[entityName]" /></div>
        <div class="body">
            <div class="cuaderno">
		<div class="cuadernoUp"> </div>
		<div class="cuadernoBody">
            		<h1><g:message code="default.show.label" args="[entityName]" /></h1>

                    <%  excludedProps = Event.allEvents.toList() << 'version'
                        allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
                        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        props.each { p -> %>
			<div class="row">
                            	<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
                            <%  if (p.isEnum()) { %>
                            	<div class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</div>
                            <%  } else if (p.oneToMany || p.manyToMany) { %>
                            	<div class="value">
                	                <ul>
                       		        <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                                	    <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                                	</g:each>
                                	</ul>
                            	</div>
                            <%  } else if (p.manyToOne || p.oneToOne) { %>
                            	<div class="value">
					<g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
				</div>
                            <%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
	                        <div class="value"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></div>
                            <%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                            	<div class="value"><g:formatDate date="\${${propertyName}?.${p.name}}" /></div>
                            <%  } else if(!p.type.isArray()) { %>
	                        <div valign="top" class="value">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</div>
                            <%  } %>
                        </div>
                    <%  } %>

		        <div class="buttons">
                		<g:form>
		                    <g:hiddenField name="id" value="\${${propertyName}?.id}" />
                    			<g:actionSubmit class="button edit" action="edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    			<g:actionSubmit class="button delete" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                		</g:form>
            		</div>
 
                </div>
                <div class="cuadernoDown"> </div>
            </div>
       </div>
    </body>
</html>
