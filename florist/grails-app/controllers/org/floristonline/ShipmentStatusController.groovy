package org.floristonline

class ShipmentStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentStatusInstanceList: ShipmentStatus.list(params), shipmentStatusInstanceTotal: ShipmentStatus.count()]
    }

    def create = {
        def shipmentStatusInstance = new ShipmentStatus()
        shipmentStatusInstance.properties = params
        return [shipmentStatusInstance: shipmentStatusInstance]
    }

    def save = {
        def shipmentStatusInstance = new ShipmentStatus(params)
        if (shipmentStatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), shipmentStatusInstance.id])}"
            redirect(action: "show", id: shipmentStatusInstance.id)
        }
        else {
            render(view: "create", model: [shipmentStatusInstance: shipmentStatusInstance])
        }
    }

    def show = {
        def shipmentStatusInstance = ShipmentStatus.get(params.id)
        if (!shipmentStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentStatusInstance: shipmentStatusInstance]
        }
    }

    def edit = {
        def shipmentStatusInstance = ShipmentStatus.get(params.id)
        if (!shipmentStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentStatusInstance: shipmentStatusInstance]
        }
    }

    def update = {
        def shipmentStatusInstance = ShipmentStatus.get(params.id)
        if (shipmentStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentStatusInstance.version > version) {
                    
                    shipmentStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentStatus.label', default: 'ShipmentStatus')] as Object[], "Another user has updated this ShipmentStatus while you were editing")
                    render(view: "edit", model: [shipmentStatusInstance: shipmentStatusInstance])
                    return
                }
            }
            shipmentStatusInstance.properties = params
            if (!shipmentStatusInstance.hasErrors() && shipmentStatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), shipmentStatusInstance.id])}"
                redirect(action: "show", id: shipmentStatusInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentStatusInstance: shipmentStatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentStatusInstance = ShipmentStatus.get(params.id)
        if (shipmentStatusInstance) {
            try {
                shipmentStatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatus.label', default: 'ShipmentStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
