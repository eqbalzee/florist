

<%@ page import="org.floristonline.ShipmentItemBilling" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentItemBillingInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentItemBillingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${shipmentItemBillingInstance?.id}" />
                <g:hiddenField name="version" value="${shipmentItemBillingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invoiceItem"><g:message code="shipmentItemBilling.invoiceItem.label" default="Invoice Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemBillingInstance, field: 'invoiceItem', 'errors')}">
                                    <g:select name="invoiceItem.id" from="${org.floristonline.OrderItem.list()}" optionKey="id" 
                                    optionValue="${{it.product.name + ' Quantity: ' + it.quantity}}"
                                    value="${shipmentItemBillingInstance?.invoiceItem?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shipmentItem"><g:message code="shipmentItemBilling.shipmentItem.label" default="Shipment Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemBillingInstance, field: 'shipmentItem', 'errors')}">
                                    <g:select name="shipmentItem.id" from="${org.floristonline.ShipmentItem.list()}" optionKey="id" 
                                    optionValue="${{it.orderItem.product.name + ' Quantity: ' + it.quantity}}"
                                    value="${shipmentItemBillingInstance?.shipmentItem?.id}"  />
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
