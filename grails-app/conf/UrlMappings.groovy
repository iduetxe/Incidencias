class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"incidencia", action:"list")
	//	"/"(view:"/index")

		"500"(view:'/error')
        "404"(view:'/404')

		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")

        "/indicencia/$id"(controller: "incidencia", action:"show")
	}
}
