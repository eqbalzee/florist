<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="/florist"><img src="${resource(dir:'images',file:'projectPhoto1.jpg')}" alt="Flower" border="0"/></a></div>
        <div style="float:right">
				<sec:ifLoggedIn>
				Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<g:link controller="login" action="auth">Login</g:link>
				</sec:ifNotLoggedIn>
		</div>
        <g:layoutBody />
    </body>
</html>