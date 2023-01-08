package lecoincoin4

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_MOD','ROLE_CLIENT'])
class AnnonceController {

    AnnonceService annonceService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def annonces = null
        params.max = Math.min(max ?: 10, 100)

        if(springSecurityService.authentication.authorities[0].authority == "ROLE_CLIENT"){
            def user = User.findByUsername(springSecurityService.principal.username)
            annonces = user.annonces
        }else{
            annonces = annonceService.list(params)
        }

        render view:"index" , model:[annonceList: annonces, annonceCount: annonceService.count()]
    }


    def show(Long id) {
        respond Annonce.findById(id)
    }

    @Secured(['ROLE_ADMIN','ROLE_MOD'])
    def create() {
        def authors = User.list()
        respond new Annonce(params), model: [authors: authors]
    }

    @Secured(['ROLE_ADMIN'])
    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            flash.errors = annonce.errors
            redirect action:"create"
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        def authors = User.list()
        respond annonceService.get(id), model: [authors: authors]
    }

    def update(Annonce annonce) {

        if (annonce == null) {
            notFound()
            return
        }

        println "--------------"
        println annonce.illustrations

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            flash.errors = annonce.errors
            redirect action:"edit", id:annonce.getId()
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }

    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
