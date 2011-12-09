
<%@ page import="org.floristonline.ProductCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productCategory.id.label', default: 'Id')}" />
                        
                            
                        
                            <g:sortableColumn property="description" title="${message(code: 'productCategory.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'productCategory.fromDate.label', default: 'From Date')}" />
                        
                        	<g:sortableColumn property="thruDate" title="${message(code: 'productCategory.thruDate.label', default: 'Thru Date')}" />
                        	
                            <g:sortableColumn property="primaryFlag" title="${message(code: 'productCategory.primaryFlag.label', default: 'Primary Flag')}" />
                        
                                                   	
                        	<g:sortableColumn property="comment" title="${message(code: 'productCategory.comment.label', default: 'Comment')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productCategoryInstanceList}" status="i" var="productCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productCategoryInstance.id}">${fieldValue(bean: productCategoryInstance, field: "id")}</g:link></td>
                        
                            
                        
                            <td>${fieldValue(bean: productCategoryInstance, field: "description")}</td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${productCategoryInstance.fromDate}" /></td>
                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${productCategoryInstance.thruDate}" /></td>
                        
                            <td>${fieldValue(bean: productCategoryInstance, field: "primaryFlag")}</td>
                        
                                                        
                            <td>${fieldValue(bean: productCategoryInstance, field: "comment")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productCategoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
