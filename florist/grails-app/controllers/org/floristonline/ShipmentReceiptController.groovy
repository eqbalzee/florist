package org.floristonline

class ShipmentReceiptController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentReceiptInstanceList: ShipmentReceipt.list(params), shipmentReceiptInstanceTotal: ShipmentReceipt.count()]
    }

    def create = {
        def shipmentReceiptInstance = new ShipmentReceipt()
        shipmentReceiptInstance.properties = params
        return [shipmentReceiptInstance: shipmentReceiptInstance]
    }

    def save = {
        def shipmentReceiptInstance = new ShipmentReceipt(params)
        if (shipmentReceiptInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), shipmentReceiptInstance.id])}"
            redirect(action: "show", id: shipmentReceiptInstance.id)
        }
        else {
            render(view: "create", model: [shipmentReceiptInstance: shipmentReceiptInstance])
        }
    }

    def show = {
        def shipmentReceiptInstance = ShipmentReceipt.get(params.id)
        if (!shipmentReceiptInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentReceiptInstance: shipmentReceiptInstance]
        }
    }

    def edit = {
        def shipmentReceiptInstance = ShipmentReceipt.get(params.id)
        if (!shipmentReceiptInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentReceiptInstance: shipmentReceiptInstance]
        }
    }

    def update = {
        def shipmentReceiptInstance = ShipmentReceipt.get(params.id)
        if (shipmentReceiptInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentReceiptInstance.version > version) {
                    
                    shipmentReceiptInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt')] as Object[], "Another user has updated this ShipmentReceipt while you were editing")
                    render(view: "edit", model: [shipmentReceiptInstance: shipmentReceiptInstance])
                    return
                }
            }
            shipmentReceiptInstance.properties = params
            if (!shipmentReceiptInstance.hasErrors() && shipmentReceiptInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), shipmentReceiptInstance.id])}"
                redirect(action: "show", id: shipmentReceiptInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentReceiptInstance: shipmentReceiptInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentReceiptInstance = ShipmentReceipt.get(params.id)
        if (shipmentReceiptInstance) {
            try {
                shipmentReceiptInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentReceipt.label', default: 'ShipmentReceipt'), params.id])}"
            redirect(action: "list")
        }
    }
}
