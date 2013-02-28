<!DOCTYPE html>
<html ng-app="TodoApp">
	<head>
		<title>Todo Angular App</title>
		<r:require modules="bootstrap, angular, todo"/>
		<r:layoutResources/>
	</head>
	<body>
		<div class="container" style="margin: 20px auto">
			<div ng-view></div>
		</div>
		<r:layoutResources />
	</body>
</html>
