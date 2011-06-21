package es.almacen.incidencias.material

import es.almacen.incidencias.MaterialUtilizado

class Material {

    String referencia
	String nombre
	Integer cantidad=0

//	static hasMany = [usadoEn:MaterialUtilizado, tipoMaterial:TipoMaterial]
    static hasMany = [usadoEn:MaterialUtilizado, etiquetas:Etiqueta]


	static constraints = {
		nombre(unique:true, blank:false)
        referencia(unique:true, blank:false)
	}

	String toString(){
		nombre
	}
}
