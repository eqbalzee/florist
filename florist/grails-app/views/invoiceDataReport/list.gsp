
<%@ page import="org.floristonline.InvoiceDataReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceDataReport.id.label', default: 'Id')}" />
                        
                           <th> <g:message code="invoiceDataReport.invoice.label" default="Invoice Id" /></th>
                            
                            <th><g:message code="invoiceDataReport.invoice.label" default="Invoice Date" /></th>
                            
                           <th> <g:message code="invoiceDataReport.invoice.label" default="Message" /></th>
                            
                            <th><g:message code="invoiceDataReport.invoice.label" default="Description" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceDataReportInstanceList}" status="i" var="invoiceDataReportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceDataReportInstance.id}">${fieldValue(bean: invoiceDataReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceDataReportInstance, field: "invoice.id")}</td>
                            
                            <td><g:formatDate format="yyyy-MM-dd" date="${fieldValue(bean: invoiceInstance, field: "invoice.invoiceDate")}" /></td>
                            
                            <td>${fieldValue(bean: invoiceDataReportInstance, field: "invoice.message")}</td>
                            
                            <td>${fieldValue(bean: invoiceDataReportInstance, field: "invoice.description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceDataReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
