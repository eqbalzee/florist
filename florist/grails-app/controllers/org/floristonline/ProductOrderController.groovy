package org.floristonline

class ProductOrderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productOrderInstanceList: ProductOrder.list(params), productOrderInstanceTotal: ProductOrder.count()]
    }

    def create = {
        def productOrderInstance = new ProductOrder()
        productOrderInstance.properties = params
        return [productOrderInstance: productOrderInstance]
    }

    def save = {
        def productOrderInstance = new ProductOrder(params)
        if (productOrderInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), productOrderInstance.id])}"
            redirect(action: "show", id: productOrderInstance.id)
        }
        else {
            render(view: "create", model: [productOrderInstance: productOrderInstance])
        }
    }

    def show = {
        def productOrderInstance = ProductOrder.get(params.id)
        if (!productOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productOrderInstance: productOrderInstance]
        }
    }

    def edit = {
        def productOrderInstance = ProductOrder.get(params.id)
        if (!productOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productOrderInstance: productOrderInstance]
        }
    }

    def update = {
        def productOrderInstance = ProductOrder.get(params.id)
        if (productOrderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productOrderInstance.version > version) {
                    
                    productOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'productOrder.label', default: 'ProductOrder')] as Object[], "Another user has updated this ProductOrder while you were editing")
                    render(view: "edit", model: [productOrderInstance: productOrderInstance])
                    return
                }
            }
            productOrderInstance.properties = params
            if (!productOrderInstance.hasErrors() && productOrderInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), productOrderInstance.id])}"
                redirect(action: "show", id: productOrderInstance.id)
            }
            else {
                render(view: "edit", model: [productOrderInstance: productOrderInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productOrderInstance = ProductOrder.get(params.id)
        if (productOrderInstance) {
            try {
                productOrderInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
            redirect(action: "list")
        }
    }
}
