

<%@ page import="org.floristonline.ShipmentStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentStatus.label', default: 'ShipmentStatus')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentStatusInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentStatusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentItem"><g:message code="shipmentStatusInstance.shipmentItem.label" default="shipmentItem" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentStatusInstance, field: 'shipmentItem', 'errors')}">
                                    <g:select name="shipmentItem.id" 
                                    from="${org.floristonline.ShipmentItem.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.id}}"
                                    value="${shipmentStatusInstance?.shipmentItem?.id}"  />
                                </td>
                            </tr>
                            
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentStatusType"><g:message code="shipmentStatusInstance.shipmentStatusType.label" default="Shipment Status Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentStatusInstance, field: 'shipmentStatusType', 'errors')}">
                                    <g:select name="shipmentStatusType.id" 
                                    from="${org.floristonline.ShipmentStatusType.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.shipmentStatusType}}"
                                    value="${shipmentStatusInstance?.shipmentStatusType?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="statusDate"><g:message code="shipmentStatus.statusDate.label" default="Status Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentStatusInstance, field: 'statusDate', 'errors')}">
                                    <g:datePicker name="statusDate" precision="day" value="${shipmentStatusInstance?.statusDate}"  />
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
