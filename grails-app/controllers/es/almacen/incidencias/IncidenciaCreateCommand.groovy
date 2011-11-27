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

    def serviciosService;

    String titulo
    Integer prioridad
    String nota
	Servicio servicio
    Long servicioId = 0

    static constraints = {
        prioridad(nullable:false,range:1..5)
        titulo(nullable:false, blank:false)
        nota(nullable:false, blank:false)
        servicioId(
                nullable:false,
                validator: { val, obj ->
                    if (val == null || val <= 0) return true;  // Salta el de arriba, es para que no salte de nuevo texto del validador
                    obj.servicio = obj.serviciosService.findServicioById(val);
                    return obj.servicio==null?false:true;
                    })
/*
        servicioTecnicoId(
                nullable:false,
                validator: { val, obj ->
                    if (val == null || val <= 0) return true;  // Salta el de arriba, es para que no alte de nuevo texto del validador
                    obj.servicio = obj.serviciosService.findServicioById(val);
                    return obj.servicio==null?false:true;
                    })
*/
    }
}
