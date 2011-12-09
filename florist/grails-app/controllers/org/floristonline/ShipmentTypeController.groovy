package org.floristonline

class ShipmentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentTypeInstanceList: ShipmentType.list(params), shipmentTypeInstanceTotal: ShipmentType.count()]
    }

    def create = {
        def shipmentTypeInstance = new ShipmentType()
        shipmentTypeInstance.properties = params
        return [shipmentTypeInstance: shipmentTypeInstance]
    }

    def save = {
        def shipmentTypeInstance = new ShipmentType(params)
        if (shipmentTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), shipmentTypeInstance.id])}"
            redirect(action: "show", id: shipmentTypeInstance.id)
        }
        else {
            render(view: "create", model: [shipmentTypeInstance: shipmentTypeInstance])
        }
    }

    def show = {
        def shipmentTypeInstance = ShipmentType.get(params.id)
        if (!shipmentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentTypeInstance: shipmentTypeInstance]
        }
    }

    def edit = {
        def shipmentTypeInstance = ShipmentType.get(params.id)
        if (!shipmentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentTypeInstance: shipmentTypeInstance]
        }
    }

    def update = {
        def shipmentTypeInstance = ShipmentType.get(params.id)
        if (shipmentTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentTypeInstance.version > version) {
                    
                    shipmentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentType.label', default: 'ShipmentType')] as Object[], "Another user has updated this ShipmentType while you were editing")
                    render(view: "edit", model: [shipmentTypeInstance: shipmentTypeInstance])
                    return
                }
            }
            shipmentTypeInstance.properties = params
            if (!shipmentTypeInstance.hasErrors() && shipmentTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), shipmentTypeInstance.id])}"
                redirect(action: "show", id: shipmentTypeInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentTypeInstance: shipmentTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentTypeInstance = ShipmentType.get(params.id)
        if (shipmentTypeInstance) {
            try {
                shipmentTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentType.label', default: 'ShipmentType'), params.id])}"
            redirect(action: "list")
        }
    }
}
