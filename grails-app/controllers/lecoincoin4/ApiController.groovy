package lecoincoin4

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.web.api.ServletAttributes

@Secured('isFullyAuthenticated()')
class ApiController {

    AnnonceService annonceService
    UserService userService
    SpringSecurityService springSecurityService


    def session(){
        if(request.getMethod() == "GET"){
            def auth = springSecurityService.principal.properties
            renderThis(auth,request.getHeader('Accept'))
        }
    }

    // User Singleton
    // Disponible sur l'url /api/user/id
    // Gestion de GET, PUT, PATCH, DELETE
    def user() {
        switch(request.getMethod()){
            case "GET":
                if(!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if(!userInstance)
                   return response.status = 404
                respond userInstance
                break;

            case "PUT":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = 404 // Utilisateur introuvable
                userInstance.properties=request.JSON
                if(!userInstance.save(flush: true))
                    return response.status = 400 // Enregistrement échoué
                response.status = 200 // Mise à jour réussie
                return renderThis(userInstance,request.getHeader('Accept'))
                break;

            case "PATCH":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = 404 // Utilisateur introuvable
                userInstance.properties=request.JSON
                if(!userInstance.save(flush: true))
                    return response.status = 400 // Enregistrement échoué
                response.status = 200 // Mise à jour réussie
                return renderThis(userInstance,request.getHeader('Accept'))
                break;

            case "DELETE":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def userInstance = User.get(params.id)
                if(!userInstance){
                    return response.status = 404 // Utilisateur introuvable
                }
                UserRole.removeAll(User.findById(params.id)) // Suppression des rôles
                userService.delete(params.id)
                return response.status = 200 // Suppression réussie
                break;

            default:
                break;
        }
    }
    // User Collection
    // Disponible sur l'url /api/users
    // Gestion de GET, POST
    def users(){
        switch(request.getMethod()){

            case "GET":
                def userList = User.list()
                return renderThis(userList, request.getHeader('Accept'))
                break;

            case "POST":
                def userMap =  request.JSON
                def userInstance = new User(userMap)
                if(User.findByUsername(userInstance.getUsername()))
                    return response.status = 400
                if(!userInstance.save(flush: true))
                    return response.status = 400
                response.status = 201
                return renderThis(userInstance, request.getHeader('Accept'))
                break;
            default:
                break;
        }
    }

    // Annonce Singleton
    // Disponible sur l'url /api/user/id
    // Gestion de GET, PUT, PATCH, DELETE
    def annonce() {
        switch(request.getMethod()){
            case "GET":
                if(!params.id)
                    return response.status = 400
                def aInstance = Annonce.get(params.id)
                if(!aInstance)
                    return response.status = 404
                renderThis(aInstance,request.getHeader("Accept"))
                break;

            case "PUT":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def aInstance = Annonce.get(params.id)
                if(!aInstance)
                    return response.status = 404 // Annonce introuvable
                aInstance.properties=request.JSON
                if(!aInstance.save(flush: true))
                    return response.status = 400 // Enregistrement échoué
                response.status = 200 // Mise à jour réussie
                return renderThis(aInstance,request.getHeader('Accept'))
                break;

            case "PATCH":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def aInstance = Annonce.get(params.id)
                if(!aInstance)
                    return response.status = 404 // Annonce introuvable
                aInstance.properties=request.JSON
                if(!aInstance.save(flush: true))
                    return response.status = 400 // Enregistrement échoué
                response.status = 200 // Mise à jour réussie
                return renderThis(aInstance,request.getHeader('Accept'))
                break;

            case "DELETE":
                if (!params.id)
                    return response.status = 400 // Requête incorrecte
                def aInstance = Annonce.get(params.id)
                if(!aInstance){
                    return response.status = 404 // Annonce introuvable
                }
                annonceService.delete(params.id)
                return response.status = 200 // Suppression réussie
                break;

            default:
                break;
        }
    }
    // Annonce Collection
    // Disponible sur l'url /api/users
    // Gestion de GET, POST
    def annonces(){
        switch(request.getMethod()){
            case "GET":
                def aList = Annonce.list()
                respond annonces: aList
                break;

            case "POST":
                def aMap = request.JSON
                def aInstance = new Annonce(aMap)
                if(!aInstance.save(flush: true)){
                    println aInstance.errors
                    return response.status = 400 // Enregistrement échoué
                }
                response.status = 201 // Annonce crée
                return renderThis(aInstance, request.getHeader('Accept'))
                break;
            default:
                break;
        }
    }

    def renderThis(Object object, String accept) {
        switch (accept) {
            case "application/xml":
            case "text/xml":
            case "xml":
                render object as XML
                break
            case "application/json":
            case "text/json":
            case "json":
            default:
                render object as JSON
                break
        }
    }

}
