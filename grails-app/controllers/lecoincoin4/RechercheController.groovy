package lecoincoin4

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_MOD'])
class RechercheController {

    def index() {
        def results = null
        def resultsCount = 0
        def q = (String) params.q
        def searchTerm = "%$q%"

        if(!q.isEmpty()){
            results = Annonce.where {title =~ searchTerm}
            resultsCount = results.size()
        }

        render view:"index", model: [results: results, resultsCount: resultsCount]
    }
}
