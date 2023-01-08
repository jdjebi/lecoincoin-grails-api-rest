package lecoincoin4

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	String username
	String password
	String nom
	String prenoms

	Date dateCreated
	Date lastUpdated

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static hasMany = [annonces: Annonce]

	Set<Role> getAuthorities() {
		(UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
	}

	String getFullId(){
		"${username} - ${nom} ${prenoms}"
	}

	static constraints = {
		password blank: false, password: true
		username blank: false, unique: true
		nom blank: false, nullable: true
		prenoms blank: false, nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
