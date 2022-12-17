package lecoincoin4

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured
import grails.web.api.ServletAttributes

@Secured('isFullyAuthenticated()')
class ApiController {

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
                renderThis(userInstance, request.getHeader('Accept'))
                break;

            case "PUT":

                def userData = request.JSON
                println userData

                if(!params.id)
                    return response.status = 400

                def userInstance = User.get(params.id)

                userInstance.save()
                println userInstance

                /*
              if(!userInstance)
                  return response.status = 404
              renderThis(userInstance, request.getHeader('Accept'))
              break;

               */
                render "test"
                return;

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
                renderThis(userList, request.getHeader('Accept'))
                break;

            case "POST":
                def userMap =  request.JSON
                def userInstance = new User(userMap)

                if(User.findByUsername(userInstance.getUsername()))
                    return response.status = 400

                if(userInstance.save(flush: true))
                    return response.status = 201

                return response.status = 400
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
