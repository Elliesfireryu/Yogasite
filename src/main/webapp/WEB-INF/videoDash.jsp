<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Video Dashboard</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<a href="/main">Main</a>
		<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      		<p><img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40"><c:out value="${user.name}"/></p>
    	</object>
      	<p><c:out value="${video.videoTitle}"/></p>
      	<iframe width="1008" height="567" src="${video.videoLink}" title="${video.videoTitle}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      	<form action="/videos/${video.id}/like">
      		<c:out value="${video.usersWhoFaved.size()}"/>
			<button class="btn btn-primary">Favorite</button>
		</form>
		<form action="/videos/${video.id}/unlike">
			<button class="btn btn-primary">UnFavorite</button>
		</form>
      	<form action="/videos/${video.id}/comments">
      		<input type="text" name="comments"/>
			<button class="btn btn-primary">Comment</button>
		</form>

		<c:forEach items="${allComments}" var="comment">
	    	<c:out value="${comment.userComments}"/>
	        <c:out value="${comment.user}"/>
		</c:forEach>
	</body>
</html>