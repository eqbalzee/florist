package org.floristonline

class ProductFeatureApplicabilityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productFeatureApplicabilityInstanceList: ProductFeatureApplicability.list(params), productFeatureApplicabilityInstanceTotal: ProductFeatureApplicability.count()]
    }

    def create = {
        def productFeatureApplicabilityInstance = new ProductFeatureApplicability()
        productFeatureApplicabilityInstance.properties = params
        return [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance]
    }

    def save = {
        def productFeatureApplicabilityInstance = new ProductFeatureApplicability(params)
        if (productFeatureApplicabilityInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), productFeatureApplicabilityInstance.id])}"
            redirect(action: "show", id: productFeatureApplicabilityInstance.id)
        }
        else {
            render(view: "create", model: [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance])
        }
    }

    def show = {
        def productFeatureApplicabilityInstance = ProductFeatureApplicability.get(params.id)
        if (!productFeatureApplicabilityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance]
        }
    }

    def edit = {
        def productFeatureApplicabilityInstance = ProductFeatureApplicability.get(params.id)
        if (!productFeatureApplicabilityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance]
        }
    }

    def update = {
        def productFeatureApplicabilityInstance = ProductFeatureApplicability.get(params.id)
        if (productFeatureApplicabilityInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productFeatureApplicabilityInstance.version > version) {
                    
                    productFeatureApplicabilityInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability')] as Object[], "Another user has updated this ProductFeatureApplicability while you were editing")
                    render(view: "edit", model: [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance])
                    return
                }
            }
            productFeatureApplicabilityInstance.properties = params
            if (!productFeatureApplicabilityInstance.hasErrors() && productFeatureApplicabilityInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), productFeatureApplicabilityInstance.id])}"
                redirect(action: "show", id: productFeatureApplicabilityInstance.id)
            }
            else {
                render(view: "edit", model: [productFeatureApplicabilityInstance: productFeatureApplicabilityInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productFeatureApplicabilityInstance = ProductFeatureApplicability.get(params.id)
        if (productFeatureApplicabilityInstance) {
            try {
                productFeatureApplicabilityInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeatureApplicability.label', default: 'ProductFeatureApplicability'), params.id])}"
            redirect(action: "list")
        }
    }
}
