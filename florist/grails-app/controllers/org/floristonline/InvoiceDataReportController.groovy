package org.floristonline

class InvoiceDataReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceDataReportInstanceList: InvoiceDataReport.list(params), invoiceDataReportInstanceTotal: InvoiceDataReport.count()]
    }

    def create = {
        def invoiceDataReportInstance = new InvoiceDataReport()
        invoiceDataReportInstance.properties = params
        return [invoiceDataReportInstance: invoiceDataReportInstance]
    }

    def save = {
        def invoiceDataReportInstance = new InvoiceDataReport(params)
        if (invoiceDataReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), invoiceDataReportInstance.id])}"
            redirect(action: "show", id: invoiceDataReportInstance.id)
        }
        else {
            render(view: "create", model: [invoiceDataReportInstance: invoiceDataReportInstance])
        }
    }

    def show = {
        def invoiceDataReportInstance = InvoiceDataReport.get(params.id)
        if (!invoiceDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceDataReportInstance: invoiceDataReportInstance]
        }
    }

    def edit = {
        def invoiceDataReportInstance = InvoiceDataReport.get(params.id)
        if (!invoiceDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceDataReportInstance: invoiceDataReportInstance]
        }
    }

    def update = {
        def invoiceDataReportInstance = InvoiceDataReport.get(params.id)
        if (invoiceDataReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceDataReportInstance.version > version) {
                    
                    invoiceDataReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport')] as Object[], "Another user has updated this InvoiceDataReport while you were editing")
                    render(view: "edit", model: [invoiceDataReportInstance: invoiceDataReportInstance])
                    return
                }
            }
            invoiceDataReportInstance.properties = params
            if (!invoiceDataReportInstance.hasErrors() && invoiceDataReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), invoiceDataReportInstance.id])}"
                redirect(action: "show", id: invoiceDataReportInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceDataReportInstance: invoiceDataReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceDataReportInstance = InvoiceDataReport.get(params.id)
        if (invoiceDataReportInstance) {
            try {
                invoiceDataReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceDataReport.label', default: 'InvoiceDataReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
