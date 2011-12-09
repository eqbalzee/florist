package org.floristonline

class InvoiceStatusDataReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceStatusDataReportInstanceList: InvoiceStatusDataReport.list(params), invoiceStatusDataReportInstanceTotal: InvoiceStatusDataReport.count()]
    }

    def create = {
        def invoiceStatusDataReportInstance = new InvoiceStatusDataReport()
        invoiceStatusDataReportInstance.properties = params
        return [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance]
    }

    def save = {
        def invoiceStatusDataReportInstance = new InvoiceStatusDataReport(params)
        if (invoiceStatusDataReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), invoiceStatusDataReportInstance.id])}"
            redirect(action: "show", id: invoiceStatusDataReportInstance.id)
        }
        else {
            render(view: "create", model: [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance])
        }
    }

    def show = {
        def invoiceStatusDataReportInstance = InvoiceStatusDataReport.get(params.id)
        if (!invoiceStatusDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance]
        }
    }

    def edit = {
        def invoiceStatusDataReportInstance = InvoiceStatusDataReport.get(params.id)
        if (!invoiceStatusDataReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance]
        }
    }

    def update = {
        def invoiceStatusDataReportInstance = InvoiceStatusDataReport.get(params.id)
        if (invoiceStatusDataReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invoiceStatusDataReportInstance.version > version) {
                    
                    invoiceStatusDataReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport')] as Object[], "Another user has updated this InvoiceStatusDataReport while you were editing")
                    render(view: "edit", model: [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance])
                    return
                }
            }
            invoiceStatusDataReportInstance.properties = params
            if (!invoiceStatusDataReportInstance.hasErrors() && invoiceStatusDataReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), invoiceStatusDataReportInstance.id])}"
                redirect(action: "show", id: invoiceStatusDataReportInstance.id)
            }
            else {
                render(view: "edit", model: [invoiceStatusDataReportInstance: invoiceStatusDataReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invoiceStatusDataReportInstance = InvoiceStatusDataReport.get(params.id)
        if (invoiceStatusDataReportInstance) {
            try {
                invoiceStatusDataReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'invoiceStatusDataReport.label', default: 'InvoiceStatusDataReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
