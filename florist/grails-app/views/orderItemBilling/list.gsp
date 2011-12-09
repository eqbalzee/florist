
<%@ page import="org.floristonline.OrderItemBilling" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderItemBilling.label', default: 'OrderItemBilling')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'orderItemBilling.id.label', default: 'Id')}" />
                        
                            <th><g:message code="orderItemBilling.orderItem.label" default="Order Item" /></th>
                                                                                
                            <th><g:message code="orderItemBilling.invoiceItem.label" default="Invoice Item" /></th>
                                                                           
                            <g:sortableColumn property="quantity" title="${message(code: 'orderItemBilling.quantity.label', default: 'Quantity')}" />
                        	
                        	<g:sortableColumn property="amount" title="${message(code: 'orderItemBilling.amount.label', default: 'Amount')}" />
                        	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderItemBillingInstanceList}" status="i" var="orderItemBillingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderItemBillingInstance.id}">${fieldValue(bean: orderItemBillingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: orderItemBillingInstance, field: "invoiceItem")}</td>
                        
                            <td>${fieldValue(bean: orderItemBillingInstance, field: "orderItem")}</td>
                        
                            <td>${fieldValue(bean: orderItemBillingInstance, field: "quantity")}</td>
                            
                            <td>${orderItemBillingInstance.product.priceComponent()*orderItemBillingInstance.quantity}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderItemBillingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
