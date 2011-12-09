
<%@ page import="org.floristonline.Login" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'login.label', default: 'Login')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'login.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'login.password.label', default: 'Password')}" />
                        
                            <g:sortableColumn property="userId" title="${message(code: 'login.userId.label', default: 'User Id')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${loginInstanceList}" status="i" var="loginInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${loginInstance.id}">${fieldValue(bean: loginInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: loginInstance, field: "password")}</td>
                        
                            <td>${fieldValue(bean: loginInstance, field: "userId")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <table>
                <span class="menuButton"><a href="/florist/customer/create" class="create">Create New User</a></span>
                </table>
                
            </div>
            <div class="paginateButtons">
                <g:paginate total="${loginInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
