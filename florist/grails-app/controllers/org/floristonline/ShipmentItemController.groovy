package org.floristonline

class ShipmentItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentItemInstanceList: ShipmentItem.list(params), shipmentItemInstanceTotal: ShipmentItem.count()]
    }

    def create = {
        def shipmentItemInstance = new ShipmentItem()
        shipmentItemInstance.properties = params
        return [shipmentItemInstance: shipmentItemInstance]
    }

    def save = {
        def shipmentItemInstance = new ShipmentItem(params)
        if (shipmentItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), shipmentItemInstance.id])}"
            redirect(action: "show", id: shipmentItemInstance.id)
        }
        else {
            render(view: "create", model: [shipmentItemInstance: shipmentItemInstance])
        }
    }

    def show = {
        def shipmentItemInstance = ShipmentItem.get(params.id)
        if (!shipmentItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentItemInstance: shipmentItemInstance]
        }
    }

    def edit = {
        def shipmentItemInstance = ShipmentItem.get(params.id)
        if (!shipmentItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentItemInstance: shipmentItemInstance]
        }
    }

    def update = {
        def shipmentItemInstance = ShipmentItem.get(params.id)
        if (shipmentItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentItemInstance.version > version) {
                    
                    shipmentItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentItem.label', default: 'ShipmentItem')] as Object[], "Another user has updated this ShipmentItem while you were editing")
                    render(view: "edit", model: [shipmentItemInstance: shipmentItemInstance])
                    return
                }
            }
            shipmentItemInstance.properties = params
            if (!shipmentItemInstance.hasErrors() && shipmentItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), shipmentItemInstance.id])}"
                redirect(action: "show", id: shipmentItemInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentItemInstance: shipmentItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentItemInstance = ShipmentItem.get(params.id)
        if (shipmentItemInstance) {
            try {
                shipmentItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItem.label', default: 'ShipmentItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
