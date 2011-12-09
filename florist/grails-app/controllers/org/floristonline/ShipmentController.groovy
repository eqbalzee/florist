package org.floristonline

class ShipmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentInstanceList: Shipment.list(params), shipmentInstanceTotal: Shipment.count()]
    }

    def create = {
        def shipmentInstance = new Shipment()
        shipmentInstance.properties = params
        return [shipmentInstance: shipmentInstance]
    }

    def save = {
        def shipmentInstance = new Shipment(params)
        if (shipmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipment.label', default: 'Shipment'), shipmentInstance.id])}"
            redirect(action: "show", id: shipmentInstance.id)
        }
        else {
            render(view: "create", model: [shipmentInstance: shipmentInstance])
        }
    }

    def show = {
        def shipmentInstance = Shipment.get(params.id)
        if (!shipmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentInstance: shipmentInstance]
        }
    }

    def edit = {
        def shipmentInstance = Shipment.get(params.id)
        if (!shipmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentInstance: shipmentInstance]
        }
    }

    def update = {
        def shipmentInstance = Shipment.get(params.id)
        if (shipmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentInstance.version > version) {
                    
                    shipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipment.label', default: 'Shipment')] as Object[], "Another user has updated this Shipment while you were editing")
                    render(view: "edit", model: [shipmentInstance: shipmentInstance])
                    return
                }
            }
            shipmentInstance.properties = params
            if (!shipmentInstance.hasErrors() && shipmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipment.label', default: 'Shipment'), shipmentInstance.id])}"
                redirect(action: "show", id: shipmentInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentInstance: shipmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentInstance = Shipment.get(params.id)
        if (shipmentInstance) {
            try {
                shipmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipment.label', default: 'Shipment'), params.id])}"
            redirect(action: "list")
        }
    }
}
