
<%@ page import="org.floristonline.InvoiceItemPaymentsReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceItemPaymentsReport.id.label', default: 'Id')}" />
                            
                        	<g:sortableColumn property="invoiceItemId" title="${message(code: 'salesAndPurchaseOrderReport.invoiceItemId.label', default: 'Invoice Item Id')}" />
                        	
                        	<g:sortableColumn property="invoiceAmount" title="${message(code: 'salesAndPurchaseOrderReport.invoiceAmount.label', default: 'Invoice Amount')}" />
                        	
                        	<g:sortableColumn property="paymentId" title="${message(code: 'salesAndPurchaseOrderReport.paymentId.label', default: 'Payment Id')}" />
                        	
                        	<g:sortableColumn property="paymentAmount" title="${message(code: 'salesAndPurchaseOrderReport.paymentAmount.label', default: 'Payment Amount')}" />
                        	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceItemPaymentsReportInstanceList}" status="i" var="invoiceItemPaymentsReportInstance">
                    
                    <g:each in="${invoiceItemPaymentsReportInstance.invoiceItem}" status="j" var="invoiceItemInstance">
                    
                    <g:each in="${invoiceItemInstance.payments}" status="k" var="paymentsInstance">
                    
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceItemPaymentsReportInstance.id}">${fieldValue(bean: invoiceItemPaymentsReportInstance, field: "id")}</g:link></td>
                        	
                        	<td>${fieldValue(bean: invoiceItemInstance, field: "id")}</td>                       	
                        	                        	
                        	<td>${invoiceItemInstance.shipmentItem.orderItem.product.priceComponent() * invoiceItemInstance.quantity}</td>
                        	                        	                        	
                        	<td>${paymentsInstance.id}</td>
                        	
                        	<td>${paymentsInstance.amount}</td>
                        	
                        </tr>
                    </g:each>    
                    </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceItemPaymentsReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
