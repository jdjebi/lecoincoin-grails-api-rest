package lecoincoin4

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_MOD'])
class IndexController {

    def index() {
        redirect controller:"user", action:"index"
    }
}
