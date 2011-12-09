
<%@ page import="org.floristonline.InvoiceStatusDataReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="partyRole">Party Role</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
        </div>
        <div>
        &nbsp;
        </div>
        <div class="nav">
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceStatusDataReport.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="product" title="${message(code: 'invoiceStatusDataReport.invoice.label', default: 'Invoice Id')}" />
                                                        
                            <g:sortableColumn property="statusType" title="${message(code: 'invoiceStatusDataReport.invoice.label', default: 'Status Type')}" />
                            
                            <g:sortableColumn property="statusDate" title="${message(code: 'invoiceStatusDataReport.invoice.label', default: 'Status Date')}" />
                                                    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceStatusDataReportInstanceList}" status="i" var="invoiceStatusDataReportInstance">
                    <g:each in="${invoiceStatusDataReportInstance.invoice}" status="j" var="invoiceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceStatusDataReportInstance.id}">${fieldValue(bean: invoiceStatusDataReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceInstance, field: "id")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "invoiceStatusType.invoiceStatusType")}</td>
                                                       
                            <td><g:formatDate format="yyyy-MM-dd" date="${fieldValue(bean: invoiceInstance, field: "invoiceStatus.date")}" /></td>
                        
                        </tr>
                        </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceStatusDataReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
