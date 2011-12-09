package org.floristonline

class ShipmentStatusTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentStatusTypeInstanceList: ShipmentStatusType.list(params), shipmentStatusTypeInstanceTotal: ShipmentStatusType.count()]
    }

    def create = {
        def shipmentStatusTypeInstance = new ShipmentStatusType()
        shipmentStatusTypeInstance.properties = params
        return [shipmentStatusTypeInstance: shipmentStatusTypeInstance]
    }

    def save = {
        def shipmentStatusTypeInstance = new ShipmentStatusType(params)
        if (shipmentStatusTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), shipmentStatusTypeInstance.id])}"
            redirect(action: "show", id: shipmentStatusTypeInstance.id)
        }
        else {
            render(view: "create", model: [shipmentStatusTypeInstance: shipmentStatusTypeInstance])
        }
    }

    def show = {
        def shipmentStatusTypeInstance = ShipmentStatusType.get(params.id)
        if (!shipmentStatusTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentStatusTypeInstance: shipmentStatusTypeInstance]
        }
    }

    def edit = {
        def shipmentStatusTypeInstance = ShipmentStatusType.get(params.id)
        if (!shipmentStatusTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentStatusTypeInstance: shipmentStatusTypeInstance]
        }
    }

    def update = {
        def shipmentStatusTypeInstance = ShipmentStatusType.get(params.id)
        if (shipmentStatusTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentStatusTypeInstance.version > version) {
                    
                    shipmentStatusTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType')] as Object[], "Another user has updated this ShipmentStatusType while you were editing")
                    render(view: "edit", model: [shipmentStatusTypeInstance: shipmentStatusTypeInstance])
                    return
                }
            }
            shipmentStatusTypeInstance.properties = params
            if (!shipmentStatusTypeInstance.hasErrors() && shipmentStatusTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), shipmentStatusTypeInstance.id])}"
                redirect(action: "show", id: shipmentStatusTypeInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentStatusTypeInstance: shipmentStatusTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentStatusTypeInstance = ShipmentStatusType.get(params.id)
        if (shipmentStatusTypeInstance) {
            try {
                shipmentStatusTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentStatusType.label', default: 'ShipmentStatusType'), params.id])}"
            redirect(action: "list")
        }
    }
}
