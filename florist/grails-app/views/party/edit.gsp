

<%@ page import="org.floristonline.Party" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${partyInstance}">
            <div class="errors">
                <g:renderErrors bean="${partyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${partyInstance?.id}" />
                <g:hiddenField name="version" value="${partyInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="party.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${partyInstance?.firstName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="party.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${partyInstance?.lastName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="middleName"><g:message code="party.middleName.label" default="Middle Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'middleName', 'errors')}">
                                    <g:textField name="middleName" value="${partyInstance?.middleName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="currentPersonalTitle"><g:message code="party.currentPersonalTitle.label" default="Current Personal Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'currentPersonalTitle', 'errors')}">
                                    <g:textField name="currentPersonalTitle" value="${partyInstance?.currentPersonalTitle}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="party.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'gender', 'errors')}">
                                    <g:textField name="gender" value="${partyInstance?.gender}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthDate"><g:message code="party.birthDate.label" default="Birth Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'birthDate', 'errors')}">
                                    <g:datePicker name="birthDate" precision="day" value="${partyInstance?.birthDate}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="socialSecurityNo"><g:message code="party.socialSecurityNo.label" default="Social Security No" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'socialSecurityNo', 'errors')}">
                                    <g:textField name="socialSecurityNo" value="${partyInstance?.socialSecurityNo}" />
                                </td>
                            </tr>
                        	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="maritalStatus"><g:message code="party.maritalStatus.label" default="Marital Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'maritalStatus', 'errors')}">
                                    <g:textField name="maritalStatus" value="${partyInstance?.maritalStatus}" />
                                </td>
                            </tr>
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactMechanism"><g:message code="party.contactMechanism.label" default="Contact Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'contactMechanism', 'errors')}">
                                    <g:select name="contactMechanism" 
                                    from="${org.floristonline.ContactMechanism.list()}" 
                                    multiple="yes" optionKey="id" size="5"
                                    optionValue="${{it}}" 
                                    value="${partyInstance?.contactMechanism*.id}" />
                                </td>
                            </tr>
                        
                            
                        
                            
                        
                            
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="partyRole"><g:message code="party.partyRole.label" default="Party Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'partyRole', 'errors')}">
                                    <g:select name="partyRole" from="${org.floristonline.PartyRole.list()}" 
                                    multiple="yes" optionKey="id" size="5" 
                                    optionValue="${{it.name}}" 
                                    value="${partyInstance?.partyRole*.id}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="totalWorkExperience"><g:message code="party.totalWorkExperience.label" default="Total Work Experience" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'totalWorkExperience', 'errors')}">
                                    <g:textField name="totalWorkExperience" value="${fieldValue(bean: partyInstance, field: 'totalWorkExperience')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comment"><g:message code="party.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: partyInstance, field: 'comment', 'errors')}">
                                    <g:textField name="comment" value="${partyInstance?.comment}" />
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
