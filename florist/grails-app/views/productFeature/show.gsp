
<%@ page import="org.floristonline.ProductFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productFeature.label', default: 'ProductFeature')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated Cost</g:link></span>
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
                            <td valign="top" class="name"><g:message code="productFeature.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "id")}</td>
                            
                        </tr>
                    	
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "description")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.fromDate.label" default="From Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productFeatureInstance?.fromDate}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.thruDate.label" default="Thru Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productFeatureInstance?.thruDate}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.color.label" default="Color" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "color")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.estimatedProductCost.label" default="Estimated Product Cost" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${productFeatureInstance.estimatedProductCost}" var="e">
                                    <li><g:link controller="estimatedProductCost" action="show" id="${e.id}">$${e?.cost}-${e.estimatedProductCostType?.description }</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.priceComponent.label" default="Price Component" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${productFeatureInstance.priceComponent}" var="e">
                                    <li><g:link controller="priceComponent" action="show" id="${e.id}">$${e?.price}-${e.priceComponentType?.description }</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.product_Quality.label" default="Product Quality" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "product_Quality")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.size.label" default="Size" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "size")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productFeature.unitOfMeasure.label" default="Unit Of Measure" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productFeatureInstance, field: "unitOfMeasure")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productFeatureInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
