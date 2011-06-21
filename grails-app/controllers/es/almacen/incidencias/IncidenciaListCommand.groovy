package es.almacen.incidencias

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 11/04/11
 * Time: 19:30
 * To change this template use File | Settings | File Templates.
 */
class IncidenciaListCommand {
    Integer max = 10
    Integer offset = 0
    String titulo
    Integer prioridad
    Long id
    String sort
    String order

    static constraints = {
        id(min:0L)
        max(max:100)
        offset(min:0)
        prioridad(nullable:true,range:1..5)
        titulo(nullable:true)
        sort(nullable:true,inList:['titulo','prioridad','id','estado','servicio','titulo'])
        order(nullable:true, inList:['asc','desc'])
    }
}
