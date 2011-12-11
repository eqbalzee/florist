
<%@ page import="org.floristonline.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
                            
                            <g:sortableColumn property="image" title="${message(code: 'product.image.label', default: 'Image')}" />
                            
                            <g:sortableColumn property="introductionDate" title="${message(code: 'product.introductionDate.label', default: 'Introduction Date')}" />
                        
                            <g:sortableColumn property="salesDiscontinuationDate" title="${message(code: 'product.salesDiscontinuationDate.label', default: 'Sales Discontinuation Date')}" />
                            
                            <th><g:message code="product.productCategories.label" default="Product Category" /></th>
                                                                                    
                            <g:sortableColumn property="estimatedProductCost" title="${message(code: 'product.name.label', default: 'Estimated Product Cost')}" />
                            
                            <g:sortableColumn property="priceComponent" title="${message(code: 'product.name.label', default: 'Unit Price')}" />
                            
                            <g:sortableColumn property="comment" title="${message(code: 'product.comment.label', default: 'Comment')}" />
                        	
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "name")}</td>
                            
                            <td><g:link controller="product" action="image" id="${productInstance.id}" target="_blank">
                            		<img width="80" height="80" src="${createLink(controller:'product', action:'image', id: productInstance.id)}"/>
                            	</g:link>
                            </td>
                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${productInstance.introductionDate}" /></td>
                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${productInstance.salesDiscontinuationDate}" /></td>
                            
                            <td>${fieldValue(bean: productInstance, field: "productCategories.description")}</td>
                                                                                    
                            <td><g:formatNumber number="${productInstance.estimatedProductCost()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                            
                            <td><g:formatNumber number="${productInstance.priceComponent()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                            
                            <td>${fieldValue(bean: productInstance, field: "comment")}</td>
                        
                                                  
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
