<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Meditation and Yoga</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h1>Meditation</h1>
			<div class="row">
				<img src="Photos/BlackWomanCrossLegged.jpg" alt="Woman meditating with crossed legs" width="500" height="600">
				<div class="col-lg-4">
					<h3>Login</h3>
					<p>${loginError}</p>
					<form method="POST" action="/login">
						<div class="row md-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">Email:</label>
							<div class="col-sm-10">
								<input type="email" name="lemail" class="form-control" id="inputEmail3">
							</div>
						</div>
						<div class="row md-3">
							<label for="inputPassword3" class="col-sm-2 col-form-label">Password:</label>
							<div class="col-sm-10">
								<input type="password" name="lpassword" class="form-control" id="inputPassword3">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>
			<div class="btn-group">
				<a href="/register" class="btn btn-outline-primary">Register</a>
			</div>
		</div>
		
	</body>
</html>