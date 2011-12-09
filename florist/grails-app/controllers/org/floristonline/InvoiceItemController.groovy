package org.floristonline

class InvoiceItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceItemInstanceList: InvoiceItem.list(params), invoiceItemInstanceTotal: InvoiceItem.count()]
    }

    def create = {
        def invoiceItemInstance = new InvoiceItem()
        invoiceItemInstance.properties = params
        return [invoiceItemInstance: invoiceItemInstance]
    }

    def save = {
        def invoiceItemInstance = new InvoiceItem(params)
        if (invoiceItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), invoiceItemInstance.id])}"
            redirect(action: "show", id: invoiceItemInstance.id)
        }
        else {
            render(view: "create", model: [invoiceItemInstance: invoiceItemInstance])
        }
    }

    def show = {
        def invoiceItemInstance = InvoiceItem.get(params.id)
        if (!invoiceItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceItemInstance: invoiceItemInstance]
        }
    }

    def edit = {
        def invoiceItemInstance = InvoiceItem.get(params.id)
        if (!invoiceItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceItemInstance: invoiceItemInstance]
        }
    }

    def update = {
        def invoiceItemInstance = InvoiceItem.get(params.id)
        if (invoiceItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceItemInstance.version > version) {
                    
                    invoiceItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceItem.label', default: 'InvoiceItem')] as Object[], "Another user has updated this InvoiceItem while you were editing")
                    render(view: "edit", model: [invoiceItemInstance: invoiceItemInstance])
                    return
                }
            }
            invoiceItemInstance.properties = params
            if (!invoiceItemInstance.hasErrors() && invoiceItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), invoiceItemInstance.id])}"
                redirect(action: "show", id: invoiceItemInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceItemInstance: invoiceItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceItemInstance = InvoiceItem.get(params.id)
        if (invoiceItemInstance) {
            try {
                invoiceItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItem.label', default: 'InvoiceItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
