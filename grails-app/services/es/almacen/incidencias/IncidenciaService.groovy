package es.almacen.incidencias

import org.springframework.transaction.annotation.*
import es.almacen.SearchUtil
import org.springframework.security.access.annotation.Secured
import es.almacen.usuarios.Usuario
import es.almacen.usuarios.SecUsuario
import java.security.Principal

class IncidenciaService {


    def springSecurityService

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
        i.titulo = cmd.titulo;
        i.tecnico = null;
	    i.contacto = user.servicio?.responsable
	    i.tlfContacto= 9999
	    i.estadoIncidencia=EstadoIncidencia.ABIERTA
	    i.servicio = user.getServicio()
        i.servicioTecnico=null
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
