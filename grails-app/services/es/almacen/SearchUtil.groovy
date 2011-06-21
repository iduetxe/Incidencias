package es.almacen

/**
 * Created by IntelliJ IDEA.
 * User: iduetxe
 * Date: 2/05/11
 * Time: 12:11
 * To change this template use File | Settings | File Templates.
 */
class SearchUtil {
    public final static String searchableString(String data){
        if (data=="" || data==null) {
            return null
        }else{
            return  "%"+data.replaceAll('([*])','%') +"%"
        }
    }
}
