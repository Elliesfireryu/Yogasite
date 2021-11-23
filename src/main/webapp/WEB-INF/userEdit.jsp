<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>${user.name} Edit</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<a href="/main">Main</a>
		<form:form action="/updateUser/${user.id}" method="POST" modelAttribute="user">
			<p>
				<form:label path="name">UserName:</form:label>
				<form:errors path="name"/>
				<form:input path="name"/>
			</p>
			<p>
				<form:label path="profilePic">Profile Pictures:</form:label>
				<form:errors path="profilePic"/>
				<form:input path="profilePic"/>
			</p>
			<p>
				<form:label path="email">Email:</form:label>
				<form:errors path="email"/>
				<form:input path="email"/>
			</p>
			<p>
				<form:label path="password">Password:</form:label>
				<form:errors path="password"/>
				<form:input path="password"/>
			</p>
			<p>
				<form:label path="passwordConfirm">Password Confirm:</form:label>
				<form:errors path="passwordConfirm"/>
				<form:input path="passwordConfirm"/>
			</p>
			<button>Submit</button>
		</form:form>
		<p><a href="/destroyUser/${user.id}">Delete</a></p>
	</body>
</html>