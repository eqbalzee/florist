package org.floristonline

class PartyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [partyInstanceList: Party.list(params), partyInstanceTotal: Party.count()]
    }

    def create = {
        def partyInstance = new Party()
        partyInstance.properties = params
        return [partyInstance: partyInstance]
    }

    def save = {
        def partyInstance = new Party(params)
        if (partyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'party.label', default: 'Party'), partyInstance.id])}"
            redirect(action: "show", id: partyInstance.id)
        }
        else {
            render(view: "create", model: [partyInstance: partyInstance])
        }
    }

    def show = {
        def partyInstance = Party.get(params.id)
        if (!partyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partyInstance: partyInstance]
        }
    }

    def edit = {
        def partyInstance = Party.get(params.id)
        if (!partyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partyInstance: partyInstance]
        }
    }

    def update = {
        def partyInstance = Party.get(params.id)
        if (partyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partyInstance.version > version) {
                    
                    partyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'party.label', default: 'Party')] as Object[], "Another user has updated this Party while you were editing")
                    render(view: "edit", model: [partyInstance: partyInstance])
                    return
                }
            }
            partyInstance.properties = params
            if (!partyInstance.hasErrors() && partyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'party.label', default: 'Party'), partyInstance.id])}"
                redirect(action: "show", id: partyInstance.id)
            }
            else {
                render(view: "edit", model: [partyInstance: partyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partyInstance = Party.get(params.id)
        if (partyInstance) {
            try {
                partyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])}"
            redirect(action: "list")
        }
    }
}
