package es.almacen.servicios

import es.almacen.usuarios.Usuario

class Servicio {

    String codigo
	String nombre
	Usuario responsable
    TipoServicio tipoServicio
    String pabellon
    Integer planta


    static hasMany = [usuarios:Usuario]

	static constraints = {
		nombre (nullable:false, blank:false)
        codigo (nullable:false, blank:false, unique:true)
		responsable (nullable:false)
        tipoServicio(nullable:false, inList:TipoServicio.list())
        pabellon(nullable:false)
	}



        String toString(){
            if (planta!=null)
               nombre +", "+pabellon+"("+planta+")"
            else
               nombre +", "+pabellon
        }
}
