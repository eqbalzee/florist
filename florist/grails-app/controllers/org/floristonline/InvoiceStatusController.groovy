package org.floristonline

class InvoiceStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceStatusInstanceList: InvoiceStatus.list(params), invoiceStatusInstanceTotal: InvoiceStatus.count()]
    }

    def create = {
        def invoiceStatusInstance = new InvoiceStatus()
        invoiceStatusInstance.properties = params
        return [invoiceStatusInstance: invoiceStatusInstance]
    }

    def save = {
        def invoiceStatusInstance = new InvoiceStatus(params)
        if (invoiceStatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), invoiceStatusInstance.id])}"
            redirect(action: "show", id: invoiceStatusInstance.id)
        }
        else {
            render(view: "create", model: [invoiceStatusInstance: invoiceStatusInstance])
        }
    }

    def show = {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (!invoiceStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceStatusInstance: invoiceStatusInstance]
        }
    }

    def edit = {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (!invoiceStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceStatusInstance: invoiceStatusInstance]
        }
    }

    def update = {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (invoiceStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceStatusInstance.version > version) {
                    
                    invoiceStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceStatus.label', default: 'InvoiceStatus')] as Object[], "Another user has updated this InvoiceStatus while you were editing")
                    render(view: "edit", model: [invoiceStatusInstance: invoiceStatusInstance])
                    return
                }
            }
            invoiceStatusInstance.properties = params
            if (!invoiceStatusInstance.hasErrors() && invoiceStatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), invoiceStatusInstance.id])}"
                redirect(action: "show", id: invoiceStatusInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceStatusInstance: invoiceStatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceStatusInstance = InvoiceStatus.get(params.id)
        if (invoiceStatusInstance) {
            try {
                invoiceStatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatus.label', default: 'InvoiceStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
