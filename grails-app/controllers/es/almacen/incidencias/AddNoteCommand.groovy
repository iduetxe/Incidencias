package es.almacen.incidencias

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 4/04/11
 * Time: 19:34
 * To change this template use File | Settings | File Templates.
 */

class AddNoteCommand{

	String nota
	Integer incidenciaId

	static constraints = {
		incidenciaId(nullable:false)
		nota(nullable:false, blank:false)
	}
}