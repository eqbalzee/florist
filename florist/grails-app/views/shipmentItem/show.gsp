
<%@ page import="org.floristonline.ShipmentItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentItem.label', default: 'ShipmentItem')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            <span class="menuButton"><g:link controller="invoiceItem">Invoice Item</g:link></span>
            
            
        </div>
        <div>
        &nbsp;
        </div>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "id")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.shipment.label" default="Shipment Id" /></td>
                            
                            <td valign="top" class="value"><g:link controller="shipment" action="show" id="${shipmentItemInstance?.shipment?.id}">${shipmentItemInstance?.shipment?.id}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.orderItem.label" default="Order Item" /></td>
                            
                            <td valign="top" class="value"><g:link controller="orderItem" action="show" id="${shipmentItemInstance?.orderItem?.id}">${shipmentItemInstance?.orderItem.product?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "quantity")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.unitPrice.label" default="Unit Price" /></td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${shipmentItemInstance.orderItem.product.priceComponent()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                            
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipmentItem.shipmentContentsDescription.label" default="Shipment Contents Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentItemInstance, field: "shipmentContentsDescription")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${shipmentItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
