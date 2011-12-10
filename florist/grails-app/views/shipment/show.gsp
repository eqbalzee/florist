
<%@ page import="org.floristonline.Shipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipment.label', default: 'Shipment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentInstance, field: "id")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.estimatedReadyDate.label" default="Estimated Ready Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance?.estimatedReadyDate}" /></td>
                            
                        </tr>
                    	
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.estimatedShipDate.label" default="Estimated Ship Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance?.estimatedShipDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.estimatedArrivalDate.label" default="Estimated Arrival Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance?.estimatedArrivalDate}" /></td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.estimatedShipCost.label" default="Estimated Ship Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentInstance, field: "estimatedShipCost")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.actualShipCost.label" default="Actual Ship Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentInstance, field: "actualShipCost")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.handlingInstructions.label" default="Handling Instructions" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: shipmentInstance, field: "handlingInstructions")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.latestCancelDate.label" default="Latest Cancel Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${shipmentInstance?.latestCancelDate}" /></td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.shipmentType.label" default="Shipment Type" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${shipmentInstance.shipmentType}" var="s">
                                    <li><g:link controller="shipmentType" action="show" id="${s.id}">${s?.description}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.shippedFromContactMechanism.label" default="Shipped From Contact Mechanism" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactMechanism" action="show" 
                            id="${shipmentInstance?.shippedFromContactMechanism?.id}">
                            ${shipmentInstance?.shippedFromContactMechanism?.address}, ${shipmentInstance?.shippedFromContactMechanism?.city}, ${shipmentInstance?.shippedFromContactMechanism?.state}, ${shipmentInstance?.shippedFromContactMechanism?.zipCode}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.shippedFromParty.label" default="Shipped From Party" /></td>
                            
                            <td valign="top" class="value"><g:link controller="party" action="show" id="${shipmentInstance?.shippedFromParty?.id}">${shipmentInstance?.shippedFromParty?.firstName} ${shipmentInstance?.shippedFromParty?.lastName}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.shippedToContactMechanism.label" default="Shipped To Contact Mechanism" /></td>
                            
                            <td valign="top" class="value"><g:link controller="contactMechanism" action="show" id="${shipmentInstance?.shippedToContactMechanism?.id}">
                            ${shipmentInstance?.shippedToContactMechanism?.address}, ${shipmentInstance?.shippedToContactMechanism?.city}, ${shipmentInstance?.shippedToContactMechanism?.state}, ${shipmentInstance?.shippedToContactMechanism?.zipCode}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="shipment.shippedToParty.label" default="Shipped To Party" /></td>
                            
                            <td valign="top" class="value"><g:link controller="party" action="show" id="${shipmentInstance?.shippedToParty?.id}">${shipmentInstance?.shippedToParty?.firstName} ${shipmentInstance?.shippedToParty?.lastName}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${shipmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
