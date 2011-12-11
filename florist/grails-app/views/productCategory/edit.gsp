

<%@ page import="org.floristonline.ProductCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productCategory.label', default: 'ProductCategory')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="navTop" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>           
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="shipmentStatus">Shipment Status</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            <span class="menuButton"><g:link controller="invoiceItem">Invoice Item</g:link></span>
            
            
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
            <g:hasErrors bean="${productCategoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${productCategoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productCategoryInstance?.id}" />
                <g:hiddenField name="version" value="${productCategoryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="productCategory.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productCategoryInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${productCategoryInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fromDate"><g:message code="productCategory.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productCategoryInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${productCategoryInstance?.fromDate}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="thruDate"><g:message code="productCategory.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productCategoryInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${productCategoryInstance?.thruDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="primaryFlag"><g:message code="productCategory.primaryFlag.label" default="Primary Flag" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productCategoryInstance, field: 'primaryFlag', 'errors')}">
                                    <g:textField name="primaryFlag" value="${fieldValue(bean: productCategoryInstance, field: 'primaryFlag')}" />
                                </td>
                            </tr>
                        
                            
                            
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comment"><g:message code="productCategory.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productCategoryInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${productCategoryInstance?.comment}" />
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
