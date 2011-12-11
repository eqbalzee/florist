

<%@ page import="org.floristonline.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="navTop" align="center">
            
                        
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="invoiceItem">Invoice Item</g:link></span>
            
            
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
            <g:hasErrors bean="${invoiceInstance}">
            <div class="errors">
                <g:renderErrors bean="${invoiceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${invoiceInstance?.id}" />
                <g:hiddenField name="version" value="${invoiceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="invoiceDate"><g:message code="invoice.invoiceDate.label" default="Invoice Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'invoiceDate', 'errors')}">
                                    <g:datePicker name="invoiceDate" precision="day" value="${invoiceInstance?.invoiceDate}"  />
                                </td>
                            </tr>
                            
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="billedFrom"><g:message code="invoice.billedFrom.label" default="Billed From" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'billedFrom', 'errors')}">
                                    <g:select name="billedFrom.id" from="${org.floristonline.Party.list()}" optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${invoiceInstance?.billedFrom?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sentFrom"><g:message code="invoice.sentFrom.label" default="Billed From Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'sentFrom', 'errors')}">
                                    <g:select name="sentFrom.id" from="${org.floristonline.ContactMechanism.list()}" optionKey="id" value="${invoiceInstance?.sentFrom?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="billedTo"><g:message code="invoice.billedTo.label" default="Billed To" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'billedTo', 'errors')}">
                                    <g:select name="billedTo.id" from="${org.floristonline.Party.list()}" optionKey="id" 
                                    optionValue="${{it.firstName + ' ' + it.lastName}}"
                                    value="${invoiceInstance?.billedTo?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressedTo"><g:message code="invoice.addressedTo.label" default="Billed To Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'addressedTo', 'errors')}">
                                    <g:select name="addressedTo.id" from="${org.floristonline.ContactMechanism.list()}" optionKey="id" 
                                   optionValue="${{it}}"
                                    value="${invoiceInstance?.addressedTo?.id}"  />
                                </td>
                            </tr>
                        
                            
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="invoice.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${invoiceInstance?.description}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message"><g:message code="invoice.message.label" default="Message" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceInstance, field: 'message', 'errors')}">
                                    <g:textField name="message" value="${invoiceInstance?.message}" />
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
