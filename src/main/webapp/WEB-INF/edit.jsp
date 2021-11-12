<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Picture edit</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<a href="/main">Main</a>
		<form:form action="/update/${picture.id}" method="POST" modelAttribute="picture">
			<p>
				<form:label path="picName">Picture:</form:label>
				<form:errors path="picName"/>
				<form:input path="picName"/>
			</p>
			<p>
				<form:label path="progressPic">Progress Picture file:</form:label>
				<form:errors path="progressPic"/>
				<form:input path="progressPic"/>
			</p>
			<button>Submit</button>
		</form:form>
	</body>
</html>