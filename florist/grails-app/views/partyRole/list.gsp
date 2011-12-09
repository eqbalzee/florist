
<%@ page import="org.floristonline.PartyRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'partyRole.label', default: 'PartyRole')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'partyRole.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fromDate" title="${message(code: 'partyRole.fromDate.label', default: 'From Date')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'partyRole.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="thruDate" title="${message(code: 'partyRole.thruDate.label', default: 'Thru Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${partyRoleInstanceList}" status="i" var="partyRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${partyRoleInstance.id}">${fieldValue(bean: partyRoleInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${partyRoleInstance.fromDate}" /></td>
                        
                            <td>${fieldValue(bean: partyRoleInstance, field: "name")}</td>
                        
                            <td><g:formatDate format="MM-dd-yyyy" date="${partyRoleInstance.thruDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${partyRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
