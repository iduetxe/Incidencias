package es.almacen.servicios

import org.springframework.transaction.annotation.Transactional

class ServiciosService {

	static transactional = true


    @Transactional(readOnly = true)
    def listServicesByName(String word) {
    return null ; //To change body of created methods use File | Settings | File Templates.
    }
}
