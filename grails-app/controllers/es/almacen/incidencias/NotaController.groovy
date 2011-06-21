package es.almacen.incidencias

class NotaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [notaInstanceList: Nota.list(params), notaInstanceTotal: Nota.count()]
    }

    def create = {
        def notaInstance = new Nota()
        notaInstance.properties = params
        return [notaInstance: notaInstance]
    }

    def save = {
        def notaInstance = new Nota(params)
        if (notaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'nota.label', default: 'Nota'), notaInstance.id])}"
            redirect(action: "show", id: notaInstance.id)
        }
        else {
            render(view: "create", model: [notaInstance: notaInstance])
        }
    }

    def show = {
        def notaInstance = Nota.get(params.id)
        if (!notaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
            redirect(action: "list")
        }
        else {
            [notaInstance: notaInstance]
        }
    }

    def edit = {
        def notaInstance = Nota.get(params.id)
        if (!notaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [notaInstance: notaInstance]
        }
    }

    def update = {
        def notaInstance = Nota.get(params.id)
        if (notaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (notaInstance.version > version) {
                    
                    notaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'nota.label', default: 'Nota')] as Object[], "Another user has updated this Nota while you were editing")
                    render(view: "edit", model: [notaInstance: notaInstance])
                    return
                }
            }
            notaInstance.properties = params
            if (!notaInstance.hasErrors() && notaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'nota.label', default: 'Nota'), notaInstance.id])}"
                redirect(action: "show", id: notaInstance.id)
            }
            else {
                render(view: "edit", model: [notaInstance: notaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def notaInstance = Nota.get(params.id)
        if (notaInstance) {
            try {
                notaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'nota.label', default: 'Nota'), params.id])}"
            redirect(action: "list")
        }
    }
}
