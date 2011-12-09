
<%@ page import="org.floristonline.Party" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'party.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="birthDate" title="${message(code: 'party.birthDate.label', default: 'Birth Date')}" />
                        
                            <g:sortableColumn property="comment" title="${message(code: 'party.comment.label', default: 'Comment')}" />
                        
                            <g:sortableColumn property="currentPersonalTitle" title="${message(code: 'party.currentPersonalTitle.label', default: 'Current Personal Title')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'party.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="gender" title="${message(code: 'party.gender.label', default: 'Gender')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${partyInstanceList}" status="i" var="partyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${partyInstance.id}">${fieldValue(bean: partyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "birthDate")}</td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "comment")}</td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "currentPersonalTitle")}</td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: partyInstance, field: "gender")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${partyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
