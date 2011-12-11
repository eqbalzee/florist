

<%@ page import="org.floristonline.ProductFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productFeature.label', default: 'ProductFeature')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productFeatureInstance}">
            <div class="errors">
                <g:renderErrors bean="${productFeatureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="productFeature.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${org.floristonline.Product.list()}" optionKey="id" 
                                    optionValue="${{it.name}}"
                                    value="${productFeatureInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="color"><g:message code="productFeature.color.label" default="Color" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'color', 'errors')}">
                                    <g:textField name="color" value="${productFeatureInstance?.color}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="productFeature.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${productFeatureInstance?.description}" />
                                </td>
                            </tr>
                        
                            
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quality"><g:message code="productFeature.quality.label" default="Quality" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'quality', 'errors')}">
                                    <g:textField name="quality" value="${productFeatureInstance?.quality}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size"><g:message code="productFeature.size.label" default="Size" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'size', 'errors')}">
                                    <g:textField name="size" value="${productFeatureInstance?.size}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromDate"><g:message code="productFeature.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${productFeatureInstance?.fromDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thruDate"><g:message code="productFeature.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${productFeatureInstance?.thruDate}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
