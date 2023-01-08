package lecoincoin4

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
