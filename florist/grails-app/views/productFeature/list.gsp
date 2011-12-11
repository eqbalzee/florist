
<%@ page import="org.floristonline.ProductFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productFeature.label', default: 'ProductFeature')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productFeature.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="product" title="${message(code: 'productFeature.product.label', default: 'Product')}" />
                            
                            <g:sortableColumn property="image" title="${message(code: 'productFeature.image.label', default: 'Image')}" />
                                                                                
                            <g:sortableColumn property="description" title="${message(code: 'productFeature.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="size" title="${message(code: 'productFeature.size.label', default: 'Size')}" />
                            
                            <g:sortableColumn property="color" title="${message(code: 'productFeature.color.label', default: 'Color')}" />
                            
                            <g:sortableColumn property="quality" title="${message(code: 'productFeature.quality.label', default: 'Quality')}" />
                            
                            <g:sortableColumn property="fromDate" title="${message(code: 'productFeature.fromDate.label', default: 'From Date')}" />
                                                                            
                            <g:sortableColumn property="thruDate" title="${message(code: 'productFeature.thruDate.label', default: 'Thru Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productFeatureInstanceList}" status="i" var="productFeatureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productFeatureInstance.id}">${fieldValue(bean: productFeatureInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productFeatureInstance, field: "product.name")}</td>
                            
                            <td><g:link controller="product" action="image" id="${productFeatureInstance.id}" target="_blank">
                            		<img width="80" height="80" src="${createLink(controller:'product', action:'image', id: productFeatureInstance.product.id)}"/>
                            	</g:link>
                            </td>
                            
                            <td>${fieldValue(bean: productFeatureInstance, field: "description")}</td>
                            
                            <td>${fieldValue(bean: productFeatureInstance, field: "size")}</td>
                            
                            <td>${fieldValue(bean: productFeatureInstance, field: "color")}</td>
                            
                            <td>${fieldValue(bean: productFeatureInstance, field: "quality")}</td>
                                                                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${productFeatureInstance.fromDate}" /></td>
                                                                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${productFeatureInstance.thruDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productFeatureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
