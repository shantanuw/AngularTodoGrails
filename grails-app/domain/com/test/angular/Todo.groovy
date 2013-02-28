package com.test.angular

class Todo {
	
	String text
	Date dueDate
	Integer priority

    static constraints = {
		dueDate (nullable: true)
    }
}
