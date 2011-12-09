package org.floristonline

class ContactMechanismController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactMechanismInstanceList: ContactMechanism.list(params), contactMechanismInstanceTotal: ContactMechanism.count()]
    }

    def create = {
        def contactMechanismInstance = new ContactMechanism()
        contactMechanismInstance.properties = params
        return [contactMechanismInstance: contactMechanismInstance]
    }

    def save = {
        def contactMechanismInstance = new ContactMechanism(params)
        if (contactMechanismInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), contactMechanismInstance.id])}"
            redirect(action: "show", id: contactMechanismInstance.id)
        }
        else {
            render(view: "create", model: [contactMechanismInstance: contactMechanismInstance])
        }
    }

    def show = {
        def contactMechanismInstance = ContactMechanism.get(params.id)
        if (!contactMechanismInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactMechanismInstance: contactMechanismInstance]
        }
    }

    def edit = {
        def contactMechanismInstance = ContactMechanism.get(params.id)
        if (!contactMechanismInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactMechanismInstance: contactMechanismInstance]
        }
    }

    def update = {
        def contactMechanismInstance = ContactMechanism.get(params.id)
        if (contactMechanismInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactMechanismInstance.version > version) {
                    
                    contactMechanismInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactMechanism.label', default: 'ContactMechanism')] as Object[], "Another user has updated this ContactMechanism while you were editing")
                    render(view: "edit", model: [contactMechanismInstance: contactMechanismInstance])
                    return
                }
            }
            contactMechanismInstance.properties = params
            if (!contactMechanismInstance.hasErrors() && contactMechanismInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), contactMechanismInstance.id])}"
                redirect(action: "show", id: contactMechanismInstance.id)
            }
            else {
                render(view: "edit", model: [contactMechanismInstance: contactMechanismInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactMechanismInstance = ContactMechanism.get(params.id)
        if (contactMechanismInstance) {
            try {
                contactMechanismInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactMechanism.label', default: 'ContactMechanism'), params.id])}"
            redirect(action: "list")
        }
    }
}
