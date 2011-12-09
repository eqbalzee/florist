package org.floristonline

class InvoiceItemDataReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceItemDataReportInstanceList: InvoiceItemDataReport.list(params), invoiceItemDataReportInstanceTotal: InvoiceItemDataReport.count()]
    }

    def create = {
        def invoiceItemDataReportInstance = new InvoiceItemDataReport()
        invoiceItemDataReportInstance.properties = params
        return [invoiceItemDataReportInstance: invoiceItemDataReportInstance]
    }

    def save = {
        def invoiceItemDataReportInstance = new InvoiceItemDataReport(params)
        if (invoiceItemDataReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), invoiceItemDataReportInstance.id])}"
            redirect(action: "show", id: invoiceItemDataReportInstance.id)
        }
        else {
            render(view: "create", model: [invoiceItemDataReportInstance: invoiceItemDataReportInstance])
        }
    }

    def show = {
        def invoiceItemDataReportInstance = InvoiceItemDataReport.get(params.id)
        if (!invoiceItemDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceItemDataReportInstance: invoiceItemDataReportInstance]
        }
    }

    def edit = {
        def invoiceItemDataReportInstance = InvoiceItemDataReport.get(params.id)
        if (!invoiceItemDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceItemDataReportInstance: invoiceItemDataReportInstance]
        }
    }

    def update = {
        def invoiceItemDataReportInstance = InvoiceItemDataReport.get(params.id)
        if (invoiceItemDataReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceItemDataReportInstance.version > version) {
                    
                    invoiceItemDataReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport')] as Object[], "Another user has updated this InvoiceItemDataReport while you were editing")
                    render(view: "edit", model: [invoiceItemDataReportInstance: invoiceItemDataReportInstance])
                    return
                }
            }
            invoiceItemDataReportInstance.properties = params
            if (!invoiceItemDataReportInstance.hasErrors() && invoiceItemDataReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), invoiceItemDataReportInstance.id])}"
                redirect(action: "show", id: invoiceItemDataReportInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceItemDataReportInstance: invoiceItemDataReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceItemDataReportInstance = InvoiceItemDataReport.get(params.id)
        if (invoiceItemDataReportInstance) {
            try {
                invoiceItemDataReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemDataReport.label', default: 'InvoiceItemDataReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
