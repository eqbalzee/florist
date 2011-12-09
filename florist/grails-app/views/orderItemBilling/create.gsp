

<%@ page import="org.floristonline.OrderItemBilling" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderItemBilling.label', default: 'OrderItemBilling')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${orderItemBillingInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderItemBillingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderItem"><g:message code="orderItemBilling.orderItem.label" default="Order Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemBillingInstance, field: 'orderItem', 'errors')}">
                                    <g:select name="orderItem.id" from="${org.floristonline.OrderItem.list()}" optionKey="id" 
                                    optionValue="${{it.product.name + ' Quantity: ' + it.quantity}}"
                                    value="${orderItemBillingInstance?.orderItem?.id}"  />
                                </td>
                            </tr>
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invoiceItem"><g:message code="orderItemBilling.invoiceItem.label" default="Invoice Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemBillingInstance, field: 'invoiceItem', 'errors')}">
                                    <g:select name="invoiceItem.id" from="${org.floristonline.InvoiceItem.list()}" optionKey="id" 
                                    optionValue="${{it.product.name}}"
                                    value="${orderItemBillingInstance?.invoiceItem?.id}"  />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="orderItemBilling.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemBillingInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: orderItemBillingInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                            
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
