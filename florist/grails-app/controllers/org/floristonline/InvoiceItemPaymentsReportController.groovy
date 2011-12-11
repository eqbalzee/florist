package org.floristonline

class InvoiceItemPaymentsReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceItemPaymentsReportInstanceList: InvoiceItemPaymentsReport.list(params), invoiceItemPaymentsReportInstanceTotal: InvoiceItemPaymentsReport.count()]
    }

    def create = {
        def invoiceItemPaymentsReportInstance = new InvoiceItemPaymentsReport()
        invoiceItemPaymentsReportInstance.properties = params
        return [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance]
    }

    def save = {
        def invoiceItemPaymentsReportInstance = new InvoiceItemPaymentsReport(params)
        if (invoiceItemPaymentsReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), invoiceItemPaymentsReportInstance.id])}"
            redirect(action: "show", id: invoiceItemPaymentsReportInstance.id)
        }
        else {
            render(view: "create", model: [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance])
        }
    }

    def show = {
        def invoiceItemPaymentsReportInstance = InvoiceItemPaymentsReport.get(params.id)
        if (!invoiceItemPaymentsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance]
        }
    }

    def edit = {
        def invoiceItemPaymentsReportInstance = InvoiceItemPaymentsReport.get(params.id)
        if (!invoiceItemPaymentsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance]
        }
    }

    def update = {
        def invoiceItemPaymentsReportInstance = InvoiceItemPaymentsReport.get(params.id)
        if (invoiceItemPaymentsReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceItemPaymentsReportInstance.version > version) {
                    
                    invoiceItemPaymentsReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport')] as Object[], "Another user has updated this InvoiceItemPaymentsReport while you were editing")
                    render(view: "edit", model: [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance])
                    return
                }
            }
            invoiceItemPaymentsReportInstance.properties = params
            if (!invoiceItemPaymentsReportInstance.hasErrors() && invoiceItemPaymentsReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), invoiceItemPaymentsReportInstance.id])}"
                redirect(action: "show", id: invoiceItemPaymentsReportInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceItemPaymentsReportInstance: invoiceItemPaymentsReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceItemPaymentsReportInstance = InvoiceItemPaymentsReport.get(params.id)
        if (invoiceItemPaymentsReportInstance) {
            try {
                invoiceItemPaymentsReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceItemPaymentsReport.label', default: 'InvoiceItemPaymentsReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
