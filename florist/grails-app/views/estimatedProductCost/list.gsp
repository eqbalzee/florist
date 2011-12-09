
<%@ page import="org.floristonline.EstimatedProductCost" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost')}" />
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
            <span class="menuButton"><g:link controller="estimatedProductCostType">Estimated  Cost Type</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'estimatedProductCost.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="product" title="${message(code: 'estimatedProductCost.product.label', default: 'Product')}" />
                            
                            <th><g:message code="estimatedProductCost.estimatedProductCostType.label" default="Estimated Product Cost Type" /></th>
                            
                            <g:sortableColumn property="cost" title="${message(code: 'estimatedProductCost.cost.label', default: 'Cost')}" />
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'estimatedProductCost.fromDate.label', default: 'From Date')}" />
                        
                            <g:sortableColumn property="thruDate" title="${message(code: 'estimatedProductCost.thruDate.label', default: 'Thru Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${estimatedProductCostInstanceList}" status="i" var="estimatedProductCostInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${estimatedProductCostInstance.id}">${fieldValue(bean: estimatedProductCostInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: estimatedProductCostInstance, field: "product.name")}</td>
                            
                            <td>${fieldValue(bean: estimatedProductCostInstance, field: "estimatedProductCostType.description")}</td>
                            
                            <td>${fieldValue(bean: estimatedProductCostInstance, field: "cost")}</td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${estimatedProductCostInstance.fromDate}" /></td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${estimatedProductCostInstance.thruDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${estimatedProductCostInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
