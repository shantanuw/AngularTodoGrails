class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/api/todo/$id?"(controller: "todo", parseRequest: true) {
			action = [GET: "show", PUT: "update", DELETE: "delete", POST: "save"]
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
