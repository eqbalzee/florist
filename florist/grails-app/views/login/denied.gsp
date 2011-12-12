<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.denied.title" /></title>
</head>

<body>
<div class='body'>
	<div class='errors'><g:message code="springSecurity.denied.message" /></div>
	<div id='loginLinkContainer'>
				<sec:ifLoggedIn>
				Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<g:link controller="login" action="auth">Login</g:link>
				</sec:ifNotLoggedIn>
	</div>
</div>

</body>
