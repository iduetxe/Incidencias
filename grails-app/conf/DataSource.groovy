dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
}


hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop','update'
            url = "jdbc:hsqldb:mem:devDB"
    	    driverClassName = "org.hsqldb.jdbcDriver"
	    username = "sa"
	    password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
    	    url = "jdbc:mysql://localhost/almacen"
            username = "root"
            password = "jamon"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
    	    url = "jdbc:mysql://localhost/almacen"
            username = "root"
            password = "jamon"
        }
    }
}
