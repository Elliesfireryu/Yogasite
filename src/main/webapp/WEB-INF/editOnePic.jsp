<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit Picture</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<a href="/main">Main</a>|<a href="/pictures">Pictures</a>|<a href ="/new">Add New picture</a><!-- add in client later -->
		<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      		<p><img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40"><c:out value="${user.name}"/></p>
    	</object><c:out value="${user.name}"/>
		<p><c:out value="${picture.picName}"/></p>
		<img src="/Photos/${picture.progressPic}" alt="${picture.picName}" width="500" height="600">
		<p><a href="/update/${picture.id}">Edit</a></p> 
		<p><a href="/destroy/${picure.id}">Delete</a></p>
	</body>
</html>