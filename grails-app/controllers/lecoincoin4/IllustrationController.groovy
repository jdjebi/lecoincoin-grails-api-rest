package lecoincoin4

import grails.util.BuildSettings
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_MOD'])
class IllustrationController {

    IllustrationService illustrationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond illustrationService.list(params), model:[illustrationCount: illustrationService.count()]
    }

    def show(Long id) {
        respond illustrationService.get(id)
    }

    def create() {
        respond new Illustration(params)
    }

    def save(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }
        def illustrationFile = request.getFile('illustration')
        def lastDotIndex = illustrationFile.getOriginalFilename().lastIndexOf(".")
        def fileExtension = illustrationFile.getOriginalFilename().substring(lastDotIndex + 1)
        def fileName = UUID.randomUUID().toString() + '.' + fileExtension
        def destDir = grails.util.BuildSettings.BASE_DIR.toString() + "\\grails-app\\assets\\images\\upload"
        def file = new File(destDir,fileName)
        illustrationFile.transferTo(file)
        illustration.filename = "upload/" + fileName
        illustration.extern_filepath = "http://localhost:8081/assets/upload/" + fileName

        println illustrationService.save(illustration)

        try {
            illustrationService.save(illustration)
        } catch (ValidationException e) {
            flash.errors = illustration.errors
            redirect action:"edit", id:params.annonce.id
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'illustration.label', default: 'Illustration'), illustration.id])
                redirect controller: "annonce", action: "show", id:params.annonce.id
            }
            '*' { respond illustration, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond illustrationService.get(id)
    }

    def update(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }

        try {
            illustrationService.save(illustration)
        } catch (ValidationException e) {
            respond illustration.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'illustration.label', default: 'Illustration'), illustration.id])
                redirect illustration
            }
            '*'{ respond illustration, [status: OK] }
        }
    }

    def delete(Illustration illustration) {
        if (illustration == null) {
            notFound()
            return
        }

        illustration.annonce.illustrations.remove(illustration)
        illustrationService.delete(illustration.getId())

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'illustration.label', default: 'Illustration'), illustration.annonce.getId()])
                redirect controller: "annonce", action:"show", id: illustration.annonce.getId()
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'illustration.label', default: 'Illustration'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
