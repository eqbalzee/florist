
<%@ page import="org.floristonline.ShipmentDataAndContactMechanismsReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport')}" />
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
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentStatus">Shipment Status</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
            
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'shipmentDataAndContactMechanismsReport.id.label', default: 'Id')}" />
                        
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Shipment" /></th>
                            
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Shipment Type" /></th>
                            
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Estimated Ship Date" /></th>
                            
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Estimated Arrival Date" /></th>
                            
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Shipped-To Party And Postal Address" /></th>
                            
                            <th><g:message code="shipmentDataAndContactMechanismsReport.shipment.label" default="Shipped-From Party And Postal Address" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipmentDataAndContactMechanismsReportInstanceList}" status="i" var="shipmentDataAndContactMechanismsReportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shipmentDataAndContactMechanismsReportInstance.id}">${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.id")}</td>
                            
                            <td>${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shipmentType.description")}</td>
                        	
                        	<td><g:formatDate format="yyyy-MM-dd" date="${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.estimatedShipDate")}" /></td>
                        	
                        	<td><g:formatDate format="yyyy-MM-dd" date="${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.estimatedArrivalDate")}" /></td>
                        	
                        	<td>${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedToParty.firstName")} 
                        	${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedToParty.lastName")} 
                        	${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedToContactMechanism")}</td>
                        	
                        	<td>${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedFromParty.firstName")} 
                        	${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedFromParty.lastName")} 
                        	${fieldValue(bean: shipmentDataAndContactMechanismsReportInstance, field: "shipment.shippedFromContactMechanism")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentDataAndContactMechanismsReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
