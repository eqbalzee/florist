package org.floristonline

class ReportEstimatedProductCostsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reportEstimatedProductCostsInstanceList: ReportEstimatedProductCosts.list(params), reportEstimatedProductCostsInstanceTotal: ReportEstimatedProductCosts.count()]
    }

    def create = {
        def reportEstimatedProductCostsInstance = new ReportEstimatedProductCosts()
        reportEstimatedProductCostsInstance.properties = params
        return [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance]
    }

    def save = {
        def reportEstimatedProductCostsInstance = new ReportEstimatedProductCosts(params)
        if (reportEstimatedProductCostsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), reportEstimatedProductCostsInstance.id])}"
            redirect(action: "show", id: reportEstimatedProductCostsInstance.id)
        }
        else {
            render(view: "create", model: [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance])
        }
    }

    def show = {
        def reportEstimatedProductCostsInstance = ReportEstimatedProductCosts.get(params.id)
        if (!reportEstimatedProductCostsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance]
        }
    }

    def edit = {
        def reportEstimatedProductCostsInstance = ReportEstimatedProductCosts.get(params.id)
        if (!reportEstimatedProductCostsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance]
        }
    }

    def update = {
        def reportEstimatedProductCostsInstance = ReportEstimatedProductCosts.get(params.id)
        if (reportEstimatedProductCostsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportEstimatedProductCostsInstance.version > version) {
                    
                    reportEstimatedProductCostsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts')] as Object[], "Another user has updated this ReportEstimatedProductCosts while you were editing")
                    render(view: "edit", model: [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance])
                    return
                }
            }
            reportEstimatedProductCostsInstance.properties = params
            if (!reportEstimatedProductCostsInstance.hasErrors() && reportEstimatedProductCostsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), reportEstimatedProductCostsInstance.id])}"
                redirect(action: "show", id: reportEstimatedProductCostsInstance.id)
            }
            else {
                render(view: "edit", model: [reportEstimatedProductCostsInstance: reportEstimatedProductCostsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportEstimatedProductCostsInstance = ReportEstimatedProductCosts.get(params.id)
        if (reportEstimatedProductCostsInstance) {
            try {
                reportEstimatedProductCostsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportEstimatedProductCosts.label', default: 'ReportEstimatedProductCosts'), params.id])}"
            redirect(action: "list")
        }
    }
}
