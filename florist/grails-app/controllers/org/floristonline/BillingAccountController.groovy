package org.floristonline

class BillingAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billingAccountInstanceList: BillingAccount.list(params), billingAccountInstanceTotal: BillingAccount.count()]
    }

    def create = {
        def billingAccountInstance = new BillingAccount()
        billingAccountInstance.properties = params
        return [billingAccountInstance: billingAccountInstance]
    }

    def save = {
        def billingAccountInstance = new BillingAccount(params)
        if (billingAccountInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), billingAccountInstance.id])}"
            redirect(action: "show", id: billingAccountInstance.id)
        }
        else {
            render(view: "create", model: [billingAccountInstance: billingAccountInstance])
        }
    }

    def show = {
        def billingAccountInstance = BillingAccount.get(params.id)
        if (!billingAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [billingAccountInstance: billingAccountInstance]
        }
    }

    def edit = {
        def billingAccountInstance = BillingAccount.get(params.id)
        if (!billingAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [billingAccountInstance: billingAccountInstance]
        }
    }

    def update = {
        def billingAccountInstance = BillingAccount.get(params.id)
        if (billingAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (billingAccountInstance.version > version) {
                    
                    billingAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'billingAccount.label', default: 'BillingAccount')] as Object[], "Another user has updated this BillingAccount while you were editing")
                    render(view: "edit", model: [billingAccountInstance: billingAccountInstance])
                    return
                }
            }
            billingAccountInstance.properties = params
            if (!billingAccountInstance.hasErrors() && billingAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), billingAccountInstance.id])}"
                redirect(action: "show", id: billingAccountInstance.id)
            }
            else {
                render(view: "edit", model: [billingAccountInstance: billingAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def billingAccountInstance = BillingAccount.get(params.id)
        if (billingAccountInstance) {
            try {
                billingAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccount.label', default: 'BillingAccount'), params.id])}"
            redirect(action: "list")
        }
    }
}
