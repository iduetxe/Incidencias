package es.almacen.incidencias

import es.almacen.usuarios.Usuario

class Nota implements Comparable{

	String texto
	Incidencia incidencia
	Usuario owner	
	Date dateCreated = new Date()

	static belongsTo = [incidencia:Incidencia, owner: Usuario]

	static constraints = {
		owner(nullable:false)
		incidencia(nullable:false)
		texto(nullable:false, blank:false)
		dateCreated(nullable:false)
	}

	String toString(){
		texto
	}

    public int compareTo(def other) {
        return dateCreated <=> other?.dateCreated // <=> is the compareTo operator in groovy
    }

}
