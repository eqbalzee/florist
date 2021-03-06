
<%@ page import="org.floristonline.InvoiceItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceItem.label', default: 'InvoiceItem')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="navTop" align="center">
            
                        
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            <span class="menuButton"><g:link controller="payment">Payment</g:link></span>
            
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceItem.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="invoiceId" title="${message(code: 'invoiceItem.invoice.invoiceId.label', default: 'Invoice Id')}" />
                            
                            <th><g:message code="invoiceItem.shipmentItem.label" default="Shipment Item" /></th>
                        
                            <g:sortableColumn property="description" title="${message(code: 'invoiceItem.description.label', default: 'Description')}" />
                        
                            <th><g:message code="invoiceItem.invoiceItemType.label" default="Invoice Item Type" /></th>
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'invoiceItem.quantity.label', default: 'Quantity')}" />
                        
                        	<g:sortableColumn property="unitPrice" title="${message(code: 'invoiceItem.unitPrice.label', default: 'Unit Price')}" />
                        	
                        	<g:sortableColumn property="amount" title="${message(code: 'invoiceItem.quantity.label', default: 'Amount')}" />
                        	
                        	<g:sortableColumn property="taxableFlag" title="${message(code: 'invoiceItem.taxableFlag.label', default: 'Taxable')}" /> 
                        	
                        	<g:sortableColumn property="paymentId" title="${message(code: 'invoiceItem.paymentId.label', default: 'Payment Id')}" />   
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceItemInstanceList}" status="i" var="invoiceItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceItemInstance.id}">${fieldValue(bean: invoiceItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "invoice.id")}</td>
                            
                            <td>${fieldValue(bean: invoiceItemInstance, field: "shipmentItem.orderItem.product.name")}</td>
                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "invoiceItemType.description")}</td>
                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "quantity")}</td>
                            
                            
                            <td><g:formatNumber number="${invoiceItemInstance.shipmentItem.orderItem.product.priceComponent()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                            
                        	
                        	
                        	<td><g:formatNumber number="${invoiceItemInstance.shipmentItem.orderItem.product.priceComponent()*invoiceItemInstance.quantity}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                        	
                        	<td><g:formatBoolean boolean="${invoiceItemInstance?.taxableFlagBoolean}" true="Yes" false="No"/></td>
                            
                        	<td>${fieldValue(bean: invoiceItemInstance, field: "payments.id")}</td>
                        	
                        	
                        	
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
