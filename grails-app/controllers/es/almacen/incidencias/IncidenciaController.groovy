package es.almacen.incidencias

import grails.plugins.springsecurity.Secured
import es.almacen.usuarios.Usuario
import es.almacen.SearchUtil

class IncidenciaController {

	def incidenciaService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def addNote = {
        AddNoteCommand cmd ->
        flash.message = flash.message==null?[]:flash.message.values
        flash.error = flash.error==null?[]:flash.error.values

        if (cmd.hasErrors()){
            redirect(action: "show", id: cmd.incidenciaId)
        }

        Incidencia i = Incidencia.findById(cmd.incidenciaId)
        def principal = springSecurityService.getPrincipal()
        def u = Usuario.get(principal.id)

        Nota nota = new Nota(texto:cmd.nota,incidencia:i, owner:u, dateCreated:new Date() )
        if (nota.save(flush: true)) {
            flash.message = "${message(code: 'incidencia.note.saved', args: [i.titulo, u.name])}"
            redirect(action: "show", id: i.id)
        }else{
            flash.error = "${message(code: 'addNote.error', default:'Error añadiendo nota')}"
            redirect(action: "show", id: i.id)
        }
    }

    def list = { IncidenciaListCommand cmd ->

        def result = incidenciaService.listIncidencias(cmd)

        [incidenciaInstanceList: result, incidenciaInstanceTotal: result.getTotalCount()]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def create = {
        def incidenciaInstance = new IncidenciaCreateCommand()
        return [incidenciaInstance: incidenciaInstance]
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def save = { IncidenciaCreateCommand cmd ->
        if (cmd.hasErrors()){
            render(view: "create", model: [incidenciaInstance: cmd, validation:cmd])
        }else {
            def incidenciaInstance = incidenciaService.newIncidencia(cmd)
            flash.message = "${message(code: 'incidencia.saved', args: [incidenciaInstance.titulo])}"
            redirect(action: "show", id: incidenciaInstance.id)
        }
    }

    def show = {
        flash.message = flash.message==null?[]:flash.message.values
        flash.error = flash.error==null?[]:flash.error.values

        def incidenciaInstance = Incidencia.get(params.id)
        if (!incidenciaInstance) {
            flash.message += "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [incidenciaInstance: incidenciaInstance]
        }
    }


    @Secured(['ROLE_TECNICO'])
    def edit = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (!incidenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [incidenciaInstance: incidenciaInstance]
        }
    }


    @Secured(['ROLE_TECNICO'])
    def update = {

        def incidenciaInstance = Incidencia.get(params.id)
        if (incidenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (incidenciaInstance.version > version) {
                    
                    incidenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'incidencia.label', default: 'Incidencia')] as Object[], "Another user has updated this Incidencia while you were editing")
                    render(view: "edit", model: [incidenciaInstance: incidenciaInstance])
                    return
                }
            }
            incidenciaInstance.properties = params
            if (!incidenciaInstance.hasErrors() && incidenciaInstance.save(flush: true)) {
                def message =
                flash.message = ["${message(code: 'default.updated.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), incidenciaInstance.id])}"]
                redirect(action: "show", id: incidenciaInstance.id)
            }
            else {
                render(view: "edit", model: [incidenciaInstance: incidenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_TECNICO'])
    def delete = {
        def incidenciaInstance = Incidencia.get(params.id)
        if (incidenciaInstance) {
            try {
                incidenciaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'incidencia.label', default: 'Incidencia'), params.id])}"
            redirect(action: "list")
        }
    }

    def search = {
        flash.message = flash.message==null?[]:flash.message
        flash.error = flash.error==null?[]:flash.error

        flash.message +="BUSCADO"
        render (action: "list")
    }
}
