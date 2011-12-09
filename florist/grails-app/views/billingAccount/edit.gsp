

<%@ page import="org.floristonline.BillingAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'billingAccount.label', default: 'BillingAccount')}" />
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
            <g:hasErrors bean="${billingAccountInstance}">
            <div class="errors">
                <g:renderErrors bean="${billingAccountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${billingAccountInstance?.id}" />
                <g:hiddenField name="version" value="${billingAccountInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="billedAt"><g:message code="billingAccount.billedAt.label" default="Billed At" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'billedAt', 'errors')}">
                                    <g:select name="billedAt.id" from="${org.floristonline.ContactMechanism.list()}" optionKey="id" value="${billingAccountInstance?.billedAt?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="billingAccountRole"><g:message code="billingAccount.billingAccountRole.label" default="Billing Account Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'billingAccountRole', 'errors')}">
                                    <g:select name="billingAccountRole.id" from="${org.floristonline.BillingAccountRole.list()}" optionKey="id" value="${billingAccountInstance?.billingAccountRole?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="billingAccount.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${billingAccountInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fromDate"><g:message code="billingAccount.fromDate.label" default="From Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'fromDate', 'errors')}">
                                    <g:datePicker name="fromDate" precision="day" value="${billingAccountInstance?.fromDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paymentApplication"><g:message code="billingAccount.paymentApplication.label" default="Payment Application" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'paymentApplication', 'errors')}">
                                    <g:select name="paymentApplication" from="${org.floristonline.PaymentApplication.list()}" multiple="yes" optionKey="id" size="5" value="${billingAccountInstance?.paymentApplication*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="thruDate"><g:message code="billingAccount.thruDate.label" default="Thru Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: billingAccountInstance, field: 'thruDate', 'errors')}">
                                    <g:datePicker name="thruDate" precision="day" value="${billingAccountInstance?.thruDate}"  />
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
