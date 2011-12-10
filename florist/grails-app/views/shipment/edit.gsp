

<%@ page import="org.floristonline.Shipment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipment.label', default: 'Shipment')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${shipmentInstance?.id}" />
                <g:hiddenField name="version" value="${shipmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedReadyDate"><g:message code="shipment.estimatedReadyDate.label" default="Estimated Ready Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'estimatedReadyDate', 'errors')}">
                                    <g:datePicker name="estimatedReadyDate" precision="day" value="${shipmentInstance?.estimatedReadyDate}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedShipDate"><g:message code="shipment.estimatedShipDate.label" default="Estimated Ship Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'estimatedShipDate', 'errors')}">
                                    <g:datePicker name="estimatedShipDate" precision="day" value="${shipmentInstance?.estimatedShipDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedArrivalDate"><g:message code="shipment.estimatedArrivalDate.label" default="Estimated Arrival Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'estimatedArrivalDate', 'errors')}">
                                    <g:datePicker name="estimatedArrivalDate" precision="day" value="${shipmentInstance?.estimatedArrivalDate}"  />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estimatedShipCost"><g:message code="shipment.estimatedShipCost.label" default="Estimated Ship Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'estimatedShipCost', 'errors')}">
                                    <g:textField name="estimatedShipCost" value="${fieldValue(bean: shipmentInstance, field: 'estimatedShipCost')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="actualShipCost"><g:message code="shipment.actualShipCost.label" default="Actual Ship Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'actualShipCost', 'errors')}">
                                    <g:textField name="actualShipCost" value="${fieldValue(bean: shipmentInstance, field: 'actualShipCost')}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="handlingInstructions"><g:message code="shipment.handlingInstructions.label" default="Handling Instructions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'handlingInstructions', 'errors')}">
                                    <g:textField name="handlingInstructions" value="${shipmentInstance?.handlingInstructions}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated"><g:message code="shipment.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${shipmentInstance?.lastUpdated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="latestCancelDate"><g:message code="shipment.latestCancelDate.label" default="Latest Cancel Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'latestCancelDate', 'errors')}">
                                    <g:datePicker name="latestCancelDate" precision="day" value="${shipmentInstance?.latestCancelDate}"  />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentType"><g:message code="shipment.shipmentType.label" default="Shipment Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentType', 'errors')}">
                                    <g:select name="shipmentType.id" 
                                    from="${org.floristonline.ShipmentType.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.description}}"
                                    value="${shipmentInstance?.shipmentType?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippedFromContactMechanism"><g:message code="shipment.shippedFromContactMechanism.label" default="Shipped From Contact Mechanism" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shippedFromContactMechanism', 'errors')}">
                                    <g:select name="shippedFromContactMechanism.id" 
                                    from="${org.floristonline.ContactMechanism.list()}" optionKey="id" 
                                    optionValue="${{it.address + ', ' + it.city + ', ' + it.state + ', ' + it.zipCode}}"
                                    value="${shipmentInstance?.shippedFromContactMechanism?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippedFromParty"><g:message code="shipment.shippedFromParty.label" default="Shipped From Party" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shippedFromParty', 'errors')}">
                                    <g:select name="shippedFromParty.id" from="${org.floristonline.Party.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${shipmentInstance?.shippedFromParty?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippedToContactMechanism"><g:message code="shipment.shippedToContactMechanism.label" default="Shipped To Contact Mechanism" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shippedToContactMechanism', 'errors')}">
                                    <g:select name="shippedToContactMechanism.id" 
                                    from="${org.floristonline.ContactMechanism.list()}" optionKey="id" 
                                    optionValue="${{it.address + ', ' + it.city + ', ' + it.state + ', ' + it.zipCode}}"
                                    value="${shipmentInstance?.shippedToContactMechanism?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippedToParty"><g:message code="shipment.shippedToParty.label" default="Shipped To Party" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shippedToParty', 'errors')}">
                                    <g:select name="shippedToParty.id" from="${org.floristonline.Party.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${shipmentInstance?.shippedToParty?.id}"  />
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
