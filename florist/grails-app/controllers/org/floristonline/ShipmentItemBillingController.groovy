package org.floristonline

class ShipmentItemBillingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipmentItemBillingInstanceList: ShipmentItemBilling.list(params), shipmentItemBillingInstanceTotal: ShipmentItemBilling.count()]
    }

    def create = {
        def shipmentItemBillingInstance = new ShipmentItemBilling()
        shipmentItemBillingInstance.properties = params
        return [shipmentItemBillingInstance: shipmentItemBillingInstance]
    }

    def save = {
        def shipmentItemBillingInstance = new ShipmentItemBilling(params)
        if (shipmentItemBillingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), shipmentItemBillingInstance.id])}"
            redirect(action: "show", id: shipmentItemBillingInstance.id)
        }
        else {
            render(view: "create", model: [shipmentItemBillingInstance: shipmentItemBillingInstance])
        }
    }

    def show = {
        def shipmentItemBillingInstance = ShipmentItemBilling.get(params.id)
        if (!shipmentItemBillingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentItemBillingInstance: shipmentItemBillingInstance]
        }
    }

    def edit = {
        def shipmentItemBillingInstance = ShipmentItemBilling.get(params.id)
        if (!shipmentItemBillingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentItemBillingInstance: shipmentItemBillingInstance]
        }
    }

    def update = {
        def shipmentItemBillingInstance = ShipmentItemBilling.get(params.id)
        if (shipmentItemBillingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentItemBillingInstance.version > version) {
                    
                    shipmentItemBillingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling')] as Object[], "Another user has updated this ShipmentItemBilling while you were editing")
                    render(view: "edit", model: [shipmentItemBillingInstance: shipmentItemBillingInstance])
                    return
                }
            }
            shipmentItemBillingInstance.properties = params
            if (!shipmentItemBillingInstance.hasErrors() && shipmentItemBillingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), shipmentItemBillingInstance.id])}"
                redirect(action: "show", id: shipmentItemBillingInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentItemBillingInstance: shipmentItemBillingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentItemBillingInstance = ShipmentItemBilling.get(params.id)
        if (shipmentItemBillingInstance) {
            try {
                shipmentItemBillingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shipmentItemBilling.label', default: 'ShipmentItemBilling'), params.id])}"
            redirect(action: "list")
        }
    }
}
