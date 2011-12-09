
<%@ page import="org.floristonline.OrderItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderItem.label', default: 'OrderItem')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'orderItem.id.label', default: 'Id')}" />
                                                    
                            <g:sortableColumn property="product" title="${message(code: 'orderItem.product.label', default: 'Product')}" />
                            
                            <g:sortableColumn property="itemDescription" title="${message(code: 'orderItem.itemDescription.label', default: 'Item Description')}" />
                            
                            <g:sortableColumn property="unitPrice" title="${message(code: 'orderItem.unitPrice.label', default: 'Unit Price')}" />
                            
                            <g:sortableColumn property="quantity" title="${message(code: 'orderItem.quantity.label', default: 'Quantity')}" />
                        
                            <g:sortableColumn property="estimatedDeliveryDate" title="${message(code: 'orderItem.estimatedDeliveryDate.label', default: 'Estimated Delivery Date')}" />
                            
                            <th><g:message code="orderItem.contactMechanism.label" default="Contact Mechanism" /></th>
                            
                            <g:sortableColumn property="shippingInstructions" title="${message(code: 'orderItem.shippingInstructions.label', default: 'Shipping Instructions')}" />
                                              
                            <g:sortableColumn property="comment" title="${message(code: 'orderItem.comment.label', default: 'Comment')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderItemInstanceList}" status="i" var="orderItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderItemInstance.id}">${fieldValue(bean: orderItemInstance, field: "id")}</g:link></td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "product.name")}</td>
                            
                        	<td>${fieldValue(bean: orderItemInstance, field: "itemDescription")}</td>
                        	
                        	<td>${orderItemInstance.product.priceComponent()}</td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "quantity")}</td>
                        	
                        	<td><g:formatDate format="MM-dd-yyyy" date="${orderItemInstance.estimatedDeliveryDate}" /></td>
                        	
                            <td>${fieldValue(bean: orderItemInstance, field: "contactMechanism")}</td>
                        
                        	<td>${fieldValue(bean: orderItemInstance, field: "shippingInstructions")}</td>
                        
                            <td>${fieldValue(bean: orderItemInstance, field: "comment")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
