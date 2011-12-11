
<%@ page import="org.floristonline.OrderItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderItem.label', default: 'OrderItem')}" />
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
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
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
                            <td valign="top" class="name"><g:message code="orderItem.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderItemInstance, field: "id")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.productOrder.label" default="Order Id" /></td>
                            
                            <td valign="top" class="value"><g:link controller="productOrder" action="show" id="${orderItemInstance?.productOrder?.id}">${orderItemInstance?.productOrder?.id}</g:link></td>
                            
                        </tr>
                    	
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.product.label" default="Product" /></td>
                            
                            <td valign="top" class="value"><g:link controller="product" action="show" id="${orderItemInstance?.product?.id}">${orderItemInstance?.product?.name}</g:link></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.itemDescription.label" default="Item Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderItemInstance, field: "itemDescription")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.unitPrice.label" default="Unit Price" /></td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${orderItemInstance.product.priceComponent()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                            
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderItemInstance, field: "quantity")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.estimatedDeliveryDate.label" default="Estimated Delivery Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${orderItemInstance?.estimatedDeliveryDate}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.contactMechanism.label" default="Contact Mechanism" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactMechanism" action="show" id="${orderItemInstance?.contactMechanism?.id}">${orderItemInstance?.contactMechanism?.address}, ${orderItemInstance?.contactMechanism?.city}, ${orderItemInstance?.contactMechanism?.state}, ${orderItemInstance?.contactMechanism?.zipCode}</g:link></td>
                            
                        </tr>
                    
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.shippingInstructions.label" default="Shipping Instructions" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderItemInstance, field: "shippingInstructions")}</td>
                            
                        </tr>
                    
                        
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="orderItem.comment.label" default="Comment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderItemInstance, field: "comment")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${orderItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
