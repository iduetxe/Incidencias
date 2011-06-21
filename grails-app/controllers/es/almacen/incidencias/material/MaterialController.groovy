package es.almacen.incidencias.material

import grails.plugins.springsecurity.Secured


class MaterialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def materialService
    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_TECNICO', 'ROLE_ADMIN'])
    def list = { MaterialListCommand cmd ->
        def result = materialService.listMaterial(cmd)
        def etiquetas = Etiqueta.findAll();
        [materialInstanceList: result, materialInstanceTotal: result.getTotalCount(), etiquetasList: etiquetas]
    }

    @Secured(['ROLE_ADMIN'])
    def create = {
        def materialInstance = new Material()
        materialInstance.properties = params
        return [materialInstance: materialInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def save = {
        def materialInstance = new Material(params)
        if (materialInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'material.label', default: 'Material'), materialInstance.id])}"
            redirect(action: "show", id: materialInstance.id)
        }
        else {
            render(view: "create", model: [materialInstance: materialInstance])
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_TECNICO'])
    def show = {
        def materialInstance = Material.get(params.id)
        if (!materialInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
            redirect(action: "list")
        }
        else {
            [materialInstance: materialInstance]
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_TECNICO'])
    def edit = {
        def materialInstance = Material.get(params.id)
        if (!materialInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [materialInstance: materialInstance]
        }
    }

    def update = {
        def materialInstance = Material.get(params.id)
        if (materialInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (materialInstance.version > version) {
                    
                    materialInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'material.label', default: 'Material')] as Object[], "Another user has updated this Material while you were editing")
                    render(view: "edit", model: [materialInstance: materialInstance])
                    return
                }
            }
            materialInstance.properties = params
            if (!materialInstance.hasErrors() && materialInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'material.label', default: 'Material'), materialInstance.id])}"
                redirect(action: "show", id: materialInstance.id)
            }
            else {
                render(view: "edit", model: [materialInstance: materialInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def materialInstance = Material.get(params.id)
        if (materialInstance) {
            try {
                materialInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'material.label', default: 'Material'), params.id])}"
            redirect(action: "list")
        }
    }
}
