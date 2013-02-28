package com.test.angular

import grails.converters.JSON

class TodoController {

	def private retrieve() {
		render Todo.list() as JSON
	}
	
	def show() {
		if (params.id && Todo.exists(params.id)) {
			render Todo.get(params.id) as JSON
		}
		else {
			println params
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			params.offset = Math.min(params.offset ? params.int('offset') : 0, 100)
			
			//def ls = Todo.executeQuery("from Todo a",[max: params.max, offset: params.offset])
			
			render Todo.findAll(params) as JSON
		}
	}
	
	def list() {}
}
