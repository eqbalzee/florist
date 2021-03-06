
<%@ page import="org.floristonline.ContactMechanism" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMechanism.label', default: 'ContactMechanism')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "address")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.cellPhone.label" default="Cell Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "cellPhone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.phoneNo.label" default="Phone No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "phoneNo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "state")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="contactMechanism.zipCode.label" default="Zip Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactMechanismInstance, field: "zipCode")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${contactMechanismInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
