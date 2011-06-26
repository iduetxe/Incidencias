package es.almacen.material

import org.springframework.transaction.annotation.Transactional
import es.almacen.incidencias.material.Material
import es.almacen.incidencias.material.MaterialListCommand
import es.almacen.SearchUtil

class MaterialService {

	static transactional = true


    private String createQuerySearchByTag(List<String> tags){
        if (tags == null || tags.size() == 0)
            return null;

        StringBuffer sf = new StringBuffer("id in ")
        sf.append(" (select tl.tag_ref ")
        sf.append(" from tag tg, tag_link tl where tg.id = tl.tag_id and tl.type = 'material' and tg.name in ( " )
        for (String s : tags)
            sf.append("'"+s+"',")
        sf.deleteCharAt(sf.size()-1)
        sf.append(" ) ")
        sf.append("group by tl.tag_ref having count(*)>="+tags.size())
        sf.append(" ) ")
        return sf.toString()
    }


	@Transactional(readOnly = true)
	def listMaterial(MaterialListCommand cmd) {
        String referencia = SearchUtil.searchableString(cmd.referencia)
        String nombre = SearchUtil.searchableString(cmd.nombre);

        def result = Material.createCriteria().list(max:cmd.max, offset:cmd.offset) {
            if (referencia != null )    {like("referencia", referencia)}
            if (nombre != null )    {like("nombre", nombre)}
            if (cmd.cantidad != null)  {eq ("cantidad", cmd.cantidad)}
            if (cmd.id != null)         {eq ("id",cmd.id)}
            if (cmd.tags != null && cmd.tags.size() > 0)       {sqlRestriction(createQuerySearchByTag(cmd.tags))}
            if (cmd.sort!=null&&cmd.sort!="") order(cmd.sort,cmd.order)

            maxResults(cmd.max)
            firstResult(cmd.offset)
        }
    }


    @Transactional(readOnly = true)
	def listMaterialTags(String word) {
        String search = SearchUtil.searchableString(word)

        def tagsList = Material.findAllTagsWithCriteria([max:5]) {
            ilike('name', search)
        }
    }
}
