dataSource {
    /*pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""*/
	
	pooled = true
	dbCreate = "update"
	url = "jdbc:mysql://localhost/floristdb"
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	username = "florist"
	password = "florist"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        //dataSource {
        //    dbCreate = "create-drop" // one of 'create', 'create-drop','update'
         //   url = "jdbc:hsqldb:mem:devDB"
       // }
    }
    test {
       // dataSource {
        //    dbCreate = "update"
        //    url = "jdbc:hsqldb:mem:testDb"
       // }
    }
    production {
       // dataSource {
       //     dbCreate = "update"
        //    url = "jdbc:hsqldb:file:prodDb;shutdown=true"
       // }
    }
}
