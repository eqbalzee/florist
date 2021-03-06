

<%@ page import="org.floristonline.ReportEstimatedProductCosts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reportEstimatedProductCostsInstance}">
            <div class="errors">
                <g:renderErrors bean="${reportEstimatedProductCostsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="reportEstimatedProductCosts.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportEstimatedProductCostsInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${org.floristonline.Product.list()}" optionKey="id" 
                                    optionValue="${{it.name}}"
                                    value="${reportEstimatedProductCostsInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value='Generate Report' /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
