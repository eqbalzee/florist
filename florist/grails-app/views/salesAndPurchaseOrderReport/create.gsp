

<%@ page import="org.floristonline.SalesAndPurchaseOrderReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${salesAndPurchaseOrderReportInstance}">
            <div class="errors">
                <g:renderErrors bean="${salesAndPurchaseOrderReportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderItem"><g:message code="salesAndPurchaseOrderReport.orderItem.label" default="Order Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: salesAndPurchaseOrderReportInstance, field: 'orderItem', 'errors')}">
                                    <g:select name="orderItem" from="${org.floristonline.OrderItem.list()}" multiple="yes" optionKey="id" size="5" 
                                    optionValue="${{it.id}}"
                                    value="${salesAndPurchaseOrderReportInstance?.orderItem*.id}" />
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
