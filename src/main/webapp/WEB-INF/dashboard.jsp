<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    <link rel="stylesheet" href="/style.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body data-new-gr-c-s-check-loaded="14.1040.0" data-gr-ext-installed="" style="background-image: url(Photos/OceanwavesBackdrop.jfif);"><span id="warning-container"><i data-reactroot=""></i></span>
    	<div class="box-page login-box-page ">
    		<div class="box">
				<div class="row">
					<div class="col"></div>
					<div class="col bg-white p-3 text-dark bg-opacity-50">
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
						<div class="btn-group">
							<a href="/login" class="btn btn-outline-primary">Login</a>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</body>
</html>