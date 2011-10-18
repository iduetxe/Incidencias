package es.almacen.incidencias

import es.almacen.servicios.Servicio
import org.codehaus.groovy.grails.validation.Validateable

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 11/04/11
 * Time: 19:30
 */
@Validateable
class IncidenciaCreateCommand {
    String titulo
    Integer prioridad
    String nota
	Integer tlfContacto
	Servicio servicio

    static constraints = {
        prioridad(nullable:false,range:1..5)
        titulo(nullable:false, blank:false)
        nota(nullable:false, blank:false)
        tlfContacto(nullable:false)
        servicio(nullable:false)
    }
}
