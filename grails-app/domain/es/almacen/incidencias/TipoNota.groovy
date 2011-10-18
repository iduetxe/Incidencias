package es.almacen.incidencias

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 1/10/11
 * Time: 19:46
 * To change this template use File | Settings | File Templates.
 */
public enum TipoNota {

    INFO,           //Info normal. Cualquier nota
    DESCRIPCION,    //Descripción inicial de la tarea
    NOTA_TRABAJO    //Nota añadida para los trabajadores

    	//PENSAR UN POCO MAS ESTO, QUE ES UN POCO CHAPU
	static list = {
		[INFO,DESCRIPCION,NOTA_TRABAJO]
	}

}