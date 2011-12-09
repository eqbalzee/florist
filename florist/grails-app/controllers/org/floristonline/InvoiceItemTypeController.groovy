package org.floristonline

class InvoiceItemTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceItemTypeInstanceList: InvoiceItemType.list(params), invoiceItemTypeInstanceTotal: InvoiceItemType.count()]
    }

    def create = {
        def invoiceItemTypeInstance = new InvoiceItemType()
        invoiceItemTypeInstance.properties = params
        return [invoiceItemTypeInstance: invoiceItemTypeInstance]
    }

    def save = {
        def invoiceItemTypeInstance = new InvoiceItemType(params)
        if (invoiceItemTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), invoiceItemTypeInstance.id])}"
            redirect(action: "show", id: invoiceItemTypeInstance.id)
        }
        else {
            render(view: "create", model: [invoiceItemTypeInstance: invoiceItemTypeInstance])
        }
    }

    def show = {
        def invoiceItemTypeInstance = InvoiceItemType.get(params.id)
        if (!invoiceItemTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceItemTypeInstance: invoiceItemTypeInstance]
        }
    }

    def edit = {
        def invoiceItemTypeInstance = InvoiceItemType.get(params.id)
        if (!invoiceItemTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceItemTypeInstance: invoiceItemTypeInstance]
        }
    }

    def update = {
        def invoiceItemTypeInstance = InvoiceItemType.get(params.id)
        if (invoiceItemTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceItemTypeInstance.version > version) {
                    
                    invoiceItemTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceItemType.label', default: 'InvoiceItemType')] as Object[], "Another user has updated this InvoiceItemType while you were editing")
                    render(view: "edit", model: [invoiceItemTypeInstance: invoiceItemTypeInstance])
                    return
                }
            }
            invoiceItemTypeInstance.properties = params
            if (!invoiceItemTypeInstance.hasErrors() && invoiceItemTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), invoiceItemTypeInstance.id])}"
                redirect(action: "show", id: invoiceItemTypeInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceItemTypeInstance: invoiceItemTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceItemTypeInstance = InvoiceItemType.get(params.id)
        if (invoiceItemTypeInstance) {
            try {
                invoiceItemTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemType.label', default: 'InvoiceItemType'), params.id])}"
            redirect(action: "list")
        }
    }
}
