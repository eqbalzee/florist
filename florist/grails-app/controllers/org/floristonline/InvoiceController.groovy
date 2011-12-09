package org.floristonline

class InvoiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceInstanceList: Invoice.list(params), invoiceInstanceTotal: Invoice.count()]
    }

    def create = {
        def invoiceInstance = new Invoice()
        invoiceInstance.properties = params
        return [invoiceInstance: invoiceInstance]
    }

    def save = {
        def invoiceInstance = new Invoice(params)
        if (invoiceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])}"
            redirect(action: "show", id: invoiceInstance.id)
        }
        else {
            render(view: "create", model: [invoiceInstance: invoiceInstance])
        }
    }

    def show = {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceInstance: invoiceInstance]
        }
    }

    def edit = {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceInstance: invoiceInstance]
        }
    }

    def update = {
        def invoiceInstance = Invoice.get(params.id)
        if (invoiceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceInstance.version > version) {
                    
                    invoiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoice.label', default: 'Invoice')] as Object[], "Another user has updated this Invoice while you were editing")
                    render(view: "edit", model: [invoiceInstance: invoiceInstance])
                    return
                }
            }
            invoiceInstance.properties = params
            if (!invoiceInstance.hasErrors() && invoiceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])}"
                redirect(action: "show", id: invoiceInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceInstance: invoiceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceInstance = Invoice.get(params.id)
        if (invoiceInstance) {
            try {
                invoiceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])}"
            redirect(action: "list")
        }
    }
}
