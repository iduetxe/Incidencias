package es.almacen.incidencias.material

import es.almacen.incidencias.MaterialUtilizado
import org.grails.taggable.Taggable

class Material implements Taggable{

    String referencia
	String nombre
	Integer cantidad=0

    static hasMany = [usadoEn:MaterialUtilizado]


	static constraints = {
		nombre(unique:true, blank:false)
        referencia(unique:true, blank:false)
	}

	String toString(){
		nombre
	}
}
