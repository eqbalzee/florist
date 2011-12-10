package org.floristonline

class OrderTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderTypeInstanceList: OrderType.list(params), orderTypeInstanceTotal: OrderType.count()]
    }

    def create = {
        def orderTypeInstance = new OrderType()
        orderTypeInstance.properties = params
        return [orderTypeInstance: orderTypeInstance]
    }

    def save = {
        def orderTypeInstance = new OrderType(params)
        if (orderTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'orderType.label', default: 'OrderType'), orderTypeInstance.id])}"
            redirect(action: "show", id: orderTypeInstance.id)
        }
        else {
            render(view: "create", model: [orderTypeInstance: orderTypeInstance])
        }
    }

    def show = {
        def orderTypeInstance = OrderType.get(params.id)
        if (!orderTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [orderTypeInstance: orderTypeInstance]
        }
    }

    def edit = {
        def orderTypeInstance = OrderType.get(params.id)
        if (!orderTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [orderTypeInstance: orderTypeInstance]
        }
    }

    def update = {
        def orderTypeInstance = OrderType.get(params.id)
        if (orderTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (orderTypeInstance.version > version) {
                    
                    orderTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'orderType.label', default: 'OrderType')] as Object[], "Another user has updated this OrderType while you were editing")
                    render(view: "edit", model: [orderTypeInstance: orderTypeInstance])
                    return
                }
            }
            orderTypeInstance.properties = params
            if (!orderTypeInstance.hasErrors() && orderTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'orderType.label', default: 'OrderType'), orderTypeInstance.id])}"
                redirect(action: "show", id: orderTypeInstance.id)
            }
            else {
                render(view: "edit", model: [orderTypeInstance: orderTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def orderTypeInstance = OrderType.get(params.id)
        if (orderTypeInstance) {
            try {
                orderTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderType.label', default: 'OrderType'), params.id])}"
            redirect(action: "list")
        }
    }
}
