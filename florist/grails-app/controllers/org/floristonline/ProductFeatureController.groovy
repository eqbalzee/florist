package org.floristonline

class ProductFeatureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productFeatureInstanceList: ProductFeature.list(params), productFeatureInstanceTotal: ProductFeature.count()]
    }

    def create = {
        def productFeatureInstance = new ProductFeature()
        productFeatureInstance.properties = params
        return [productFeatureInstance: productFeatureInstance]
    }

    def save = {
        def productFeatureInstance = new ProductFeature(params)
        if (productFeatureInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), productFeatureInstance.id])}"
            redirect(action: "show", id: productFeatureInstance.id)
        }
        else {
            render(view: "create", model: [productFeatureInstance: productFeatureInstance])
        }
    }

    def show = {
        def productFeatureInstance = ProductFeature.get(params.id)
        if (!productFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productFeatureInstance: productFeatureInstance]
        }
    }

    def edit = {
        def productFeatureInstance = ProductFeature.get(params.id)
        if (!productFeatureInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productFeatureInstance: productFeatureInstance]
        }
    }

    def update = {
        def productFeatureInstance = ProductFeature.get(params.id)
        if (productFeatureInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productFeatureInstance.version > version) {
                    
                    productFeatureInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productFeature.label', default: 'ProductFeature')] as Object[], "Another user has updated this ProductFeature while you were editing")
                    render(view: "edit", model: [productFeatureInstance: productFeatureInstance])
                    return
                }
            }
            productFeatureInstance.properties = params
            if (!productFeatureInstance.hasErrors() && productFeatureInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), productFeatureInstance.id])}"
                redirect(action: "show", id: productFeatureInstance.id)
            }
            else {
                render(view: "edit", model: [productFeatureInstance: productFeatureInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productFeatureInstance = ProductFeature.get(params.id)
        if (productFeatureInstance) {
            try {
                productFeatureInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productFeature.label', default: 'ProductFeature'), params.id])}"
            redirect(action: "list")
        }
    }
}
