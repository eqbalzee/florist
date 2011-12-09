

<%@ page import="org.floristonline.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        
	                        <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><g:message code="product.name.label" default="Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
	                                    <g:textField name="name" value="${productInstance?.name}" />
	                                </td>
	                            </tr>
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="introductionDate"><g:message code="product.introductionDate.label" default="Introduction Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'introductionDate', 'errors')}">
                                    <g:datePicker name="introductionDate" precision="day" value="${productInstance?.introductionDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="salesDiscontinuationDate"><g:message code="product.salesDiscontinuationDate.label" default="Sales Discontinuation Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'salesDiscontinuationDate', 'errors')}">
                                    <g:datePicker name="salesDiscontinuationDate" precision="day" value="${productInstance?.salesDiscontinuationDate}"  />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="productCategories"><g:message code="product.productCategories.label" default="Product Categories" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'productCategories', 'errors')}">
                                    <g:select name="productCategories" from="${org.floristonline.ProductCategory.list()}" 
                                    multiple="yes" optionKey="id" size="5" 
                                    optionValue="${{it.description}}"
                                    value="${productInstance?.productCategories*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="productFeature"><g:message code="product.productFeature.label" default="Product Feature" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'productFeature', 'errors')}">
                                    <g:select name="productFeature" from="${org.floristonline.ProductFeature.list()}" 
                                    multiple="yes" optionKey="id" size="5" 
                                    optionValue="${{it.color + ' ' + it.description + '-' + it.size + ' ' +it.unitOfMeasure}}"
                                    value="${productInstance?.productFeature*.id}" />
                                </td>
                            </tr>
                        
                        	
                        
                            
                        
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comment"><g:message code="product.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${productInstance?.comment}" />
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
