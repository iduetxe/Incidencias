package es.almacen.incidencias.material

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 2/05/11
 * Time: 12:07
 * To change this template use File | Settings | File Templates.
 */
class MaterialListCommand {

    Integer max = 10
    Integer offset = 0
    String sort
    String order
    String nombre
    String referencia
    Integer cantidad
    Long id
    List<String> tags

    static constraints = {
        id(min:0L)
        max(max:100)
        offset(min:0)
        sort(nullable:true,inList:['nombre','referencia','id','cantidad'])
        order(nullable:true, inList:['asc','desc'])
        nombre(nullable:true)
        referencia(referencia:true)
        cantidad(nullable:true)
        tags(nullable:true)
    }
}
