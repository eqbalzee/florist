

<%@ page import="org.floristonline.ProductOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
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
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
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
            <g:hasErrors bean="${productOrderInstance}">
            <div class="errors">
                <g:renderErrors bean="${productOrderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productOrderInstance?.id}" />
                <g:hiddenField name="version" value="${productOrderInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entryDate"><g:message code="productOrder.entryDate.label" default="Entry Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productOrderInstance, field: 'entryDate', 'errors')}">
                                    <g:datePicker name="entryDate" precision="day" value="${productOrderInstance?.entryDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderDate"><g:message code="productOrder.orderDate.label" default="Order Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productOrderInstance, field: 'orderDate', 'errors')}">
                                    <g:datePicker name="orderDate" precision="day" value="${productOrderInstance?.orderDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="orderType"><g:message code="productOrder.orderType.label" default="Order Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productOrderInstance, field: 'orderType', 'errors')}">
                                    <g:select name="orderType.id" from="${org.floristonline.OrderType.list()}" optionKey="id" 
                                    optionValue="${{it.description}}"
                                    value="${productOrderInstance?.orderType?.id}"  />
                                </td>
                            </tr>
                        
                            
                        
                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderEnteredBy"><g:message code="productOrder.orderEnteredBy.label" default="Order Entered By" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productOrderInstance, field: 'orderEnteredBy', 'errors')}">
                                    <g:select name="orderEnteredBy.id" from="${org.floristonline.Party.list()}" optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${productOrderInstance?.orderEnteredBy?.id}"  />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderPlacedBy"><g:message code="productOrder.orderPlacedBy.label" default="Order Placed By" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productOrderInstance, field: 'orderPlacedBy', 'errors')}">
                                    <g:select name="orderPlacedBy.id" from="${org.floristonline.Party.list()}" optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${productOrderInstance?.orderPlacedBy?.id}"  />
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
