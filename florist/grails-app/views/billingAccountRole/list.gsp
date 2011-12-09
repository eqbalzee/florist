
<%@ page import="org.floristonline.BillingAccountRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'billingAccountRole.label', default: 'BillingAccountRole')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'billingAccountRole.id.label', default: 'Id')}" />
                        
                            <th><g:message code="billingAccountRole.accountFor.label" default="Account For" /></th>
                        
                            <th><g:message code="billingAccountRole.billingAccountRoleType.label" default="Billing Account Role Type" /></th>
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'billingAccountRole.fromDate.label', default: 'From Date')}" />
                        
                            <g:sortableColumn property="thruDate" title="${message(code: 'billingAccountRole.thruDate.label', default: 'Thru Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${billingAccountRoleInstanceList}" status="i" var="billingAccountRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${billingAccountRoleInstance.id}">${fieldValue(bean: billingAccountRoleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: billingAccountRoleInstance, field: "accountFor")}</td>
                        
                            <td>${fieldValue(bean: billingAccountRoleInstance, field: "billingAccountRoleType")}</td>
                        
                            <td><g:formatDate date="${billingAccountRoleInstance.fromDate}" /></td>
                        
                            <td><g:formatDate date="${billingAccountRoleInstance.thruDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${billingAccountRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
