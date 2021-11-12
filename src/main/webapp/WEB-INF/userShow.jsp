<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit User</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<a href="/main">Main</a>|<a href="/pictures">Pictures</a><!-- add in client later -->
		<p><c:out value="${user.name}"/></p>		
		<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      		<p><img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40"><c:out value="${user.name}"/></p>
    	</object>
		<p><c:out value="${user.email}"/></p>
		<p><c:out value="${user.password}"/></p>
		<p><a href="/updateUser/${user.id}">Edit User</a></p> 
		<p><a href="/destroyUser/${user.id}">Delete User</a></p>
	</body>
</html>