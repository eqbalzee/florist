package org.floristonline

class ShipmentDataAndContactMechanismsReportController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentDataAndContactMechanismsReportInstanceList: ShipmentDataAndContactMechanismsReport.list(params), shipmentDataAndContactMechanismsReportInstanceTotal: ShipmentDataAndContactMechanismsReport.count()]
    }

    def create = {
        def shipmentDataAndContactMechanismsReportInstance = new ShipmentDataAndContactMechanismsReport()
        shipmentDataAndContactMechanismsReportInstance.properties = params
        return [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance]
    }

    def save = {
        def shipmentDataAndContactMechanismsReportInstance = new ShipmentDataAndContactMechanismsReport(params)
        if (shipmentDataAndContactMechanismsReportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), shipmentDataAndContactMechanismsReportInstance.id])}"
            redirect(action: "show", id: shipmentDataAndContactMechanismsReportInstance.id)
        }
        else {
            render(view: "create", model: [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance])
        }
    }

    def show = {
        def shipmentDataAndContactMechanismsReportInstance = ShipmentDataAndContactMechanismsReport.get(params.id)
        if (!shipmentDataAndContactMechanismsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance]
        }
    }

    def edit = {
        def shipmentDataAndContactMechanismsReportInstance = ShipmentDataAndContactMechanismsReport.get(params.id)
        if (!shipmentDataAndContactMechanismsReportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance]
        }
    }

    def update = {
        def shipmentDataAndContactMechanismsReportInstance = ShipmentDataAndContactMechanismsReport.get(params.id)
        if (shipmentDataAndContactMechanismsReportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentDataAndContactMechanismsReportInstance.version > version) {
                    
                    shipmentDataAndContactMechanismsReportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport')] as Object[], "Another user has updated this ShipmentDataAndContactMechanismsReport while you were editing")
                    render(view: "edit", model: [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance])
                    return
                }
            }
            shipmentDataAndContactMechanismsReportInstance.properties = params
            if (!shipmentDataAndContactMechanismsReportInstance.hasErrors() && shipmentDataAndContactMechanismsReportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), shipmentDataAndContactMechanismsReportInstance.id])}"
                redirect(action: "show", id: shipmentDataAndContactMechanismsReportInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentDataAndContactMechanismsReportInstance: shipmentDataAndContactMechanismsReportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentDataAndContactMechanismsReportInstance = ShipmentDataAndContactMechanismsReport.get(params.id)
        if (shipmentDataAndContactMechanismsReportInstance) {
            try {
                shipmentDataAndContactMechanismsReportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentDataAndContactMechanismsReport.label', default: 'ShipmentDataAndContactMechanismsReport'), params.id])}"
            redirect(action: "list")
        }
    }
}
