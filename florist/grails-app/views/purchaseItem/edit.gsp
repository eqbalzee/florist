

<%@ page import="org.floristonline.PurchaseItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseItem.label', default: 'PurchaseItem')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${purchaseItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${purchaseItemInstance?.id}" />
                <g:hiddenField name="version" value="${purchaseItemInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="purchaseItem.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${org.floristonline.Product.list()}" optionKey="id" value="${purchaseItemInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="purchaseItem.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="${fieldValue(bean: purchaseItemInstance, field: 'quantity')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="date"><g:message code="purchaseItem.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'date', 'errors')}">
                                    <g:textField name="date" value="${fieldValue(bean: purchaseItemInstance, field: 'date')}" />
                                </td>
                            </tr>
                            
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="purchaseMethod"><g:message code="purchaseItem.purchaseMethod.label" default="Purchase Method" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'purchaseMethod', 'errors')}">
                                    <g:select name="purchaseMethod" from="${['Master Card', 'Check', 'Cash']}" value="${fieldValue(bean: purchaseItemInstance, field: 'purchaseMethod')}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="creditCardNumber"><g:message code="purchaseItem.creditCardNumber.label" default="Credit Card Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'creditCardNumber', 'errors')}">
                                    <g:textField name="creditCardNumber" value="${fieldValue(bean: purchaseItemInstance, field: 'creditCardNumber')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expirationDate"><g:message code="purchaseItem.expirationDate.label" default="Expiration Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseItemInstance, field: 'expirationDate', 'errors')}">
                                    <g:textField name="expirationDate" value="${fieldValue(bean: purchaseItemInstance, field: 'expirationDate')}" />
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
