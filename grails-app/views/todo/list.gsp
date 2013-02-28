<form class="form-search">
	<div class="input-append">
		<input type="text" ng-model="query" class="input-medium search-query" placeholder="Search" />
		<button ng-click="reset()" type="submit" class="btn" ng-disabled="!query"><i class="icon-search"></i></button>
	</div>
	<button ng-click="query=''; reset()" ng-disabled="!query" type="submit" class="btn">Reset</button>
</form>
<table class="table table-striped table-condensed table-hover">
	<thead>
		<th>
			<a ng-click="sort('text')">Todo</a>
			<span ng-show="sortBy=='text' && sortOrder=='asc'"><i class="icon-arrow-up"></i></span>
			<span ng-show="sortBy=='text' && sortOrder=='desc'"><i class="icon-arrow-down"></i></span>
		</th>
		<th>
			<a ng-click="sort('priority')">Priority</a>
			<span ng-show="sortBy=='priority' && sortOrder=='asc'"><i class="icon-arrow-up"></i></span>
			<span ng-show="sortBy=='priority' && sortOrder=='desc'"><i class="icon-arrow-down"></i></span>
		</th>
		<th>
			<a ng-click="sort('dueDate')">Due Date</a>
			<span ng-show="sortBy=='dueDate' && sortOrder=='asc'"><i class="icon-arrow-up"></i></span>
			<span ng-show="sortBy=='dueDate' && sortOrder=='desc'"><i class="icon-arrow-down"></i></span>
		</th>
	</thead>
	<tbody>
		<tr ng-repeat="todo in todos">
			<td>{{todo.text}}</td>
			<td>{{todo.priority}}</td>
			<td>{{todo.dueDate | date:'mediumDate' }}</td>
		</tr>
	</tbody>
</table>
<div class="well" style="text-align: center;" ng-show="more">
	<a ng-click="showMore()" id="showMoreBtn">More</a>
</div>
<script type="text/javascript">  
$(window).scroll(function(){  
	if  ($(window).scrollTop() == $(document).height() - $(window).height()){
		$("#showMoreBtn").click();
	}  
});   
</script>