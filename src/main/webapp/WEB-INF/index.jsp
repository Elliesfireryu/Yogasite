<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Meditation and Yoga</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h1>Meditation</h1>
			<img src="Photos/BlackWomanCrossLegged.jpg" alt="Woman meditating with crossed legs" width="500" height="600">
			<div class="row">
				<div class="col">
					<h3>Login</h3>
					<p>${loginError}</p>
					<form method="POST" action="/login">
						<div class="form-group">
							<label>Email:</label>
							<input type="email" name="lemail">
						</div>
						<div class="form-group">
							<label>Password:</label>
							<input type="password" name="lpassword">
						</div>
						<button>Login</button>
					</form>
				</div>
			</div>
		</div>
		<a href="/main">Main</a>||<a href="/register">Register</a>
	</body>
</html>