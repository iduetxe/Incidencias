package es.almacen.incidencias

import es.almacen.servicios.Servicio
import es.almacen.usuarios.Usuario

class Incidencia {

	String titulo
	Usuario tecnico
	Usuario contacto
	String tlfContacto
	EstadoIncidencia estadoIncidencia
	Servicio servicio
    Servicio servicioTecnico
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
    servicioTecnico(
            nullable:true)
	tecnico(
		nullable:true)
	contacto(
        nullable:false)
	tlfContacto(
		nullable:true,
		blank:true)
    }

	static mapping = {
		sort: "prioridad,lastUpdated"
        titulo column:'titulo', index:'titulo_idx'
	}
	
	String toString(){
		titulo
	}
}
