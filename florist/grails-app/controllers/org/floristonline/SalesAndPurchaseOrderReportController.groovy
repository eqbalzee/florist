package org.floristonline

class SalesAndPurchaseOrderReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [salesAndPurchaseOrderReportInstanceList: SalesAndPurchaseOrderReport.list(params), salesAndPurchaseOrderReportInstanceTotal: SalesAndPurchaseOrderReport.count()]
    }

    def create = {
        def salesAndPurchaseOrderReportInstance = new SalesAndPurchaseOrderReport()
        salesAndPurchaseOrderReportInstance.properties = params
        return [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance]
    }

    def save = {
        def salesAndPurchaseOrderReportInstance = new SalesAndPurchaseOrderReport(params)
        if (salesAndPurchaseOrderReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), salesAndPurchaseOrderReportInstance.id])}"
            redirect(action: "show", id: salesAndPurchaseOrderReportInstance.id)
        }
        else {
            render(view: "create", model: [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance])
        }
    }

    def show = {
        def salesAndPurchaseOrderReportInstance = SalesAndPurchaseOrderReport.get(params.id)
        if (!salesAndPurchaseOrderReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance]
        }
    }

    def edit = {
        def salesAndPurchaseOrderReportInstance = SalesAndPurchaseOrderReport.get(params.id)
        if (!salesAndPurchaseOrderReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance]
        }
    }

    def update = {
        def salesAndPurchaseOrderReportInstance = SalesAndPurchaseOrderReport.get(params.id)
        if (salesAndPurchaseOrderReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (salesAndPurchaseOrderReportInstance.version > version) {
                    
                    salesAndPurchaseOrderReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport')] as Object[], "Another user has updated this SalesAndPurchaseOrderReport while you were editing")
                    render(view: "edit", model: [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance])
                    return
                }
            }
            salesAndPurchaseOrderReportInstance.properties = params
            if (!salesAndPurchaseOrderReportInstance.hasErrors() && salesAndPurchaseOrderReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), salesAndPurchaseOrderReportInstance.id])}"
                redirect(action: "show", id: salesAndPurchaseOrderReportInstance.id)
            }
            else {
                render(view: "edit", model: [salesAndPurchaseOrderReportInstance: salesAndPurchaseOrderReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def salesAndPurchaseOrderReportInstance = SalesAndPurchaseOrderReport.get(params.id)
        if (salesAndPurchaseOrderReportInstance) {
            try {
                salesAndPurchaseOrderReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'salesAndPurchaseOrderReport.label', default: 'SalesAndPurchaseOrderReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
