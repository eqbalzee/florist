package org.floristonline

class InvoicePaymentsReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoicePaymentsReportInstanceList: InvoicePaymentsReport.list(params), invoicePaymentsReportInstanceTotal: InvoicePaymentsReport.count()]
    }

    def create = {
        def invoicePaymentsReportInstance = new InvoicePaymentsReport()
        invoicePaymentsReportInstance.properties = params
        return [invoicePaymentsReportInstance: invoicePaymentsReportInstance]
    }

    def save = {
        def invoicePaymentsReportInstance = new InvoicePaymentsReport(params)
        if (invoicePaymentsReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), invoicePaymentsReportInstance.id])}"
            redirect(action: "show", id: invoicePaymentsReportInstance.id)
        }
        else {
            render(view: "create", model: [invoicePaymentsReportInstance: invoicePaymentsReportInstance])
        }
    }

    def show = {
        def invoicePaymentsReportInstance = InvoicePaymentsReport.get(params.id)
        if (!invoicePaymentsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoicePaymentsReportInstance: invoicePaymentsReportInstance]
        }
    }

    def edit = {
        def invoicePaymentsReportInstance = InvoicePaymentsReport.get(params.id)
        if (!invoicePaymentsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoicePaymentsReportInstance: invoicePaymentsReportInstance]
        }
    }

    def update = {
        def invoicePaymentsReportInstance = InvoicePaymentsReport.get(params.id)
        if (invoicePaymentsReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoicePaymentsReportInstance.version > version) {
                    
                    invoicePaymentsReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport')] as Object[], "Another user has updated this InvoicePaymentsReport while you were editing")
                    render(view: "edit", model: [invoicePaymentsReportInstance: invoicePaymentsReportInstance])
                    return
                }
            }
            invoicePaymentsReportInstance.properties = params
            if (!invoicePaymentsReportInstance.hasErrors() && invoicePaymentsReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), invoicePaymentsReportInstance.id])}"
                redirect(action: "show", id: invoicePaymentsReportInstance.id)
            }
            else {
                render(view: "edit", model: [invoicePaymentsReportInstance: invoicePaymentsReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoicePaymentsReportInstance = InvoicePaymentsReport.get(params.id)
        if (invoicePaymentsReportInstance) {
            try {
                invoicePaymentsReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoicePaymentsReport.label', default: 'InvoicePaymentsReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
