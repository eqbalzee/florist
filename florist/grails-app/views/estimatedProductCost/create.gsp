

<%@ page import="org.floristonline.EstimatedProductCost" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${estimatedProductCostInstance}">
            <div class="errors">
                <g:renderErrors bean="${estimatedProductCostInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="estimatedProductCost.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estimatedProductCostInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" 
                                    from="${org.floristonline.Product.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.name}}"
                                    value="${estimatedProductCostInstance?.product?.id}"  />
                                </td>
                            </tr>
                        	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estimatedProductCostType"><g:message code="estimatedProductCost.estimatedProductCostType.label" default="Estimated Product Cost Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estimatedProductCostInstance, field: 'estimatedProductCostType', 'errors')}">
                                    <g:select name="estimatedProductCostType.id" 
                                    from="${org.floristonline.EstimatedProductCostType.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.description}}"
                                    value="${estimatedProductCostInstance?.estimatedProductCostType?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cost"><g:message code="estimatedProductCost.cost.label" default="Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estimatedProductCostInstance, field: 'cost', 'errors')}">
                                    <g:textField name="cost" value="${fieldValue(bean: estimatedProductCostInstance, field: 'cost')}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromDate"><g:message code="estimatedProductCost.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estimatedProductCostInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${estimatedProductCostInstance?.fromDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thruDate"><g:message code="estimatedProductCost.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: estimatedProductCostInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${estimatedProductCostInstance?.thruDate}"  />
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
