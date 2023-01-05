package lecoincoin4

class BootStrap {

    def init = { servletContext ->

        // Instance de l'application grails
        // def grailsApplication = Holders.grailsApplication

        // Initialisation des variables d'instance des domaines
        def admin = null;
        def moderateur = null;
        def client = null;

        // Definition des roles
        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleModo = new Role(authority: 'ROLE_MOD').save()
        def roleClient = new Role(authority: 'ROLE_CLIENT').save()

        // Initialisation des variables pour les definitions des illustrations
        def grails_svg = "grails.svg"
        def extern_files_url = "localhost:8080/assets"
        def extern_filepath = extern_files_url +"/"+grails_svg

        // Creation des utilisateurs et roles

        println "Création des utilisateurs de base..."

        admin = new User(username: "admin", password: "admin")
        admin.save(flush: true, failOnError: true)
        UserRole.create(admin, roleAdmin, true)

        println "[+] Création de l'administrateur"

        (1..2).each { Integer index ->
            moderateur = new User(username:"moderateur${index}",password: "password",nom: "moderateur${index}_nom", prenom:"moderateur${index}_prenom")
            moderateur.save(flush: true, failOnError: true)
            UserRole.create(moderateur, roleModo, true)
            println "[+] Création du modérateur${index}"
        }

        (1..10).each { Integer index ->
            client = new User(username:"client${index}",password: "password",nom: "nom${index}", prenoms:"prenoms${index}")
            client.save(flush: true, failOnError: true)
            UserRole.create(client, roleClient, true)
            println "[+] Création du client${index}"

            (1..5).each {
                Integer aIndex ->
                    def annonceInstance = new Annonce(
                            title: "Titre annonce $aIndex de ${client.nom}",
                            description: "Description annonce $aIndex de ${client.nom}",
                            price: 100 * aIndex,
                            isActive: Boolean.TRUE)

                    (1..5).each {
                        Integer iIndex ->
                            annonceInstance.addToIllustrations(new Illustration(filename: grails_svg,extern_filepath: extern_filepath))
                            println "[+] Ajout d'une illustration à l'annonce ${aIndex} du client ${index}"
                    }

                    client.addToAnnonces(annonceInstance)
                    println "[+] Création de l'annonce ${aIndex} du client ${index}"
            }
        }

        println "Création éffectuée!"

    }

    def destroy = {
    }
}
