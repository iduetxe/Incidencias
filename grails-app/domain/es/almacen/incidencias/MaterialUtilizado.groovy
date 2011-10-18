package es.almacen.incidencias

import es.almacen.incidencias.material.Material
import es.almacen.usuarios.Usuario

class MaterialUtilizado {

	Integer cantidad
    Date dateCreated

	static belongsTo=[incidencia:Incidencia, material:Material, usuario:Usuario]
	static constraints = {
	}
}
