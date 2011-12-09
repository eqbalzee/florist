

<%@ page import="org.floristonline.BillingAccountRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'billingAccountRole.label', default: 'BillingAccountRole')}" />
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
            <g:hasErrors bean="${billingAccountRoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${billingAccountRoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${billingAccountRoleInstance?.id}" />
                <g:hiddenField name="version" value="${billingAccountRoleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="accountFor"><g:message code="billingAccountRole.accountFor.label" default="Account For" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountRoleInstance, field: 'accountFor', 'errors')}">
                                    <g:select name="accountFor.id" from="${org.floristonline.Party.list()}" optionKey="id" value="${billingAccountRoleInstance?.accountFor?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="billingAccountRoleType"><g:message code="billingAccountRole.billingAccountRoleType.label" default="Billing Account Role Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountRoleInstance, field: 'billingAccountRoleType', 'errors')}">
                                    <g:select name="billingAccountRoleType.id" from="${org.floristonline.BillingAccountRoleType.list()}" optionKey="id" value="${billingAccountRoleInstance?.billingAccountRoleType?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fromDate"><g:message code="billingAccountRole.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountRoleInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${billingAccountRoleInstance?.fromDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="thruDate"><g:message code="billingAccountRole.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountRoleInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${billingAccountRoleInstance?.thruDate}"  />
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
