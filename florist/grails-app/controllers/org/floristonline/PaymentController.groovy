package org.floristonline

class PaymentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentInstanceList: Payment.list(params), paymentInstanceTotal: Payment.count()]
    }

    def create = {
        def paymentInstance = new Payment()
        paymentInstance.properties = params
        return [paymentInstance: paymentInstance]
    }

    def save = {
        def paymentInstance = new Payment(params)
        if (paymentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])}"
            redirect(action: "show", id: paymentInstance.id)
        }
        else {
            render(view: "create", model: [paymentInstance: paymentInstance])
        }
    }

    def show = {
        def paymentInstance = Payment.get(params.id)
        if (!paymentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paymentInstance: paymentInstance]
        }
    }

    def edit = {
        def paymentInstance = Payment.get(params.id)
        if (!paymentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paymentInstance: paymentInstance]
        }
    }

    def update = {
        def paymentInstance = Payment.get(params.id)
        if (paymentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paymentInstance.version > version) {
                    
                    paymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'payment.label', default: 'Payment')] as Object[], "Another user has updated this Payment while you were editing")
                    render(view: "edit", model: [paymentInstance: paymentInstance])
                    return
                }
            }
            paymentInstance.properties = params
            if (!paymentInstance.hasErrors() && paymentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])}"
                redirect(action: "show", id: paymentInstance.id)
            }
            else {
                render(view: "edit", model: [paymentInstance: paymentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paymentInstance = Payment.get(params.id)
        if (paymentInstance) {
            try {
                paymentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])}"
            redirect(action: "list")
        }
    }
}
