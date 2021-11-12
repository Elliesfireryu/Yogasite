<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Meditation</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
				<a href="/pictures">Pictures</a>|<a href="/logout">Log Out</a>
			<form action="/search">
				<input type="text" name="video"/>
				<button class="btn btn-primary">Search Videos</button>
			</form>	
			<h1>Welcome ${user.name}
				<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      				<img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40">
    			</object>
    		</h1><a href="/updateUser/${user.id}">Edit User</a>
			<table border = 1>
				<thead>
					<tr>
						<th>Video title</th>
						<th>Videos</th>
						<th>Favorites</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${allVideos}" var="video">
			        	<tr>
			            	<td><a href="/videos/${video.id}"><c:out value="${video.videoTitle}"/></a></td>
			            	<td><iframe width="280" height="158" src="${video.videoLink}" title="${video.videoTitle}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			    			<td><c:out value="${video.usersWhoFaved.size()}"/></td>
			    		</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>