import com.test.angular.Todo


class BootStrap {

    def init = { servletContext ->
		if (Todo.list().size() == 0) {
			Random r = new Random()
			int textMax = 100
			int pMax = 10
			int monMax = 12
			int dayMax = 31
			
			(1..50).each {
				Todo t = new Todo()
				t.text = r.nextInt(textMax+1)
				t.priority = r.nextInt(pMax+1)
				t.dueDate = new Date(2012 - 1900, r.nextInt(monMax+1), r.nextInt(dayMax+1))
				t.save()
			}
		}
    }
    def destroy = {
    }
}
