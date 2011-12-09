

<%@ page import="org.floristonline.ShipmentItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentItem.label', default: 'ShipmentItem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentStatus">Shipment Status</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
        </div>
        <div>
        &nbsp;
        </div>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderItem"><g:message code="shipmentItem.orderItem.label" default="Order Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemInstance, field: 'orderItem', 'errors')}">
                                    <g:select name="orderItem.id" 
                                    from="${org.floristonline.OrderItem.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.product.name + ' - Ordered Quantity: ' + it.quantity}}"
                                    value="${shipmentItemInstance?.orderItem?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="shipmentItem.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: shipmentItemInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentStatus"><g:message code="shipmentItem.shipmentStatus.label" default="Shipment Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemInstance, field: 'shipmentStatus', 'errors')}">
                                    <g:select name="shipmentStatus.id" 
                                    from="${org.floristonline.ShipmentStatus.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.shipmentStatusType.shipmentStatusType + ' ' + it.statusDate}}"
                                    value="${shipmentItemInstance?.shipmentStatus?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentContentsDescription"><g:message code="shipmentItem.shipmentContentsDescription.label" default="Shipment Contents Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentItemInstance, field: 'shipmentContentsDescription', 'errors')}">
                                    <g:textField name="shipmentContentsDescription" value="${shipmentItemInstance?.shipmentContentsDescription}" />
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
