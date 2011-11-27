package es.almacen.incidencias

import org.springframework.transaction.annotation.*
import es.almacen.SearchUtil
import org.springframework.security.access.annotation.Secured
import es.almacen.usuarios.Usuario
import es.almacen.usuarios.SecUsuario
import java.security.Principal
import es.almacen.servicios.Servicio
import es.almacen.servicios.TipoServicio

class IncidenciaService {


    def springSecurityService
    def serviciosService

	static transactional = true



	@Transactional(readOnly = true) 
	def listIncidencias(IncidenciaListCommand cmd) {
        String titulo = SearchUtil.searchableString(cmd.titulo);
        def result = Incidencia.createCriteria().list(max:cmd.max, offset:cmd.offset) {
            if (titulo != null ) {like("titulo", titulo)}
            if (cmd.prioridad != null) {eq ("prioridad", cmd.prioridad)}
            if (cmd.id != null){eq ("id",cmd.id)}

            if (cmd.sort!=null&&cmd.sort!="") order(cmd.sort,cmd.order)

            maxResults(cmd.max)
            firstResult(cmd.offset)
        }
	}

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    @Transactional
	def newIncidencia(IncidenciaCreateCommand cmd) {

        Usuario user = Usuario.load(springSecurityService.getPrincipal()._id);
        Incidencia i = new Incidencia()
        Servicio s =  user.servicio;
        Servicio stecnico =  serviciosService.findServiciosByType(TipoServicio.GESTOR).first()
        i.titulo = cmd.titulo;
        i.tecnico = null;
	    i.contacto = s.responsable
	    i.estadoIncidencia=EstadoIncidencia.ABIERTA
	    i.servicio = cmd.servicio
        i.servicioTecnico = stecnico
    	i.prioridad = cmd.prioridad

        Nota nota = new Nota();
	    nota.texto = cmd.nota;
	    nota.incidencia = i
	    nota.owner = user

        i.save()
        nota.save()
        return i;
	}
}
