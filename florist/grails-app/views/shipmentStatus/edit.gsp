

<%@ page import="org.floristonline.ShipmentStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'shipmentStatus.label', default: 'ShipmentStatus')}" />
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
            <g:hasErrors bean="${shipmentStatusInstance}">
            <div class="errors">
                <g:renderErrors bean="${shipmentStatusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${shipmentStatusInstance?.id}" />
                <g:hiddenField name="version" value="${shipmentStatusInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        	<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipmentStatusType"><g:message code="shipmentStatusInstance.shipmentStatusType.label" default="Shipment Status Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentStatusInstance, field: 'shipmentStatusType', 'errors')}">
                                    <g:select name="shipmentStatusType.id" 
                                    from="${org.floristonline.ShipmentStatusType.list()}" 
                                    optionKey="id" 
                                    optionValue="${{it.shipmentStatusType}}"
                                    value="${shipmentStatusInstance?.shipmentStatusType?.id}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="statusDate"><g:message code="shipmentStatus.statusDate.label" default="Status Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentStatusInstance, field: 'statusDate', 'errors')}">
                                    <g:datePicker name="statusDate" precision="day" value="${shipmentStatusInstance?.statusDate}"  />
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
