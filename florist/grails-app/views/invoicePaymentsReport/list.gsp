
<%@ page import="org.floristonline.InvoicePaymentsReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoicePaymentsReport.id.label', default: 'Id')}" />
                        
                            <th><g:message code="invoicePaymentsReport.invoice.label" default="Invoice Id" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.invoiceItem.label" default="Invoice Item" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.product.label" default="Product" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.productFeature.label" default="Product Feature" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.quantity.label" default="Quantity" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.unitPrice.label" default="Unit Price" /></th>
                                                                                    
                            <th><g:message code="invoicePaymentsReport.payment.label" default="Payment Id" /></th>
                            
                            <th><g:message code="invoicePaymentsReport.paymentAmount.label" default="Payment Amount" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoicePaymentsReportInstanceList}" status="i" var="invoicePaymentsReportInstance">
                    
                    <g:each in="${invoicePaymentsReportInstance.payment.invoice}" status="j" var="invoiceInstance">
                    
                    <g:each in="${invoicePaymentsReportInstance.payment.invoice.invoiceItem}" status="k" var="invoiceItemInstance">
                    
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoicePaymentsReportInstance.id}">${fieldValue(bean: invoicePaymentsReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceInstance, field: "id")}</td>
                            
                            <td>${fieldValue(bean: invoiceItemInstance, field: "id")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "invoiceItem.shipmentItem.orderItem.product.name")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "invoiceItem.shipmentItem.orderItem.product.productFeature.description")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "invoiceItem.quantity")}</td>
                            
                            <td>${invoiceInstance.invoiceItem.shipmentItem.orderItem.product.priceComponent()}</td>
                            
                            <td>${fieldValue(bean: invoicePaymentsReportInstance, field: "payment.id")}</td>
                            
                            <td>${fieldValue(bean: invoicePaymentsReportInstance, field: "payment.amount")}</td>
                        
                        </tr>
                    </g:each>
                    </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoicePaymentsReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
