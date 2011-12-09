package org.floristonline

class BillingAccountRoleTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billingAccountRoleTypeInstanceList: BillingAccountRoleType.list(params), billingAccountRoleTypeInstanceTotal: BillingAccountRoleType.count()]
    }

    def create = {
        def billingAccountRoleTypeInstance = new BillingAccountRoleType()
        billingAccountRoleTypeInstance.properties = params
        return [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance]
    }

    def save = {
        def billingAccountRoleTypeInstance = new BillingAccountRoleType(params)
        if (billingAccountRoleTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), billingAccountRoleTypeInstance.id])}"
            redirect(action: "show", id: billingAccountRoleTypeInstance.id)
        }
        else {
            render(view: "create", model: [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance])
        }
    }

    def show = {
        def billingAccountRoleTypeInstance = BillingAccountRoleType.get(params.id)
        if (!billingAccountRoleTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance]
        }
    }

    def edit = {
        def billingAccountRoleTypeInstance = BillingAccountRoleType.get(params.id)
        if (!billingAccountRoleTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance]
        }
    }

    def update = {
        def billingAccountRoleTypeInstance = BillingAccountRoleType.get(params.id)
        if (billingAccountRoleTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (billingAccountRoleTypeInstance.version > version) {
                    
                    billingAccountRoleTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType')] as Object[], "Another user has updated this BillingAccountRoleType while you were editing")
                    render(view: "edit", model: [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance])
                    return
                }
            }
            billingAccountRoleTypeInstance.properties = params
            if (!billingAccountRoleTypeInstance.hasErrors() && billingAccountRoleTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), billingAccountRoleTypeInstance.id])}"
                redirect(action: "show", id: billingAccountRoleTypeInstance.id)
            }
            else {
                render(view: "edit", model: [billingAccountRoleTypeInstance: billingAccountRoleTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def billingAccountRoleTypeInstance = BillingAccountRoleType.get(params.id)
        if (billingAccountRoleTypeInstance) {
            try {
                billingAccountRoleTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRoleType.label', default: 'BillingAccountRoleType'), params.id])}"
            redirect(action: "list")
        }
    }
}
