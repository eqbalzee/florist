
<%@ page import="org.floristonline.Party" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="navTop" align="center">
            
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'party.id.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="firstName" title="${message(code: 'party.firstName.label', default: 'First Name')}" />
                            
                            <g:sortableColumn property="lastName" title="${message(code: 'party.lastName.label', default: 'Last Name')}" />
                            
                            <g:sortableColumn property="middleName" title="${message(code: 'party.middleName.label', default: 'Middle Name')}" />
                                                                                                
                            <g:sortableColumn property="gender" title="${message(code: 'party.gender.label', default: 'Gender')}" />
                        
                            <g:sortableColumn property="birthDate" title="${message(code: 'party.birthDate.label', default: 'Birth Date')}" />
                        	                        	                        	
                        	<g:sortableColumn property="socialSecurityNo" title="${message(code: 'party.socialSecurityNo.label', default: 'Social Security No')}" />
                        	                        	                       	
                            <g:sortableColumn property="contactAddress" title="${message(code: 'party.contactAddress.label', default: 'Contact Address')}" />
                            
                            <g:sortableColumn property="comment" title="${message(code: 'party.comment.label', default: 'Comment')}" />
                        
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${partyInstanceList}" status="i" var="partyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${partyInstance.id}">${fieldValue(bean: partyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "firstName")}</td>
                            
                            <td>${fieldValue(bean: partyInstance, field: "lastName")}</td>
                            
                            <td>${fieldValue(bean: partyInstance, field: "middleName")}</td>
                                                     
                                                                                  
                            <td>${fieldValue(bean: partyInstance, field: "gender")}</td>
                            
                            <td><g:formatDate format="yyyy-MM-dd" date="${partyInstance.birthDate}" /></td>
                                                        
                            <td>${fieldValue(bean: partyInstance, field: "socialSecurityNo")}</td>
                            
                            <td>${fieldValue(bean: partyInstance, field: "contactMechanism")}</td>                            
                                                                      
                            <td>${fieldValue(bean: partyInstance, field: "comment")}</td>
                        
                            
                        
                            
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${partyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
