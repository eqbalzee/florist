

<%@ page import="org.floristonline.ContactMechanism" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMechanism.label', default: 'ContactMechanism')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="partyRole">Party Role</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productCategory">Product Category</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Order</g:link></span>
            <span class="menuButton"><g:link controller="orderItem">Order Item</g:link></span>
            <span class="menuButton"><g:link controller="shipment">Shipment</g:link></span>
            <span class="menuButton"><g:link controller="shipmentItem">Shipment Item</g:link></span>
            <span class="menuButton"><g:link controller="invoice">Invoice</g:link></span>
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
            <g:hasErrors bean="${contactMechanismInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactMechanismInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${contactMechanismInstance?.id}" />
                <g:hiddenField name="version" value="${contactMechanismInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="contactMechanism.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${contactMechanismInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="contactMechanism.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${contactMechanismInstance?.city}" />
                                </td>
                            </tr>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="contactMechanism.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${contactMechanismInstance?.state}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zipCode"><g:message code="contactMechanism.zipCode.label" default="Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'zipCode', 'errors')}">
                                    <g:textField name="zipCode" value="${contactMechanismInstance?.zipCode}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="contactMechanism.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${contactMechanismInstance?.email}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cellPhone"><g:message code="contactMechanism.cellPhone.label" default="Cell Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'cellPhone', 'errors')}">
                                    <g:textField name="cellPhone" value="${contactMechanismInstance?.cellPhone}" />
                                </td>
                            </tr>
                        
                            
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNo"><g:message code="contactMechanism.phoneNo.label" default="Phone No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactMechanismInstance, field: 'phoneNo', 'errors')}">
                                    <g:textField name="phoneNo" value="${contactMechanismInstance?.phoneNo}" />
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
