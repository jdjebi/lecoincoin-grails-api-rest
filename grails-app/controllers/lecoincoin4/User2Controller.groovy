package lecoincoin4

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.NO_CONTENT
import static org.springframework.http.HttpStatus.OK

@Secured(['ROLE_ADMIN','ROLE_MOD'])
class User2Controller {

    UserService userService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model:[userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        def lesRoles = Role.list()
        respond new User(params), model: [roleList: lesRoles]
    }

    def save(User user) {

        if (user == null) {
            notFound()
            return
        }

        try{
           if(user.validate()){
               if(!params.confirm_password){
                   user.errors.rejectValue("password","user.password.empty","Veuillez confirmer le mot de passe")
                   throw new ValidationException("Mot de passe non confirmé",user.errors)
               }else{
                   if(params.confirm_password!=user.password){
                       user.errors.rejectValue("password","user.password.notEquals","Les mots de passe ne correspondent pas")
                       throw new ValidationException("Mots de passe différents",user.errors)
                   }else{
                       userService.save(user)
                       def role = Role.get(params.role)
                       UserRole.create(user, role, true)
                   }
               }
           }else{
               throw new ValidationException("Validation échouée",user.errors)
           }

        } catch (ValidationException e){
            flash.errors = user.errors
            redirect action:"create"
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect controller: "user2", action: "show", id:user.getId()
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {

        println user
        println params

        render "OK"
        return;


        if (user == null) {
            notFound()
            return
        }

        println user.id
        println params

        render "OK"
        return;

        /*
        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
        */
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        println "Ici"

        // userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
