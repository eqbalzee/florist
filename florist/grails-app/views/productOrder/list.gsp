
<%@ page import="org.floristonline.ProductOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productOrder.id.label', default: 'Id')}" />
                                                                                
                            <g:sortableColumn property="entryDate" title="${message(code: 'productOrder.entryDate.label', default: 'Entry Date')}" />
                        
                            <g:sortableColumn property="orderDate" title="${message(code: 'productOrder.orderDate.label', default: 'Order Date')}" />
                        
                            <g:sortableColumn property="orderType" title="${message(code: 'productOrder.orderType.label', default: 'Order Type')}" />
                                                                            
                            <g:sortableColumn property="orderEnteredBy" title="${message(code: 'productOrder.orderEnteredBy.label', default: 'Order Entered By')}" />
                            
                        	<g:sortableColumn property="orderPlacedBy" title="${message(code: 'productOrder.orderPlacedBy.label', default: 'Order Placed By')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productOrderInstanceList}" status="i" var="productOrderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productOrderInstance.id}">${fieldValue(bean: productOrderInstance, field: "id")}</g:link></td>
                        
                                                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${productOrderInstance.entryDate}" /></td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${productOrderInstance.orderDate}" /></td>
                        
                            <td>${fieldValue(bean: productOrderInstance, field: "orderType.description")}</td>
                                                                                
                            <td>${fieldValue(bean: productOrderInstance, field: "orderEnteredBy.firstName")} ${fieldValue(bean: productOrderInstance, field: "orderEnteredBy.lastName")}</td>
                        
                            <td>${fieldValue(bean: productOrderInstance, field: "orderPlacedBy.firstName")} ${fieldValue(bean: productOrderInstance, field: "orderPlacedBy.lastName")}</td>
                        
                        </tr>
                    </g:each>
                    
                    
                        
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productOrderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
