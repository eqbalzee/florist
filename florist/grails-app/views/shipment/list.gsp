
<%@ page import="org.floristonline.Shipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipment.label', default: 'Shipment')}" />
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
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'shipment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="shipmentType" title="${message(code: 'shipment.shipmentType.label', default: 'Shipment Type')}" />
                            
                            <g:sortableColumn property="estimatedReadyDate" title="${message(code: 'shipment.estimatedReadyDate.label', default: 'Estimated Ready Date')}" />
                            
                        	<g:sortableColumn property="estimatedShipDate" title="${message(code: 'shipment.estimatedShipDate.label', default: 'Estimated Ship Date')}" />
                        	
                            <g:sortableColumn property="estimatedArrivalDate" title="${message(code: 'shipment.estimatedArrivalDate.label', default: 'Estimated Arrival Date')}" />
                        
                            
                        
                            <g:sortableColumn property="estimatedShipCost" title="${message(code: 'shipment.estimatedShipCost.label', default: 'Estimated Ship Cost')}" />
                        
                            <g:sortableColumn property="actualShipCost" title="${message(code: 'shipment.actualShipCost.label', default: 'Actual Ship Cost')}" />
                            
                            
                        	
                        	<g:sortableColumn property="handlingInstructions" title="${message(code: 'shipment.handlingInstructions.label', default: 'Handling Instructions')}" />
                        	
                        	<g:sortableColumn property="lastUpdated" title="${message(code: 'shipment.lastUpdated.label', default: 'Last Updated')}" />
                        	
                        	<g:sortableColumn property="latestCancelDate" title="${message(code: 'shipment.estimatedShipDate.label', default: 'Latest Cancel Date')}" />
                        	                        	
                        	<g:sortableColumn property="shippedFromParty" title="${message(code: 'shipment.shippedFromParty.label', default: 'Shipped From Party')}" />
                        	
                        	<th><g:message code="shipment.shippedFromContactMechanism.label" default="Shipped From Contact Mechanism" /></th>
                        	
                        	<g:sortableColumn property="shippedToParty" title="${message(code: 'shipment.shippedToParty.label', default: 'Shipped To Party')}" />
                        	
                        	<th><g:message code="shipment.shippedToContactMechanism.label" default="Shipped To Contact Mechanism" /></th>
                        	
                        	
                        	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipmentInstanceList}" status="i" var="shipmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${shipmentInstance.id}">${fieldValue(bean: shipmentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shipmentInstance, field: "shipmentType.description")}</td>
                            
                            <td><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance.estimatedReadyDate}" /></td>                           
                            
                        	<td><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance.estimatedShipDate}" /></td>
                        	
                            <td><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance.estimatedArrivalDate}" /></td>
                        
                            
                        
                            <td>${fieldValue(bean: shipmentInstance, field: "estimatedShipCost")}</td>
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "actualShipCost")}</td>
                        
                            
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "handlingInstructions")}</td>
                            
                            <td><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance.lastUpdated}" /></td>
                            
                            <td><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance.latestCancelDate}" /></td>
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "shippedFromParty.firstName")} ${fieldValue(bean: shipmentInstance, field: "shippedFromParty.lastName")}</td>
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "shippedFromContactMechanism")}</td>
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "shippedToParty.firstName")} ${fieldValue(bean: shipmentInstance, field: "shippedToParty.lastName")}</td>
                            
                            <td>${fieldValue(bean: shipmentInstance, field: "shippedToContactMechanism")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
