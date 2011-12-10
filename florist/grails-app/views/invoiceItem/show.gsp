
<%@ page import="org.floristonline.InvoiceItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceItem.label', default: 'InvoiceItem')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
            
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        	
        </div>
    <div class="nav" align="center">
            
            <span class="menuButton"><g:link controller="party">Party</g:link></span>
            <span class="menuButton"><g:link controller="contactMechanism">Contact Mechanism</g:link></span>
            <span class="menuButton"><g:link controller="product">Product</g:link></span>
            <span class="menuButton"><g:link controller="productFeature">Product Feature</g:link></span>
            <span class="menuButton"><g:link controller="productOrder">Product Order</g:link></span>
            <span class="menuButton"><g:link controller="estimatedProductCost">Estimated  Cost</g:link></span>
            <span class="menuButton"><g:link controller="priceComponent">Price Component</g:link></span>
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
                            <td valign="top" class="name"><g:message code="invoiceItem.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: invoiceItemInstance, field: "id")}</td>
                            
                        </tr>
                    	
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.invoice.label" default="Invoice Id" /></td>
                            
                            <td valign="top" class="value"><g:link controller="invoice" action="show" id="${invoiceItemInstance?.invoice?.id}">${invoiceItemInstance?.invoice?.id}</g:link></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.shipmentItem.label" default="Shipment Item" /></td>
                            
                            <td valign="top" class="value"><g:link controller="shipmentItem" action="show" id="${invoiceItemInstance?.shipmentItem?.id}">${invoiceItemInstance?.shipmentItem?.orderItem?.product?.name}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: invoiceItemInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.invoiceItemType.label" default="Invoice Item Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="invoiceItemType" action="show" id="${invoiceItemInstance?.invoiceItemType?.id}">${invoiceItemInstance?.invoiceItemType?.description}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.quantity.label" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: invoiceItemInstance, field: "quantity")}</td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="invoiceItem.taxableFlag.label" default="Taxable Flag" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: invoiceItemInstance, field: "taxableFlag")}</td>
                            
                        </tr>
                    
                        
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${invoiceItemInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
