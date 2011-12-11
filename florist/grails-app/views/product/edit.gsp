

<%@ page import="org.floristonline.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${productInstance?.id}" />
                <g:hiddenField name="version" value="${productInstance?.version}" />
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
                                    <label for="image"><g:message code="product.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'image', 'errors')}">
                                    <input type="file" id="image" name="image" /><br/>
                                    <img width="110" height="110" src="${createLink(controller:'product', action:'image', id: productInstance.id)}"/>
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
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
