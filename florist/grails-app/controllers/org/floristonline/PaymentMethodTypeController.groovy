package org.floristonline

class PaymentMethodTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentMethodTypeInstanceList: PaymentMethodType.list(params), paymentMethodTypeInstanceTotal: PaymentMethodType.count()]
    }

    def create = {
        def paymentMethodTypeInstance = new PaymentMethodType()
        paymentMethodTypeInstance.properties = params
        return [paymentMethodTypeInstance: paymentMethodTypeInstance]
    }

    def save = {
        def paymentMethodTypeInstance = new PaymentMethodType(params)
        if (paymentMethodTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), paymentMethodTypeInstance.id])}"
            redirect(action: "show", id: paymentMethodTypeInstance.id)
        }
        else {
            render(view: "create", model: [paymentMethodTypeInstance: paymentMethodTypeInstance])
        }
    }

    def show = {
        def paymentMethodTypeInstance = PaymentMethodType.get(params.id)
        if (!paymentMethodTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paymentMethodTypeInstance: paymentMethodTypeInstance]
        }
    }

    def edit = {
        def paymentMethodTypeInstance = PaymentMethodType.get(params.id)
        if (!paymentMethodTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paymentMethodTypeInstance: paymentMethodTypeInstance]
        }
    }

    def update = {
        def paymentMethodTypeInstance = PaymentMethodType.get(params.id)
        if (paymentMethodTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paymentMethodTypeInstance.version > version) {
                    
                    paymentMethodTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paymentMethodType.label', default: 'PaymentMethodType')] as Object[], "Another user has updated this PaymentMethodType while you were editing")
                    render(view: "edit", model: [paymentMethodTypeInstance: paymentMethodTypeInstance])
                    return
                }
            }
            paymentMethodTypeInstance.properties = params
            if (!paymentMethodTypeInstance.hasErrors() && paymentMethodTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), paymentMethodTypeInstance.id])}"
                redirect(action: "show", id: paymentMethodTypeInstance.id)
            }
            else {
                render(view: "edit", model: [paymentMethodTypeInstance: paymentMethodTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paymentMethodTypeInstance = PaymentMethodType.get(params.id)
        if (paymentMethodTypeInstance) {
            try {
                paymentMethodTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentMethodType.label', default: 'PaymentMethodType'), params.id])}"
            redirect(action: "list")
        }
    }
}
