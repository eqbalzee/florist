

<%@ page import="org.floristonline.InvoiceStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'invoiceStatus.label', default: 'InvoiceStatus')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${invoiceStatusInstance}">
            <div class="errors">
                <g:renderErrors bean="${invoiceStatusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${invoiceStatusInstance?.id}" />
                <g:hiddenField name="version" value="${invoiceStatusInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invoiceItem"><g:message code="invoiceStatus.invoiceItem.label" default="Invoice Item" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceStatusInstance, field: 'invoiceItem', 'errors')}">
                                    <g:select name="invoiceItem.id" from="${org.floristonline.InvoiceItem.list()}" optionKey="id" 
                                    optionValue="${{'Invoice Id: '+ it.invoice.id + 'InvoiceItem Id: ' + it.invoiceItem.id}}"
                                    value="${invoiceStatusInstance?.invoiceItem?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="invoiceItem"><g:message code="invoiceStatus.invoiceStatusType.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceStatusInstance, field: 'invoiceStatusType', 'errors')}">
                                    <g:select name="invoiceStatusType.id" from="${org.floristonline.InvoiceStatusType.list()}" optionKey="id" 
                                    optionValue="${{it.invoiceStatusType}}"
                                    value="${invoiceStatusInstance?.invoiceStatusType?.id}"  />
                                </td>
                            </tr>
                        
                                                    
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="statusDate"><g:message code="invoiceStatus.statusDate.label" default="Status Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: invoiceStatusInstance, field: 'statusDate', 'errors')}">
                                    <g:datePicker name="statusDate" precision="day" value="${invoiceStatusInstance?.statusDate}"  />
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
