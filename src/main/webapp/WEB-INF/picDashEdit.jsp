<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Personal Pictures</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      		<p><img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40"><c:out value="${user.name}"/></p>
    	</object>
    	
    	<table border = 1>
				<thead>
					<tr>
						<th>Name</th>
						<th>Pictures</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${allPictures}" var="picture">
			        	<tr>
			            	<td><a href="/pictures/${picture.id}"><c:out value="${picture.picName}"/></a></td>
			            	<td><img src="Photos/${picture.progressPic}" alt="${picture.picName}" width="500" height="600"></td>
			    		</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/main">Main</a>
	</body>
</html>