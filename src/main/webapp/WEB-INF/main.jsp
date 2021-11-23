<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Meditation</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container-md">
			<div class="btn-group">
				<a href="/pictures" class="btn btn-outline-primary">Pictures</a><a href="/logout" class="btn btn-outline-primary">Log Out</a>
			</div>
			<form action="/search">
				<input type="text" name="video"/>
				<button class="btn btn-primary">Search Videos</button>
			</form>	
			<h1>Welcome ${user.name}
				<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      				<img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40">
    			</object>
    		</h1>
    		<div class="btn-group">
				<a href="/updateUser/${user.id}" class="btn btn-outline-primary">Edit User</a>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">Video title</th>
						<th scope="col">Videos</th>
						<th scope="col">Favorites</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${allVideos}" var="video">
			        	<tr>
			            	<td scope="row"><a href="/videos/${video.id}" class="btn btn-outline-primary"><c:out value="${video.videoTitle}"/></a></td>
			            	<td><iframe width="280" height="158" src="${video.videoLink}" title="${video.videoTitle}" class="figure-img img-fluid rounded" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
			    			<td><c:out value="${video.usersWhoFaved.size()}"/></td>
			    		</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>