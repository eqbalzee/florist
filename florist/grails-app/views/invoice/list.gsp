
<%@ page import="org.floristonline.Invoice" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoice.id.label', default: 'Id')}" />
                            
                                                        
                            <g:sortableColumn property="invoiceDate" title="${message(code: 'invoice.invoiceDate.label', default: 'Invoice Date')}" />
                                                                                    
                            <th><g:message code="invoice.billedFrom.label" default="Billed From" /></th>
                            
                            <th><g:message code="invoice.sent From.label" default="Billed From Address" /></th>
                        	
                        	<th><g:message code="invoice.billedTo.label" default="Billed To" /></th>
                        	
                            <th><g:message code="invoice.addressedTo.label" default="Billed To Address" /></th>
                        
                        	<g:sortableColumn property="message" title="${message(code: 'invoice.message.label', default: 'Message')}" />
                            
                            <g:sortableColumn property="description" title="${message(code: 'invoice.description.label', default: 'Description')}" />
                        
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceInstanceList}" status="i" var="invoiceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceInstance.id}">${fieldValue(bean: invoiceInstance, field: "id")}</g:link></td>
                        
                                                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${invoiceInstance.invoiceDate}" /></td>
                            
                                                                                                             
                            <td>${fieldValue(bean: invoiceInstance, field: "billedFrom.firstName")} ${fieldValue(bean: invoiceInstance, field: "billedFrom.lastName")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "sentFrom")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "billedTo.firstName")} ${fieldValue(bean: invoiceInstance, field: "billedTo.lastName")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "addressedTo")}</td>
                            
                            <td>${fieldValue(bean: invoiceInstance, field: "message")}</td>
                        
                            <td>${fieldValue(bean: invoiceInstance, field: "description")}</td>
                        
                            
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
