package lecoincoin4

import com.fasterxml.jackson.annotation.JsonInclude

class Annonce {

    String title
    String description
    Integer price
    Boolean isActive = Boolean.FALSE
    Date dateCreated
    Date lastUpdated
    List illustrations

    static constraints = {
        title blank: false, maxSize: 50, nullable: false
        description blank: false, nullable: false
        price min: 0, nullable: false
        isActive nullable: false
    }

    static mapping = {
        description type: 'text'
    }

    static hasMany = [illustrations: Illustration]

    static belongsTo = [author: User]
}
