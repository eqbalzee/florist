package org.floristonline

class ReportShipmentStatusDataController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reportShipmentStatusDataInstanceList: ReportShipmentStatusData.list(params), reportShipmentStatusDataInstanceTotal: ReportShipmentStatusData.count()]
    }

    def create = {
        def reportShipmentStatusDataInstance = new ReportShipmentStatusData()
        reportShipmentStatusDataInstance.properties = params
        return [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance]
    }

    def save = {
        def reportShipmentStatusDataInstance = new ReportShipmentStatusData(params)
        if (reportShipmentStatusDataInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), reportShipmentStatusDataInstance.id])}"
            redirect(action: "show", id: reportShipmentStatusDataInstance.id)
        }
        else {
            render(view: "create", model: [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance])
        }
    }

    def show = {
        def reportShipmentStatusDataInstance = ReportShipmentStatusData.get(params.id)
        if (!reportShipmentStatusDataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance]
        }
    }

    def edit = {
        def reportShipmentStatusDataInstance = ReportShipmentStatusData.get(params.id)
        if (!reportShipmentStatusDataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance]
        }
    }

    def update = {
        def reportShipmentStatusDataInstance = ReportShipmentStatusData.get(params.id)
        if (reportShipmentStatusDataInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportShipmentStatusDataInstance.version > version) {
                    
                    reportShipmentStatusDataInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData')] as Object[], "Another user has updated this ReportShipmentStatusData while you were editing")
                    render(view: "edit", model: [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance])
                    return
                }
            }
            reportShipmentStatusDataInstance.properties = params
            if (!reportShipmentStatusDataInstance.hasErrors() && reportShipmentStatusDataInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), reportShipmentStatusDataInstance.id])}"
                redirect(action: "show", id: reportShipmentStatusDataInstance.id)
            }
            else {
                render(view: "edit", model: [reportShipmentStatusDataInstance: reportShipmentStatusDataInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportShipmentStatusDataInstance = ReportShipmentStatusData.get(params.id)
        if (reportShipmentStatusDataInstance) {
            try {
                reportShipmentStatusDataInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportShipmentStatusData.label', default: 'ReportShipmentStatusData'), params.id])}"
            redirect(action: "list")
        }
    }
}
