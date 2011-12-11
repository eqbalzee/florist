
<%@ page import="org.floristonline.ReportShipmentStatusData" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="partyRole">Party Role</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'reportShipmentStatusData.id.label', default: 'Id')}" />
                        
                            <th><g:message code="reportShipmentStatusData.shipment.label" default="Shipment" /></th>
                            
                            <th><g:message code="reportShipmentStatusData.shipment.label" default="Shipment Item Id" /></th>
                            
                            <g:sortableColumn property="shipmentStatus" title="${message(code: 'reportShipmentStatusData.shipment.label', default: 'Shipment Status')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportShipmentStatusDataInstanceList}" status="i" var="reportShipmentStatusDataInstance">
                    
                    <g:each in="${reportShipmentStatusDataInstance.shipmentItem}" status="j" var="shipmentItemInstance">
                    
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reportShipmentStatusDataInstance.id}">${fieldValue(bean: reportShipmentStatusDataInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shipmentItemInstance, field: "shipment.id")}</td>
                            
                            <td>${fieldValue(bean: shipmentItemInstance, field: "id")}</td>
                            
                            <td>${fieldValue(bean: shipmentItemInstance, field: "orderItem.product.name")}</td>
                            
                        		
                        </tr>
                    </g:each>    
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportShipmentStatusDataInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
