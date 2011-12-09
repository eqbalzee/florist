
<%@ page import="org.floristonline.ShipmentReceipt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'shipmentReceipt.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dateTimeReceived" title="${message(code: 'shipmentReceipt.dateTimeReceived.label', default: 'Date Time Received')}" />
                        
                            <g:sortableColumn property="itemDescription" title="${message(code: 'shipmentReceipt.itemDescription.label', default: 'Item Description')}" />
                        
                            <g:sortableColumn property="quantityAccepted" title="${message(code: 'shipmentReceipt.quantityAccepted.label', default: 'Quantity Accepted')}" />
                        
                            <g:sortableColumn property="quantityRejected" title="${message(code: 'shipmentReceipt.quantityRejected.label', default: 'Quantity Rejected')}" />
                        
                            <th><g:message code="shipmentReceipt.rejectionReason.label" default="Rejection Reason" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipmentReceiptInstanceList}" status="i" var="shipmentReceiptInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shipmentReceiptInstance.id}">${fieldValue(bean: shipmentReceiptInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shipmentReceiptInstance, field: "dateTimeReceived")}</td>
                        
                            <td>${fieldValue(bean: shipmentReceiptInstance, field: "itemDescription")}</td>
                        
                            <td>${fieldValue(bean: shipmentReceiptInstance, field: "quantityAccepted")}</td>
                        
                            <td>${fieldValue(bean: shipmentReceiptInstance, field: "quantityRejected")}</td>
                        
                            <td>${fieldValue(bean: shipmentReceiptInstance, field: "rejectionReason")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentReceiptInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
