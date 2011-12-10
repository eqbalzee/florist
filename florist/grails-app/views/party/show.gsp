
<%@ page import="org.floristonline.Party" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                            <td valign="top" class="name"><g:message code="party.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "id")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.firstName.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "firstName")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.lastName.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "lastName")}</td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="party.middleName.label" default="Middle Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "middleName")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.currentPersonalTitle.label" default="Current Personal Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "currentPersonalTitle")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.gender.label" default="Gender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "gender")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.birthDate.label" default="Birth Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${partyInstance?.birthDate}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.maritalStatus.label" default="Marital Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "maritalStatus")}</td>
                            
                        </tr>
                        
                        
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="party.socialSecurityNo.label" default="Social Security No" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "socialSecurityNo")}</td>
                            
                        </tr>
                        
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.contactMechanism.label" default="Contact Address" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${partyInstance.contactMechanism}" var="c">
                                    <li><g:link controller="contactMechanism" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        
                    
                        
                    
                        
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.partyRole.label" default="Party Role" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${partyInstance.partyRole}" var="p">
                                    <li><g:link controller="partyRole" action="show" id="${p.id}">${p?.name}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.totalWorkExperience.label" default="Total Work Experience" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "totalWorkExperience")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="party.comment.label" default="Comment" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: partyInstance, field: "comment")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${partyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
