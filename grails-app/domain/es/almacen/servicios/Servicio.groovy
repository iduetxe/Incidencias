package es.almacen.servicios

import es.almacen.usuarios.Usuario

class Servicio {


	String nombre
	Usuario responsable

	static constraints = {
		nombre (nullable:false, blank:false)
		responsable (nullable:false)
	}



        String toString(){
               nombre
        }
}
