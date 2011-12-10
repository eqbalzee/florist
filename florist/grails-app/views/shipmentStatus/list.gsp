
<%@ page import="org.floristonline.ShipmentStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentStatus.label', default: 'ShipmentStatus')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            <span class="menuButton"><g:link controller="shipmentStatusType">Shipment Status Type</g:link></span>
            
        </div>
        <div>
        &nbsp;
        </div>
        <div class="nav">
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'shipmentStatus.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="orderItem" title="${message(code: 'shipmentStatus.orderItem.label', default: 'Order Item')}" />
                        
                            <th><g:message code="shipmentStatus.shipmentStatusType.label" default="Shipment Status Type" /></th>
                            
                            <g:sortableColumn property="statusDate" title="${message(code: 'shipmentStatus.statusDate.label', default: 'Status Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipmentStatusInstanceList}" status="i" var="shipmentStatusInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shipmentStatusInstance.id}">${fieldValue(bean: shipmentStatusInstance, field: "id")}</g:link></td>
                            
                            <td>${fieldValue(bean: shipmentStatusInstance, field: "shipmentItem.id")}</td>
                        
                            <td>${fieldValue(bean: shipmentStatusInstance, field: "shipmentStatusType.shipmentStatusType")}</td>
                            
                            <td><g:formatDate format="MM-dd-yyyy" date="${shipmentStatusInstance.statusDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentStatusInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
