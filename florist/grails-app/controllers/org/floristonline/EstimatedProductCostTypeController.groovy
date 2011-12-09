package org.floristonline

class EstimatedProductCostTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estimatedProductCostTypeInstanceList: EstimatedProductCostType.list(params), estimatedProductCostTypeInstanceTotal: EstimatedProductCostType.count()]
    }

    def create = {
        def estimatedProductCostTypeInstance = new EstimatedProductCostType()
        estimatedProductCostTypeInstance.properties = params
        return [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance]
    }

    def save = {
        def estimatedProductCostTypeInstance = new EstimatedProductCostType(params)
        if (estimatedProductCostTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), estimatedProductCostTypeInstance.id])}"
            redirect(action: "show", id: estimatedProductCostTypeInstance.id)
        }
        else {
            render(view: "create", model: [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance])
        }
    }

    def show = {
        def estimatedProductCostTypeInstance = EstimatedProductCostType.get(params.id)
        if (!estimatedProductCostTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance]
        }
    }

    def edit = {
        def estimatedProductCostTypeInstance = EstimatedProductCostType.get(params.id)
        if (!estimatedProductCostTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance]
        }
    }

    def update = {
        def estimatedProductCostTypeInstance = EstimatedProductCostType.get(params.id)
        if (estimatedProductCostTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (estimatedProductCostTypeInstance.version > version) {
                    
                    estimatedProductCostTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType')] as Object[], "Another user has updated this EstimatedProductCostType while you were editing")
                    render(view: "edit", model: [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance])
                    return
                }
            }
            estimatedProductCostTypeInstance.properties = params
            if (!estimatedProductCostTypeInstance.hasErrors() && estimatedProductCostTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), estimatedProductCostTypeInstance.id])}"
                redirect(action: "show", id: estimatedProductCostTypeInstance.id)
            }
            else {
                render(view: "edit", model: [estimatedProductCostTypeInstance: estimatedProductCostTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def estimatedProductCostTypeInstance = EstimatedProductCostType.get(params.id)
        if (estimatedProductCostTypeInstance) {
            try {
                estimatedProductCostTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCostType.label', default: 'EstimatedProductCostType'), params.id])}"
            redirect(action: "list")
        }
    }
}
