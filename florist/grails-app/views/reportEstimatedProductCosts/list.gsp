
<%@ page import="org.floristonline.ReportEstimatedProductCosts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'reportEstimatedProductCosts.id.label', default: 'Id')}" />
                        
                            <th><g:message code="reportEstimatedProductCosts.product.label" default="Product" /></th>
                            
                            <th><g:message code="reportEstimatedProductCosts.product.estimatedProductCost.estimatedProductCostType.label" default="Cost Type" /></th>
                            
                        	<th><g:message code="reportEstimatedProductCosts.product.estimatedProductCost.label" default="Cost" /></th>
                        	
                        	<th><g:message code="reportEstimatedProductCosts.product.estimatedProductCost.label" default="From Date" /></th>
                        	
                        	<th><g:message code="reportEstimatedProductCosts.product.estimatedProductCost.label" default="Thru Date" /></th>
                        	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportEstimatedProductCostsInstanceList}" status="i" var="reportEstimatedProductCostsInstance">
                    
                    <g:each in="${reportEstimatedProductCostsInstance.product.estimatedProductCost}" status="j" var="estimatedProductCostInstance">
                    
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reportEstimatedProductCostsInstance.id}">${fieldValue(bean: reportEstimatedProductCostsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reportEstimatedProductCostsInstance, field: "product.name")}</td>
                            
                            <td>${fieldValue(bean: reportEstimatedProductCostsInstance, field: "product.estimatedProductCost.estimatedProductCostType.description")}</td>
                        
                        </tr>
                    </g:each>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportEstimatedProductCostsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
