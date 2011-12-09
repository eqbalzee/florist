
<%@ page import="org.floristonline.Payment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'payment.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="amount" title="${message(code: 'payment.amount.label', default: 'Amount')}" />
                        
                            <g:sortableColumn property="comment" title="${message(code: 'payment.comment.label', default: 'Comment')}" />
                        
                            <g:sortableColumn property="effectiveDate" title="${message(code: 'payment.effectiveDate.label', default: 'Effective Date')}" />
                        
                            <th><g:message code="payment.paymentMethodType.label" default="Payment Method Type" /></th>
                        
                            <g:sortableColumn property="paymentRefNum" title="${message(code: 'payment.paymentRefNum.label', default: 'Payment Ref Num')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paymentInstance.id}">${fieldValue(bean: paymentInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paymentInstance, field: "amount")}</td>
                        
                            <td>${fieldValue(bean: paymentInstance, field: "comment")}</td>
                        
                            <td><g:formatDate date="${paymentInstance.effectiveDate}" /></td>
                        
                            <td>${fieldValue(bean: paymentInstance, field: "paymentMethodType")}</td>
                        
                            <td>${fieldValue(bean: paymentInstance, field: "paymentRefNum")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${paymentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
