
<%@ page import="org.floristonline.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'customer.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'customer.address.label', default: 'Address')}" />
                        
                            <g:sortableColumn property="birthDate" title="${message(code: 'customer.birthDate.label', default: 'Birth Date')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'customer.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="deliveryLocation" title="${message(code: 'customer.deliveryLocation.label', default: 'Delivery Location')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'customer.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${customerInstanceList}" status="i" var="customerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${customerInstance.id}">${fieldValue(bean: customerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "birthDate")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "deliveryLocation")}</td>
                        
                            <td>${fieldValue(bean: customerInstance, field: "email")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${customerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
