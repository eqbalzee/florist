
<%@ page import="org.floristonline.PriceComponent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'priceComponent.label', default: 'PriceComponent')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="navTop" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>           
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponentType">Price Component Type</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            <span class="menuButton"><g:link controller="invoiceItem">Invoice Item</g:link></span>
            
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'priceComponent.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="product" title="${message(code: 'priceComponent.product.label', default: 'Product')}" />
                            
                            <th><g:message code="priceComponent.priceComponentType.label" default="Price Component Type" /></th>
                        
                            <g:sortableColumn property="price" title="${message(code: 'priceComponent.price.label', default: 'Price/Discount%')}" />
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'priceComponent.fromDate.label', default: 'From Date')}" />
                        
                        	<g:sortableColumn property="thruDate" title="${message(code: 'priceComponent.thruDate.label', default: 'Thru Date')}" />
                        	
                            <g:sortableColumn property="comment" title="${message(code: 'priceComponent.comment.label', default: 'Comment')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${priceComponentInstanceList}" status="i" var="priceComponentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${priceComponentInstance.id}">${fieldValue(bean: priceComponentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: priceComponentInstance, field: "product.name")}</td>
                            
                            <td>${fieldValue(bean: priceComponentInstance, field: "priceComponentType.description")}</td>
                            
                            <td>${fieldValue(bean: priceComponentInstance, field: "price")}</td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${priceComponentInstance.fromDate}" /></td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${priceComponentInstance.thruDate}" /></td>
                        
                            <td>${fieldValue(bean: priceComponentInstance, field: "comment")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${priceComponentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
