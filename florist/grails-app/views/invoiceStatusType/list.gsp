
<%@ page import="org.floristonline.InvoiceStatusType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceStatusType.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="invoiceStatusType" title="${message(code: 'invoiceStatusType.invoiceStatusType.label', default: 'Invoice Status Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceStatusTypeInstanceList}" status="i" var="invoiceStatusTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceStatusTypeInstance.id}">${fieldValue(bean: invoiceStatusTypeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceStatusTypeInstance, field: "invoiceStatusType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceStatusTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
