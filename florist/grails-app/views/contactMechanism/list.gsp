
<%@ page import="org.floristonline.ContactMechanism" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactMechanism.label', default: 'ContactMechanism')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactMechanism.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'contactMechanism.address.label', default: 'Address')}" />
                            
                            <g:sortableColumn property="city" title="${message(code: 'contactMechanism.city.label', default: 'City')}" />
                            
                            <g:sortableColumn property="state" title="${message(code: 'contactMechanism.state.label', default: 'State')}" />
                            
                            <g:sortableColumn property="zipCode" title="${message(code: 'contactMechanism.zipCode.label', default: 'Zip Code')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'contactMechanism.email.label', default: 'Email')}" />
                            
                            <g:sortableColumn property="cellPhone" title="${message(code: 'contactMechanism.cellPhone.label', default: 'Cell Phone')}" />
                                                                        
                                                  
                            <g:sortableColumn property="phoneNo" title="${message(code: 'contactMechanism.phoneNo.label', default: 'Phone No')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactMechanismInstanceList}" status="i" var="contactMechanismInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactMechanismInstance.id}">${fieldValue(bean: contactMechanismInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactMechanismInstance, field: "address")}</td>
                            
                            <td>${fieldValue(bean: contactMechanismInstance, field: "city")}</td>
                            
                            <td>${fieldValue(bean: contactMechanismInstance, field: "state")}</td>
                            
                            <td>${fieldValue(bean: contactMechanismInstance, field: "zipCode")}</td>
                            
                            <td>${fieldValue(bean: contactMechanismInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: contactMechanismInstance, field: "cellPhone")}</td>
                        
                                                    
                            
                        
                            <td>${fieldValue(bean: contactMechanismInstance, field: "phoneNo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactMechanismInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
