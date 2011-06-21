package es.almacen.servicios

class ServicioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [servicioInstanceList: Servicio.list(params), servicioInstanceTotal: Servicio.count()]
    }

    def create = {
        def servicioInstance = new Servicio()
        servicioInstance.properties = params
        return [servicioInstance: servicioInstance]
    }

    def save = {
        def servicioInstance = new Servicio(params)
        if (servicioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'servicio.label', default: 'Servicio'), servicioInstance.id])}"
            redirect(action: "show", id: servicioInstance.id)
        }
        else {
            render(view: "create", model: [servicioInstance: servicioInstance])
        }
    }

    def show = {
        def servicioInstance = Servicio.get(params.id)
        if (!servicioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
            redirect(action: "list")
        }
        else {
            [servicioInstance: servicioInstance]
        }
    }

    def edit = {
        def servicioInstance = Servicio.get(params.id)
        if (!servicioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [servicioInstance: servicioInstance]
        }
    }

    def update = {
        def servicioInstance = Servicio.get(params.id)
        if (servicioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (servicioInstance.version > version) {
                    
                    servicioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'servicio.label', default: 'Servicio')] as Object[], "Another user has updated this Servicio while you were editing")
                    render(view: "edit", model: [servicioInstance: servicioInstance])
                    return
                }
            }
            servicioInstance.properties = params
            if (!servicioInstance.hasErrors() && servicioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'servicio.label', default: 'Servicio'), servicioInstance.id])}"
                redirect(action: "show", id: servicioInstance.id)
            }
            else {
                render(view: "edit", model: [servicioInstance: servicioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def servicioInstance = Servicio.get(params.id)
        if (servicioInstance) {
            try {
                servicioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'servicio.label', default: 'Servicio'), params.id])}"
            redirect(action: "list")
        }
    }
}
