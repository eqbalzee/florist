package org.floristonline

class PaymentApplicationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentApplicationInstanceList: PaymentApplication.list(params), paymentApplicationInstanceTotal: PaymentApplication.count()]
    }

    def create = {
        def paymentApplicationInstance = new PaymentApplication()
        paymentApplicationInstance.properties = params
        return [paymentApplicationInstance: paymentApplicationInstance]
    }

    def save = {
        def paymentApplicationInstance = new PaymentApplication(params)
        if (paymentApplicationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), paymentApplicationInstance.id])}"
            redirect(action: "show", id: paymentApplicationInstance.id)
        }
        else {
            render(view: "create", model: [paymentApplicationInstance: paymentApplicationInstance])
        }
    }

    def show = {
        def paymentApplicationInstance = PaymentApplication.get(params.id)
        if (!paymentApplicationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
            redirect(action: "list")
        }
        else {
            [paymentApplicationInstance: paymentApplicationInstance]
        }
    }

    def edit = {
        def paymentApplicationInstance = PaymentApplication.get(params.id)
        if (!paymentApplicationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [paymentApplicationInstance: paymentApplicationInstance]
        }
    }

    def update = {
        def paymentApplicationInstance = PaymentApplication.get(params.id)
        if (paymentApplicationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (paymentApplicationInstance.version > version) {
                    
                    paymentApplicationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paymentApplication.label', default: 'PaymentApplication')] as Object[], "Another user has updated this PaymentApplication while you were editing")
                    render(view: "edit", model: [paymentApplicationInstance: paymentApplicationInstance])
                    return
                }
            }
            paymentApplicationInstance.properties = params
            if (!paymentApplicationInstance.hasErrors() && paymentApplicationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), paymentApplicationInstance.id])}"
                redirect(action: "show", id: paymentApplicationInstance.id)
            }
            else {
                render(view: "edit", model: [paymentApplicationInstance: paymentApplicationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def paymentApplicationInstance = PaymentApplication.get(params.id)
        if (paymentApplicationInstance) {
            try {
                paymentApplicationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paymentApplication.label', default: 'PaymentApplication'), params.id])}"
            redirect(action: "list")
        }
    }
}
