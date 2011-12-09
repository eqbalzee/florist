
<%@ page import="org.floristonline.BillingAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'billingAccount.label', default: 'BillingAccount')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'billingAccount.id.label', default: 'Id')}" />
                        
                            <th><g:message code="billingAccount.billedAt.label" default="Billed At" /></th>
                        
                            <th><g:message code="billingAccount.billingAccountRole.label" default="Billing Account Role" /></th>
                        
                            <g:sortableColumn property="description" title="${message(code: 'billingAccount.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'billingAccount.fromDate.label', default: 'From Date')}" />
                        
                            <g:sortableColumn property="thruDate" title="${message(code: 'billingAccount.thruDate.label', default: 'Thru Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${billingAccountInstanceList}" status="i" var="billingAccountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${billingAccountInstance.id}">${fieldValue(bean: billingAccountInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: billingAccountInstance, field: "billedAt")}</td>
                        
                            <td>${fieldValue(bean: billingAccountInstance, field: "billingAccountRole")}</td>
                        
                            <td>${fieldValue(bean: billingAccountInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${billingAccountInstance.fromDate}" /></td>
                        
                            <td><g:formatDate date="${billingAccountInstance.thruDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${billingAccountInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
