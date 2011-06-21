package es.almacen.incidencias

import es.almacen.incidencias.material.Material

class MaterialUtilizado {

	Integer cantidad
    Date dateCreated

	static belongsTo=[incidencia:Incidencia, material:Material]
	static constraints = {
	}
}
