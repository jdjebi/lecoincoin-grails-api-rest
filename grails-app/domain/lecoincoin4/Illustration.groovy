package lecoincoin4

class Illustration {

    String filename

    static constraints = {
        filename nullable: false, blank: false
    }

    static belongsTo = [annonce: Annonce]
}
