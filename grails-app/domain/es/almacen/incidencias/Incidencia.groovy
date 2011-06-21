package es.almacen.incidencias

import es.almacen.servicios.Servicio
import es.almacen.usuarios.Usuario

class Incidencia {

	String titulo
	Usuario tecnico
	String nombreContacto
	String tlfContacto
	EstadoIncidencia estadoIncidencia
	Servicio servicio
	Date dateCreated
	Date lastUpdated	
	int prioridad
    SortedSet notas

	static hasMany = [notas:Nota, materialUtilizado:MaterialUtilizado]


    static constraints = {
	estadoIncidencia(
		inList : EstadoIncidencia.list(),
		blank:false,
		nullable:false)
	servicio(
		nullable:false)
	prioridad(
		nullable:false,
		range: 1..5)
	titulo(
		blank:false)
	tecnico(
		nullable:true)
	nombreContacto(
		blank:false)
	tlfContacto(
		nullable:true,
		blank:true)
    }

	static mapping = {
		sort: "lastUpdated"
        titulo column:'titulo', index:'titulo_idx'
	}
	
	String toString(){
		titulo
	}
}
