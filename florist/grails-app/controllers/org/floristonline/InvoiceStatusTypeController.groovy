package org.floristonline

class InvoiceStatusTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceStatusTypeInstanceList: InvoiceStatusType.list(params), invoiceStatusTypeInstanceTotal: InvoiceStatusType.count()]
    }

    def create = {
        def invoiceStatusTypeInstance = new InvoiceStatusType()
        invoiceStatusTypeInstance.properties = params
        return [invoiceStatusTypeInstance: invoiceStatusTypeInstance]
    }

    def save = {
        def invoiceStatusTypeInstance = new InvoiceStatusType(params)
        if (invoiceStatusTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), invoiceStatusTypeInstance.id])}"
            redirect(action: "show", id: invoiceStatusTypeInstance.id)
        }
        else {
            render(view: "create", model: [invoiceStatusTypeInstance: invoiceStatusTypeInstance])
        }
    }

    def show = {
        def invoiceStatusTypeInstance = InvoiceStatusType.get(params.id)
        if (!invoiceStatusTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceStatusTypeInstance: invoiceStatusTypeInstance]
        }
    }

    def edit = {
        def invoiceStatusTypeInstance = InvoiceStatusType.get(params.id)
        if (!invoiceStatusTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceStatusTypeInstance: invoiceStatusTypeInstance]
        }
    }

    def update = {
        def invoiceStatusTypeInstance = InvoiceStatusType.get(params.id)
        if (invoiceStatusTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceStatusTypeInstance.version > version) {
                    
                    invoiceStatusTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType')] as Object[], "Another user has updated this InvoiceStatusType while you were editing")
                    render(view: "edit", model: [invoiceStatusTypeInstance: invoiceStatusTypeInstance])
                    return
                }
            }
            invoiceStatusTypeInstance.properties = params
            if (!invoiceStatusTypeInstance.hasErrors() && invoiceStatusTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), invoiceStatusTypeInstance.id])}"
                redirect(action: "show", id: invoiceStatusTypeInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceStatusTypeInstance: invoiceStatusTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceStatusTypeInstance = InvoiceStatusType.get(params.id)
        if (invoiceStatusTypeInstance) {
            try {
                invoiceStatusTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusType.label', default: 'InvoiceStatusType'), params.id])}"
            redirect(action: "list")
        }
    }
}
