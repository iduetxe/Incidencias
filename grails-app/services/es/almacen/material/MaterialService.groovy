package es.almacen.material

import org.springframework.transaction.annotation.Transactional
import es.almacen.incidencias.material.Material
import es.almacen.incidencias.material.MaterialListCommand
import es.almacen.SearchUtil
import es.almacen.incidencias.material.Etiqueta

class MaterialService {

	static transactional = true



	@Transactional(readOnly = true)
	def listMaterial(MaterialListCommand cmd) {
        String referencia = SearchUtil.searchableString(cmd.referencia)
        String nombre = SearchUtil.searchableString(cmd.nombre);
        List<Etiqueta> etiquetaList = null;
        if (cmd.etiquetas != null)
            etiquetaList = Etiqueta.findAllByNombreInList(["Ropa","Herramienta"]);
        def result = Material.createCriteria().list(max:cmd.max, offset:cmd.offset) {
            if (referencia != null )    {like("referencia", referencia)}
            if (nombre != null )    {like("nombre", nombre)}
            if (cmd.cantidad != null)  {eq ("cantidad", cmd.cantidad)}
            if (cmd.id != null)         {eq ("id",cmd.id)}
            //if (etiquetaList != null)   {etiquetas inList(etiquetaList.get(0))}
            if (cmd.sort!=null&&cmd.sort!="") order(cmd.sort,cmd.order)

            maxResults(cmd.max)
            firstResult(cmd.offset)
        }
    }
}
