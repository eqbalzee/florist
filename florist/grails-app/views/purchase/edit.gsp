

<%@ page import="org.floristonline.Purchase" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchase.label', default: 'Purchase')}" />
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
            <g:hasErrors bean="${purchaseInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${purchaseInstance?.id}" />
                <g:hiddenField name="version" value="${purchaseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderDate"><g:message code="purchase.orderDate.label" default="Order Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'orderDate', 'errors')}">
                                    <g:textField name="orderDate" value="${purchaseInstance?.orderDate}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderItems"><g:message code="purchase.orderItems.label" default="Order Items" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseInstance, field: 'orderItems', 'errors')}">
                                    
<ul>
<g:each in="${purchaseInstance?.orderItems?}" var="o">
    <li><g:link controller="purchaseItem" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="purchaseItem" action="create" params="['purchase.id': purchaseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'purchaseItem.label', default: 'PurchaseItem')])}</g:link>

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
