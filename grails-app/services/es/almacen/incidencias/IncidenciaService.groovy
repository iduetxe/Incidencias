package es.almacen.incidencias

import org.springframework.transaction.annotation.*
import es.almacen.SearchUtil

class IncidenciaService {

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
}
