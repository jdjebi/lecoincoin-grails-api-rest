package lecoincoin4

class BootStrap {

    def init = { servletContext ->

        // Initialisation des variables d'instance des domaines
        def admin = null;
        def moderateur = null;
        def client = null;

        // Definition des roles
        def roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        def roleModo = new Role(authority: 'ROLE_MOD').save()
        def roleClient = new Role(authority: 'ROLE_CLIENT').save()

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
        }

        println "Création éffectuée!"

    }

    def destroy = {
    }
}
