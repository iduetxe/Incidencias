package es.almacen.usuarios

class Usuario extends SecUsuario{


	String name

	static constraints = {
		name(blank:false)
	}
	
	String toString(){
		name
	}
}
