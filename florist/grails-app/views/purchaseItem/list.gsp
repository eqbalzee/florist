
<%@ page import="org.floristonline.PurchaseItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseItem.label', default: 'PurchaseItem')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'purchaseItem.id.label', default: 'Id')}" />
                        
                            
                        
                            <th><g:message code="purchaseItem.product.label" default="Product" /></th>
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'purchaseItem.quantity.label', default: 'Quantity')}" />
                        
                            <g:sortableColumn property="totalPrice" title="${message(code: 'purchaseItem.totalPrice.label', default: 'Total Price')}" />
                        	<g:sortableColumn property="date" title="${message(code: 'purchaseItem.quantity.label', default: 'Date')}" />
                        	<g:sortableColumn property="purchaseMethod" title="${message(code: 'purchaseItem.purchaseMethod.label', default: 'Purchase Method')}" />
                        	<g:sortableColumn property="creditCardNumber" title="${message(code: 'purchaseItem.purchaseMethod.label', default: 'Credit Card Number')}" />
                        	<g:sortableColumn property="expirationDate" title="${message(code: 'purchaseItem.purchaseMethod.label', default: 'Expiration Date')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseItemInstanceList}" status="i" var="purchaseItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purchaseItemInstance.id}">${fieldValue(bean: purchaseItemInstance, field: "id")}</g:link></td>
                        
                                                    
                            <td>${fieldValue(bean: purchaseItemInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: purchaseItemInstance, field: "quantity")}</td>
                        
                            <td>${fieldValue(bean: purchaseItemInstance, field: "totalPrice")}</td>
                            <td>${fieldValue(bean: purchaseItemInstance, field: "date")}</td>
                            <td>${fieldValue(bean: purchaseItemInstance, field: "purchaseMethod")}</td>
                            <td>${fieldValue(bean: purchaseItemInstance, field: "creditCardNumber")}</td>
                            <td>${fieldValue(bean: purchaseItemInstance, field: "expirationDate")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
