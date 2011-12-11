package org.floristonline.login

import grails.converters.JSON

class UserController extends grails.plugins.springsecurity.ui.UserController {
	def userSearch = {
		
				boolean useOffset = params.containsKey('offset')
				setIfMissing 'max', 10, 100
				setIfMissing 'offset', 0
		
				def hql = new StringBuilder('FROM ' + lookupUserClassName() + ' u WHERE 1=1 ')
				def queryParams = [:]
		
				for (name in ['username']) {
					if (params[name]) {
						hql.append " AND LOWER(u.$name) LIKE :$name"
						queryParams[name] = params[name].toLowerCase() + '%'
					}
				}
		
				for (name in ['email']) {
					if (params[name]) {
						hql.append " AND LOWER(u.$name) LIKE :$name"
						queryParams[name] = params[name].toLowerCase() + '%'
					}
				}
				
				for (name in ['enabled', 'accountExpired', 'accountLocked', 'passwordExpired']) {
					int value = params.int(name)
					if (value) {
						hql.append " AND u.$name=:$name"
						queryParams[name] = value == 1
					}
				}
		
				int totalCount = lookupUserClass().executeQuery("SELECT COUNT(DISTINCT u) $hql", queryParams)[0]
		
				int max = params.int('max')
				int offset = params.int('offset')
		
				String orderBy = ''
				if (params.sort) {
					orderBy = " ORDER BY u.$params.sort ${params.order ?: 'ASC'}"
				}
		
				def results = lookupUserClass().executeQuery(
						"SELECT DISTINCT u $hql $orderBy",
						queryParams, [max: max, offset: offset])
				def model = [results: results, totalCount: totalCount, searched: true]
		
				// add query params to model for paging
				for (name in ['username', 'enabled', 'accountExpired', 'accountLocked',
							  'passwordExpired', 'sort', 'order']) {
					 model[name] = params[name]
				}
		
				render view: 'search', model: model
			}
		
			/**
			 * Ajax call used by autocomplete textfield.
			 */
			def ajaxUserSearch = {
		
				def jsonData = []
		        
				if (params.term?.length() > 2) {
					
					String username = params.term
					
					String email = params.email?:""
					setIfMissing 'max', 10, 100
		
					def results = lookupUserClass().executeQuery(
							"SELECT DISTINCT u.username " +
							"FROM ${lookupUserClassName()} u " +
							"WHERE LOWER(u.username) LIKE :name " +
							"AND LOWER(u.email) LIKE :email " +
							"ORDER BY u.username",
							[name: "${username.toLowerCase()}%", 
								email: "${email.toLowerCase()}%"],
							[max: params.max])
		
					for (result in results) {
						jsonData << [value: result]
					}
				}
		
				render text: jsonData as JSON, contentType: 'text/plain'
			}
		
}
