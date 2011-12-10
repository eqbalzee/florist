
<%@ page import="org.floristonline.InvoiceStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceStatus.label', default: 'InvoiceStatus')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceStatus.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="invoiceId" title="${message(code: 'invoiceStatus.InvoiceId.label', default: 'Invoice ID')}" />
                            
                            <th><g:message code="invoiceStatus.invoiceItem.label" default="Invoice Item Id" /></th>
                            
                            <g:sortableColumn property="invoiceStatusType" title="${message(code: 'invoiceStatus.invoiceStatusType.label', default: 'Status')}" />
                                                                           
                            <g:sortableColumn property="statusDate" title="${message(code: 'invoiceStatus.statusDate.label', default: 'Status Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceStatusInstanceList}" status="i" var="invoiceStatusInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceStatusInstance.id}">${fieldValue(bean: invoiceStatusInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceStatusInstance, field: "invoiceItem.id")}</td>
                            
                            <td>${fieldValue(bean: invoiceStatusInstance, field: "invoiceItem.id")}</td>
                            
                            <td>${fieldValue(bean: invoiceStatusInstance, field: "invoiceStatusType.invoiceStatusType")}</td>
                                                                            
                            <td><g:formatDate date="${invoiceStatusInstance.statusDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceStatusInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
