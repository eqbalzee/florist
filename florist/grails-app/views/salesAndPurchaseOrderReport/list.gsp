
<%@ page import="org.floristonline.SalesAndPurchaseOrderReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        	                           	
                            <g:sortableColumn property="id" title="${message(code: 'salesAndPurchaseOrderReport.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="orderId" title="${message(code: 'salesAndPurchaseOrderReport.orderId.label', default: 'Order Id')}" />
                            
                            <g:sortableColumn property="orderItemId" title="${message(code: 'salesAndPurchaseOrderReport.orderItemId.label', default: 'Order Item Id')}" />
                            
                            <g:sortableColumn property="orderType" title="${message(code: 'salesAndPurchaseOrderReport.orderType.label', default: 'Order Type')}" />
                            
                            <g:sortableColumn property="orderDate" title="${message(code: 'salesAndPurchaseOrderReport.orderDate.label', default: 'Order Date')}" />
                            
                            <g:sortableColumn property="product" title="${message(code: 'salesAndPurchaseOrderReport.product.label', default: 'Product')}" />
                            
                            <g:sortableColumn property="orderedQuantity" title="${message(code: 'salesAndPurchaseOrderReport.orderedQuantity.label', default: 'Ordered Quantity')}" />
                            
                            <g:sortableColumn property="unitPrice" title="${message(code: 'salesAndPurchaseOrderReport.unitPrice.label', default: 'Unit Price')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${salesAndPurchaseOrderReportInstanceList}" status="i" var="salesAndPurchaseOrderReportInstance">
                    <g:each in="${salesAndPurchaseOrderReportInstance.orderItem}" status="j" var="orderItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${salesAndPurchaseOrderReportInstance.id}">${fieldValue(bean: salesAndPurchaseOrderReportInstance, field: "id")}</g:link></td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "productOrder.id")}</td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "id")}</td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "productOrder.orderType.description")}</td>
                        	
                        	<td><g:formatDate format="MM-dd-yyyy" date="${orderItemInstance.productOrder.orderDate}" /></td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "product.name")}</td>
                        	
                        	<td>${fieldValue(bean: orderItemInstance, field: "quantity")}</td>
                        	
                        	<td>${orderItemInstance.product.priceComponent()}</td>
                        	
                        </tr>
                    </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${salesAndPurchaseOrderReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
