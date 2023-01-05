package lecoincoin4

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		cache true
	}

	String getRoleName(){
		def name = null;
		switch (authority){
			case "ROLE_ADMIN":
				name = "Administrateur"
			break;
			case "ROLE_MOD":
				name = "Modérateur"
			break;
			case "ROLE_CLIENT":
				name = "Client"
			break;
			default:
				name = "Utilisateur"
		}
		name
	}
}
