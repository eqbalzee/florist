
<%@ page import="org.floristonline.InvoiceItemDataReport" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'invoiceItemDataReport.id.label', default: 'Id')}" />
                        
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Invoice Id" /></th>
                            
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Invoice Item Seq Id" /></th>
                            
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Product" /></th>
                            
                            
                            
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Quantity" /></th>
                            
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Unit Price" /></th>
                            
                            <th><g:message code="invoiceItemDataReport.invoice.label" default="Taxable Flag?" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${invoiceItemDataReportInstanceList}" status="i" var="invoiceItemDataReportInstance">
                    <g:each in="${invoiceItemDataReportInstance.invoiceItem}" status="j" var="invoiceItemInstance">
                    
                    
                    
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${invoiceItemDataReportInstance.id}">${fieldValue(bean: invoiceItemDataReportInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "invoice.id")}</td>
                            
                            <td>${fieldValue(bean: invoiceItemInstance, field: "id")}</td>
                            
                            <td>${fieldValue(bean: invoiceItemInstance, field: "shipmentItem.orderItem.product.name")}</td>
                            
                                                       
                            <td>${fieldValue(bean: invoiceItemInstance, field: "quantity")}</td>
                            
                            
                            <td><g:formatNumber number="${invoiceItemInstance.shipmentItem.orderItem.product.priceComponent()}" format="###,##"  type="currency" currencyCode="USD"  /></td>
                                                        
                            <td>${fieldValue(bean: invoiceItemInstance, field: "taxableFlag")}</td>
                        
                        </tr>
                        </g:each>
                    	</g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${invoiceItemDataReportInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
