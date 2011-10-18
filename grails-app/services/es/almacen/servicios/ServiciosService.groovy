package es.almacen.servicios

import org.springframework.transaction.annotation.Transactional

class ServiciosService {

	static transactional = true


    @Transactional(readOnly = true)
    def listServicesByName(String serviceText) {
        //TODO Busqueda única de servicio
        return Servicio.list();
    }
}
