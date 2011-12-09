package org.floristonline

class PriceComponentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceComponentInstanceList: PriceComponent.list(params), priceComponentInstanceTotal: PriceComponent.count()]
    }

    def create = {
        def priceComponentInstance = new PriceComponent()
        priceComponentInstance.properties = params
        return [priceComponentInstance: priceComponentInstance]
    }

    def save = {
        def priceComponentInstance = new PriceComponent(params)
        if (priceComponentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), priceComponentInstance.id])}"
            redirect(action: "show", id: priceComponentInstance.id)
        }
        else {
            render(view: "create", model: [priceComponentInstance: priceComponentInstance])
        }
    }

    def show = {
        def priceComponentInstance = PriceComponent.get(params.id)
        if (!priceComponentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
            redirect(action: "list")
        }
        else {
            [priceComponentInstance: priceComponentInstance]
        }
    }

    def edit = {
        def priceComponentInstance = PriceComponent.get(params.id)
        if (!priceComponentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [priceComponentInstance: priceComponentInstance]
        }
    }

    def update = {
        def priceComponentInstance = PriceComponent.get(params.id)
        if (priceComponentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (priceComponentInstance.version > version) {
                    
                    priceComponentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'priceComponent.label', default: 'PriceComponent')] as Object[], "Another user has updated this PriceComponent while you were editing")
                    render(view: "edit", model: [priceComponentInstance: priceComponentInstance])
                    return
                }
            }
            priceComponentInstance.properties = params
            if (!priceComponentInstance.hasErrors() && priceComponentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), priceComponentInstance.id])}"
                redirect(action: "show", id: priceComponentInstance.id)
            }
            else {
                render(view: "edit", model: [priceComponentInstance: priceComponentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def priceComponentInstance = PriceComponent.get(params.id)
        if (priceComponentInstance) {
            try {
                priceComponentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponent.label', default: 'PriceComponent'), params.id])}"
            redirect(action: "list")
        }
    }
}
