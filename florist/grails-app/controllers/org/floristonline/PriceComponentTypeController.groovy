package org.floristonline

class PriceComponentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [priceComponentTypeInstanceList: PriceComponentType.list(params), priceComponentTypeInstanceTotal: PriceComponentType.count()]
    }

    def create = {
        def priceComponentTypeInstance = new PriceComponentType()
        priceComponentTypeInstance.properties = params
        return [priceComponentTypeInstance: priceComponentTypeInstance]
    }

    def save = {
        def priceComponentTypeInstance = new PriceComponentType(params)
        if (priceComponentTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), priceComponentTypeInstance.id])}"
            redirect(action: "show", id: priceComponentTypeInstance.id)
        }
        else {
            render(view: "create", model: [priceComponentTypeInstance: priceComponentTypeInstance])
        }
    }

    def show = {
        def priceComponentTypeInstance = PriceComponentType.get(params.id)
        if (!priceComponentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [priceComponentTypeInstance: priceComponentTypeInstance]
        }
    }

    def edit = {
        def priceComponentTypeInstance = PriceComponentType.get(params.id)
        if (!priceComponentTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [priceComponentTypeInstance: priceComponentTypeInstance]
        }
    }

    def update = {
        def priceComponentTypeInstance = PriceComponentType.get(params.id)
        if (priceComponentTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (priceComponentTypeInstance.version > version) {
                    
                    priceComponentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'priceComponentType.label', default: 'PriceComponentType')] as Object[], "Another user has updated this PriceComponentType while you were editing")
                    render(view: "edit", model: [priceComponentTypeInstance: priceComponentTypeInstance])
                    return
                }
            }
            priceComponentTypeInstance.properties = params
            if (!priceComponentTypeInstance.hasErrors() && priceComponentTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), priceComponentTypeInstance.id])}"
                redirect(action: "show", id: priceComponentTypeInstance.id)
            }
            else {
                render(view: "edit", model: [priceComponentTypeInstance: priceComponentTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def priceComponentTypeInstance = PriceComponentType.get(params.id)
        if (priceComponentTypeInstance) {
            try {
                priceComponentTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'priceComponentType.label', default: 'PriceComponentType'), params.id])}"
            redirect(action: "list")
        }
    }
}
