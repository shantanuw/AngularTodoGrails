var TodoApp = angular.module("TodoApp", ["ngResource"]).
	config(function($routeProvider) {
		$routeProvider.
			when("/", {controller: ListCtrl, templateUrl: 'todo/list'}).
			otherwise ({redirectTo: '/'});
	});

TodoApp.factory('Todo', function($resource) {
	return $resource('api/todo/:id', {id: '@id'}, {update: {method: 'PUT'}});
});

var ListCtrl = function($scope, $location, Todo) {
	$scope.search = function() {
		Todo.query({
			q: $scope.query,
			sort : $scope.sortBy,
			order : $scope.sortOrder,
			offset : $scope.offset,
			max : $scope.maxResults
		}, function(data) {
			$scope.more = data.length === $scope.maxResults;
			$scope.todos = $scope.todos.concat(data);
		});
	};
	
	$scope.sort = function(col) {
		if ($scope.sortBy === col) {
			$scope.sortOrder = $scope.sortOrder === 'desc' ? 'asc' : 'desc';
		}
		else {
			$scope.sortBy = col;
			$scope.sortOrder = 'desc';
		}
		$scope.reset();
	};
	
	$scope.showMore = function() {
		$scope.offset += $scope.maxResults;
		$scope.search();
	};
	
	$scope.reset = function() {
		$scope.maxResults = 20;
		$scope.offset = 0;
		$scope.todos = [];
		$scope.search();
	}
	$scope.sortBy = 'priority';
	$scope.sortOrder = 'asc';

	$scope.reset();
}