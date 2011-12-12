
class SecurityFilters {
	def springSecurityService
	def filters = {
		loginCheck(controller:'*', action:'*') {
			
		
			before = {
				true
				if(!springSecurityService.isLoggedIn() && actionName != "auth") {
					redirect(controller:"login",action:"auth")
					return false
				}
			}
	   }
//	   roleCheck?
	}
}
