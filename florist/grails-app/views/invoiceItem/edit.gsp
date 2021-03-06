

<%@ page import="org.floristonline.InvoiceItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceItem.label', default: 'InvoiceItem')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${invoiceItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${invoiceItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${invoiceItemInstance?.id}" />
                <g:hiddenField name="version" value="${invoiceItemInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invoice"><g:message code="invoiceItem.invoice.label" default="Invoice Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'invoice', 'errors')}">
                                    <g:select name="invoice.id" from="${org.floristonline.Invoice.list()}" optionKey="id" 
                                    optionValue="${{it.id}}"
                                    value="${invoiceItemInstance?.invoice?.id}"  />
                                </td>
                            </tr>
                            
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentItem"><g:message code="invoiceItem.shipmentItem.label" default="Shipment Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'shipmentItem', 'errors')}">
                                    <g:select name="shipmentItem.id" from="${org.floristonline.ShipmentItem.list()}" optionKey="id" 
                                    optionValue="${{it.orderItem.product.name + ' - Quantity: '+ it.orderItem.quantity}}"
                                    value="${invoiceItemInstance?.shipmentItem?.id}"  />
                                </td>
                            </tr>
                        
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="invoiceItem.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${invoiceItemInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invoiceItemType"><g:message code="invoiceItem.invoiceItemType.label" default="Invoice Item Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'invoiceItemType', 'errors')}">
                                    <g:select name="invoiceItemType.id" from="${org.floristonline.InvoiceItemType.list()}" optionKey="id" 
                                    optionValue="${{it.description}}"
                                    value="${invoiceItemInstance?.invoiceItemType?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="invoiceItem.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: invoiceItemInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="taxableFlag"><g:message code="invoiceItem.taxableFlag.label" default="Taxable Flag(Y/N)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'taxableFlagBoolean', 'errors')}">
                                    <g:checkBox name="taxableFlagBoolean" value="${invoiceItemInstance?.taxableFlagBoolean}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="payments"><g:message code="invoiceItem.payments.label" default="Payment Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceItemInstance, field: 'payments', 'errors')}">
                                    <g:select name="payments" from="${org.floristonline.Payment.list()}" multiple="yes" optionKey="id" size="5" 
                                    optionValue="${{it.id}}"
                                    value="${invoiceItemtInstance?.payments*.id}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
