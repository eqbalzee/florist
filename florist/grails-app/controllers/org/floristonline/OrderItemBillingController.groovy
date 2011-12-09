package org.floristonline

class OrderItemBillingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderItemBillingInstanceList: OrderItemBilling.list(params), orderItemBillingInstanceTotal: OrderItemBilling.count()]
    }

    def create = {
        def orderItemBillingInstance = new OrderItemBilling()
        orderItemBillingInstance.properties = params
        return [orderItemBillingInstance: orderItemBillingInstance]
    }

    def save = {
        def orderItemBillingInstance = new OrderItemBilling(params)
        if (orderItemBillingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), orderItemBillingInstance.id])}"
            redirect(action: "show", id: orderItemBillingInstance.id)
        }
        else {
            render(view: "create", model: [orderItemBillingInstance: orderItemBillingInstance])
        }
    }

    def show = {
        def orderItemBillingInstance = OrderItemBilling.get(params.id)
        if (!orderItemBillingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
            redirect(action: "list")
        }
        else {
            [orderItemBillingInstance: orderItemBillingInstance]
        }
    }

    def edit = {
        def orderItemBillingInstance = OrderItemBilling.get(params.id)
        if (!orderItemBillingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [orderItemBillingInstance: orderItemBillingInstance]
        }
    }

    def update = {
        def orderItemBillingInstance = OrderItemBilling.get(params.id)
        if (orderItemBillingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (orderItemBillingInstance.version > version) {
                    
                    orderItemBillingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'orderItemBilling.label', default: 'OrderItemBilling')] as Object[], "Another user has updated this OrderItemBilling while you were editing")
                    render(view: "edit", model: [orderItemBillingInstance: orderItemBillingInstance])
                    return
                }
            }
            orderItemBillingInstance.properties = params
            if (!orderItemBillingInstance.hasErrors() && orderItemBillingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), orderItemBillingInstance.id])}"
                redirect(action: "show", id: orderItemBillingInstance.id)
            }
            else {
                render(view: "edit", model: [orderItemBillingInstance: orderItemBillingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def orderItemBillingInstance = OrderItemBilling.get(params.id)
        if (orderItemBillingInstance) {
            try {
                orderItemBillingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderItemBilling.label', default: 'OrderItemBilling'), params.id])}"
            redirect(action: "list")
        }
    }
}
