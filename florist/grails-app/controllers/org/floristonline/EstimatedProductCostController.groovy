package org.floristonline

class EstimatedProductCostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estimatedProductCostInstanceList: EstimatedProductCost.list(params), estimatedProductCostInstanceTotal: EstimatedProductCost.count()]
    }

    def create = {
        def estimatedProductCostInstance = new EstimatedProductCost()
        estimatedProductCostInstance.properties = params
        return [estimatedProductCostInstance: estimatedProductCostInstance]
    }

    def save = {
        def estimatedProductCostInstance = new EstimatedProductCost(params)
        if (estimatedProductCostInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), estimatedProductCostInstance.id])}"
            redirect(action: "show", id: estimatedProductCostInstance.id)
        }
        else {
            render(view: "create", model: [estimatedProductCostInstance: estimatedProductCostInstance])
        }
    }

    def show = {
        def estimatedProductCostInstance = EstimatedProductCost.get(params.id)
        if (!estimatedProductCostInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
            redirect(action: "list")
        }
        else {
            [estimatedProductCostInstance: estimatedProductCostInstance]
        }
    }

    def edit = {
        def estimatedProductCostInstance = EstimatedProductCost.get(params.id)
        if (!estimatedProductCostInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [estimatedProductCostInstance: estimatedProductCostInstance]
        }
    }

    def update = {
        def estimatedProductCostInstance = EstimatedProductCost.get(params.id)
        if (estimatedProductCostInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (estimatedProductCostInstance.version > version) {
                    
                    estimatedProductCostInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost')] as Object[], "Another user has updated this EstimatedProductCost while you were editing")
                    render(view: "edit", model: [estimatedProductCostInstance: estimatedProductCostInstance])
                    return
                }
            }
            estimatedProductCostInstance.properties = params
            if (!estimatedProductCostInstance.hasErrors() && estimatedProductCostInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), estimatedProductCostInstance.id])}"
                redirect(action: "show", id: estimatedProductCostInstance.id)
            }
            else {
                render(view: "edit", model: [estimatedProductCostInstance: estimatedProductCostInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def estimatedProductCostInstance = EstimatedProductCost.get(params.id)
        if (estimatedProductCostInstance) {
            try {
                estimatedProductCostInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'estimatedProductCost.label', default: 'EstimatedProductCost'), params.id])}"
            redirect(action: "list")
        }
    }
}
