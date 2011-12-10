
<%@ page import="org.floristonline.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
        </div>
        <div>
        &nbsp;
        </div>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.image.label" default="Image" /></td>
                            
                            <td valign="top" class="value">
                            	<g:link controller="product" action="image" id="${productInstance.id}" target="_blank">
                            		<img width="110" height="110" src="${createLink(controller:'product', action:'image', id: productInstance.id)}"/>
                            	</g:link>
                            </td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.introductionDate.label" default="Introduction Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productInstance?.introductionDate}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.salesDiscontinuationDate.label" default="Sales Discontinuation Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productInstance?.salesDiscontinuationDate}" /></td>
                            
                        </tr>
                                            	                        
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="product.productCategories.label" default="Product Categories" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${productInstance.productCategories}" var="p">
                                    <li><g:link controller="productCategory" action="show" id="${p.id}">${p?.description}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    	
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="product.estimatedProductCost.label" default="Estimated Product Cost" /></td>
                            
                            <td valign="top" class="value">${productInstance.estimatedProductCost()}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.priceComponent.label" default="Unit Price" /></td>
                            
                            <td valign="top" class="value">${productInstance.priceComponent()}</td>
                            
                        </tr>
                    
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.comment.label" default="Comment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "comment")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
