

<%@ page import="org.floristonline.ProductFeature" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productFeature.label', default: 'ProductFeature')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productFeatureInstance}">
            <div class="errors">
                <g:renderErrors bean="${productFeatureInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productFeatureInstance?.id}" />
                <g:hiddenField name="version" value="${productFeatureInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedProductCost"><g:message code="productFeature.estimatedProductCost.label" default="Estimated Product Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'estimatedProductCost', 'errors')}">
                                    <g:select name="estimatedProductCost" from="${org.floristonline.EstimatedProductCost.list()}" multiple="yes"
                                     optionKey="id" size="5" 
                                     optionValue="${{'$' + ' ' + it.cost +  '-' + it.estimatedProductCostType?.description}}"
                                     value="${productFeatureInstance?.estimatedProductCost*.id}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="priceComponent"><g:message code="productFeature.priceComponent.label" default="Price Component" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'priceComponent', 'errors')}">
                                    <g:select name="priceComponent" from="${org.floristonline.PriceComponent.list()}"
                                     multiple="yes" optionKey="id" size="5" 
                                     optionValue="${{'$' + ' ' + it.price +  '-' + it.priceComponentType?.description}}"
                                     value="${productFeatureInstance?.priceComponent*.id}" />
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
                                    <label for="product_Quality"><g:message code="productFeature.product_Quality.label" default="Product Quality" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'product_Quality', 'errors')}">
                                    <g:textField name="product_Quality" value="${productFeatureInstance?.product_Quality}" />
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
                                    <label for="unitOfMeasure"><g:message code="productFeature.unitOfMeasure.label" default="Unit Of Measure" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productFeatureInstance, field: 'unitOfMeasure', 'errors')}">
                                    <g:textField name="unitOfMeasure" value="${productFeatureInstance?.unitOfMeasure}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
