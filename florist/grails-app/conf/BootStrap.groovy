import org.floristonline.login.Role
import org.floristonline.login.User
import org.floristonline.login.UserRole

import com.dumbster.smtp.SimpleSmtpServer

class BootStrap {
	
	SimpleSmtpServer server

    def init = { servletContext ->
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
  
		def testUser = new User(username: 'me', email: 'me@me.com', enabled: true, password: 'password')
		testUser.save(flush: true)
  
		UserRole.create testUser, adminRole, true
  
		// dumbster fake mail server
		server = SimpleSmtpServer.start();
    }
    def destroy = {
		server.stop();
    }
}
