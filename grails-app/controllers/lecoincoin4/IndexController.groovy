package lecoincoin4

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService



@Secured(['ROLE_ADMIN','ROLE_MOD','ROLE_CLIENT'])
class IndexController {

    SpringSecurityService springSecurityService

    def index() {

        def role = springSecurityService.authentication.authorities[0]

        if(role.authority == "ROLE_CLIENT"){
            redirect controller:"annonce", action:"index"
        }else{
            redirect controller:"user", action:"index"
        }

    }
}
