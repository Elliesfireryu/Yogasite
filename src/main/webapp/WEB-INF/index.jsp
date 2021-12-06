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
						<h1>Meditation</h1>
						<h3>Login</h3>
						<p>${loginError}</p>
						<form method="POST" action="/login">
							<fieldset>
								<div class="row md-3">
									<label for="inputEmail3" class="col-sm-3 col-form-label">Email:</label>
									<div class="col-sm-9">
										<input type="email" name="lemail" class="form-control" id="inputEmail3">
									</div>
								</div>
								<div class="row md-3">
									<label for="inputPassword3" class="col-sm-3 col-form-label">Password:</label>
									<div class="col-sm-9">
										<input type="password" name="lpassword" class="form-control" id="inputPassword3">
									</div>
								</div>
							</fieldset>
							<button type="submit" class="btn btn-primary">Login</button>
						</form>
						<div class="btn-group">
							<a href="/register" class="btn btn-outline-primary">Register</a>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>		
	</body>
</html>