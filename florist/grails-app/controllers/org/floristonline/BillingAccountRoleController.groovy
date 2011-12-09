package org.floristonline

class BillingAccountRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [billingAccountRoleInstanceList: BillingAccountRole.list(params), billingAccountRoleInstanceTotal: BillingAccountRole.count()]
    }

    def create = {
        def billingAccountRoleInstance = new BillingAccountRole()
        billingAccountRoleInstance.properties = params
        return [billingAccountRoleInstance: billingAccountRoleInstance]
    }

    def save = {
        def billingAccountRoleInstance = new BillingAccountRole(params)
        if (billingAccountRoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), billingAccountRoleInstance.id])}"
            redirect(action: "show", id: billingAccountRoleInstance.id)
        }
        else {
            render(view: "create", model: [billingAccountRoleInstance: billingAccountRoleInstance])
        }
    }

    def show = {
        def billingAccountRoleInstance = BillingAccountRole.get(params.id)
        if (!billingAccountRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [billingAccountRoleInstance: billingAccountRoleInstance]
        }
    }

    def edit = {
        def billingAccountRoleInstance = BillingAccountRole.get(params.id)
        if (!billingAccountRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [billingAccountRoleInstance: billingAccountRoleInstance]
        }
    }

    def update = {
        def billingAccountRoleInstance = BillingAccountRole.get(params.id)
        if (billingAccountRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (billingAccountRoleInstance.version > version) {
                    
                    billingAccountRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'billingAccountRole.label', default: 'BillingAccountRole')] as Object[], "Another user has updated this BillingAccountRole while you were editing")
                    render(view: "edit", model: [billingAccountRoleInstance: billingAccountRoleInstance])
                    return
                }
            }
            billingAccountRoleInstance.properties = params
            if (!billingAccountRoleInstance.hasErrors() && billingAccountRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), billingAccountRoleInstance.id])}"
                redirect(action: "show", id: billingAccountRoleInstance.id)
            }
            else {
                render(view: "edit", model: [billingAccountRoleInstance: billingAccountRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def billingAccountRoleInstance = BillingAccountRole.get(params.id)
        if (billingAccountRoleInstance) {
            try {
                billingAccountRoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'billingAccountRole.label', default: 'BillingAccountRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
