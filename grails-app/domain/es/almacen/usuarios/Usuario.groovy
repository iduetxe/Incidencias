package es.almacen.usuarios

import es.almacen.servicios.Servicio

class Usuario extends SecUsuario{


	String name

    static belongsTo = [servicio: Servicio]


	static constraints = {
		name(blank:false)
	}
	
	String toString(){
		name
	}
}
