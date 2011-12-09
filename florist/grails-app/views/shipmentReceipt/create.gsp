

<%@ page import="org.floristonline.ShipmentReceipt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt')}" />
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
            <g:hasErrors bean="${shipmentReceiptInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentReceiptInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateTimeReceived"><g:message code="shipmentReceipt.dateTimeReceived.label" default="Date Time Received" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentReceiptInstance, field: 'dateTimeReceived', 'errors')}">
                                    <g:textField name="dateTimeReceived" value="${shipmentReceiptInstance?.dateTimeReceived}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="itemDescription"><g:message code="shipmentReceipt.itemDescription.label" default="Item Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentReceiptInstance, field: 'itemDescription', 'errors')}">
                                    <g:textField name="itemDescription" value="${shipmentReceiptInstance?.itemDescription}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantityAccepted"><g:message code="shipmentReceipt.quantityAccepted.label" default="Quantity Accepted" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentReceiptInstance, field: 'quantityAccepted', 'errors')}">
                                    <g:textField name="quantityAccepted" value="${fieldValue(bean: shipmentReceiptInstance, field: 'quantityAccepted')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantityRejected"><g:message code="shipmentReceipt.quantityRejected.label" default="Quantity Rejected" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentReceiptInstance, field: 'quantityRejected', 'errors')}">
                                    <g:textField name="quantityRejected" value="${fieldValue(bean: shipmentReceiptInstance, field: 'quantityRejected')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rejectionReason"><g:message code="shipmentReceipt.rejectionReason.label" default="Rejection Reason" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentReceiptInstance, field: 'rejectionReason', 'errors')}">
                                    <g:select name="rejectionReason.id" from="${org.floristonline.RejectionReason.list()}" optionKey="id" value="${shipmentReceiptInstance?.rejectionReason?.id}"  />
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
