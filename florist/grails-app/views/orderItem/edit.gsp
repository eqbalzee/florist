

<%@ page import="org.floristonline.OrderItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderItem.label', default: 'OrderItem')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
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
            <g:hasErrors bean="${orderItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${orderItemInstance?.id}" />
                <g:hiddenField name="version" value="${orderItemInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="productOrder"><g:message code="orderItem.productOrder.label" default="Order Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'productOrder', 'errors')}">
                                    <g:select name="productOrder.id" 
                                    from="${org.floristonline.ProductOrder.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.id}}"
                                    value="${orderItemInstance?.productOrder?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="orderItem.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" 
                                    from="${org.floristonline.Product.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.name}}"
                                    value="${orderItemInstance?.product?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="itemDescription"><g:message code="orderItem.itemDescription.label" default="Item Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'itemDescription', 'errors')}">
                                    <g:textField name="itemDescription" value="${orderItemInstance?.itemDescription}" />
                                </td>
                            </tr>
                            
                                                    	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="orderItem.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: orderItemInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedDeliveryDate"><g:message code="orderItem.estimatedDeliveryDate.label" default="Estimated Delivery Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'estimatedDeliveryDate', 'errors')}">
                                    <g:datePicker name="estimatedDeliveryDate" precision="day" value="${orderItemInstance?.estimatedDeliveryDate}"  />
                                </td>
                            </tr>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactMechanism"><g:message code="orderItem.contactMechanism.label" default="Contact Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'contactMechanism', 'errors')}">
                                    <g:select name="contactMechanism.id" 
                                    from="${org.floristonline.ContactMechanism.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.address + ', ' + it.city + ', ' + it.state + ', ' + it.zipCode}}"
                                    
                                    value="${orderItemInstance?.contactMechanism?.id}"  />
                                </td>
                            </tr>
                        
                            
                        
                            
                            
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippingInstructions"><g:message code="orderItem.shippingInstructions.label" default="Shipping Instructions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'shippingInstructions', 'errors')}">
                                    <g:textField name="shippingInstructions" value="${orderItemInstance?.shippingInstructions}" />
                                </td>
                            </tr>
                        
                            
                        	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comment"><g:message code="orderItem.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderItemInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${orderItemInstance?.comment}" />
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
