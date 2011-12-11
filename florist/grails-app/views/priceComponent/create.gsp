

<%@ page import="org.floristonline.PriceComponent" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'priceComponent.label', default: 'PriceComponent')}" />
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
            <span class="menuButton"><g:link controller="priceComponentType">Price Component Type</g:link></span>
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
            <g:hasErrors bean="${priceComponentInstance}">
            <div class="errors">
                <g:renderErrors bean="${priceComponentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="priceComponent.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${org.floristonline.Product.list()}" optionKey="id" 
                                    optionValue="${{it.name}}" value="${priceComponentInstance?.product?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priceComponentType"><g:message code="priceComponent.priceComponentType.label" default="Price Component Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'priceComponentType', 'errors')}">
                                    <g:select name="priceComponentType.id" from="${org.floristonline.PriceComponentType.list()}" optionKey="id" 
                                    optionValue="${{it.description}}" value="${priceComponentInstance?.priceComponentType?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="priceComponent.price.label" default="Price/Discount%" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: priceComponentInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fromDate"><g:message code="priceComponent.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${priceComponentInstance?.fromDate}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="thruDate"><g:message code="priceComponent.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${priceComponentInstance?.thruDate}"  />
                                </td>
                            </tr>
                        
                            
                        
                            
                        
                            
                        
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment"><g:message code="priceComponent.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: priceComponentInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${priceComponentInstance?.comment}" />
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
