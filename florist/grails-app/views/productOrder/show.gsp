
<%@ page import="org.floristonline.ProductOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
                            <td valign="top" class="name"><g:message code="productOrder.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.entryDate.label" default="Entry Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productOrderInstance?.entryDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.orderDate.label" default="Order Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM-dd-yyyy" date="${productOrderInstance?.orderDate}" /></td>
                            
                        </tr>
                    
                                            
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.orderType.label" default="Order Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="orderType" action="show" id="${productOrderInstance?.orderType?.id}">${productOrderInstance?.orderType?.description}</g:link></td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.orderEnteredBy.label" default="Order Entered By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="party" action="show" id="${productOrderInstance?.orderEnteredBy?.id}">${productOrderInstance?.orderEnteredBy?.firstName} ${productOrderInstance?.orderEnteredBy?.lastName}</g:link></td>
                            
                        </tr>
                    
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.orderPlacedBy.label" default="Order Placed By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="party" action="show" id="${productOrderInstance?.orderPlacedBy?.id}">${productOrderInstance?.orderPlacedBy?.firstName} ${productOrderInstance?.orderPlacedBy?.lastName}</g:link></td>
                            
                        </tr>
                    
                        
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productOrderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
