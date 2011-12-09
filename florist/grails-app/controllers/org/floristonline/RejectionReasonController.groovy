package org.floristonline

class RejectionReasonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rejectionReasonInstanceList: RejectionReason.list(params), rejectionReasonInstanceTotal: RejectionReason.count()]
    }

    def create = {
        def rejectionReasonInstance = new RejectionReason()
        rejectionReasonInstance.properties = params
        return [rejectionReasonInstance: rejectionReasonInstance]
    }

    def save = {
        def rejectionReasonInstance = new RejectionReason(params)
        if (rejectionReasonInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), rejectionReasonInstance.id])}"
            redirect(action: "show", id: rejectionReasonInstance.id)
        }
        else {
            render(view: "create", model: [rejectionReasonInstance: rejectionReasonInstance])
        }
    }

    def show = {
        def rejectionReasonInstance = RejectionReason.get(params.id)
        if (!rejectionReasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
            redirect(action: "list")
        }
        else {
            [rejectionReasonInstance: rejectionReasonInstance]
        }
    }

    def edit = {
        def rejectionReasonInstance = RejectionReason.get(params.id)
        if (!rejectionReasonInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [rejectionReasonInstance: rejectionReasonInstance]
        }
    }

    def update = {
        def rejectionReasonInstance = RejectionReason.get(params.id)
        if (rejectionReasonInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (rejectionReasonInstance.version > version) {
                    
                    rejectionReasonInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'rejectionReason.label', default: 'RejectionReason')] as Object[], "Another user has updated this RejectionReason while you were editing")
                    render(view: "edit", model: [rejectionReasonInstance: rejectionReasonInstance])
                    return
                }
            }
            rejectionReasonInstance.properties = params
            if (!rejectionReasonInstance.hasErrors() && rejectionReasonInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), rejectionReasonInstance.id])}"
                redirect(action: "show", id: rejectionReasonInstance.id)
            }
            else {
                render(view: "edit", model: [rejectionReasonInstance: rejectionReasonInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def rejectionReasonInstance = RejectionReason.get(params.id)
        if (rejectionReasonInstance) {
            try {
                rejectionReasonInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'rejectionReason.label', default: 'RejectionReason'), params.id])}"
            redirect(action: "list")
        }
    }
}
