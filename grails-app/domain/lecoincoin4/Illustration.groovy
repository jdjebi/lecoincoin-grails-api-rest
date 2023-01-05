package lecoincoin4

class Illustration {

    String filename
    String extern_filepath
    Date dateCreated
    Date lastUpdated

    static constraints = {
        filename nullable: false, blank: false
    }

    static belongsTo = [annonce: Annonce]
}
