package es.almacen.incidencias.material

class Etiqueta {

    String nombre;

    //static hasMany = [tipoMaterial:TipoMaterial]
    static belongsTo = Material
    static hasMany = [materiales:Material]

	static constraints = {
        nombre(unique:true)
	}
}
