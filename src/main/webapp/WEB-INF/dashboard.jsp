<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
		<a href="/login">Login</a>
			<div class="col">
				<h3>Register</h3>
				<form:form action="/register" method="post" modelAttribute="user">
					<div class="form-group">
						<form:label path="name">Name:</form:label>
						<form:errors path="name"/>
						<form:input class="form-control" path="name"/>
					</div>
					<div class="form-group">
						<form:label path="email">Email:</form:label>
						<form:errors path="email"/>
						<form:input type="email" class="form-control" path="email"/>
					</div>
					<div class="form-group">
						<form:label path="password">Password:</form:label>
						<form:errors path="password"/>
						<form:input type="password" class="form-control" path="password"/>
					</div>
					<div class="form-group">
						<form:label path="passwordConfirm">Password Conf:</form:label>
						<form:errors path="passwordConfirm"/>
						<form:input type="password" class="form-control" path="passwordConfirm"/>
					</div>
					<input class="btn btn-primary" type="submit" value="Register"/>
				</form:form>
			</div>
		</div>
	</body>
</html>