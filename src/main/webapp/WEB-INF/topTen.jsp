<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Top 10</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	    <link rel="stylesheet" href="/style.css">
	    <script src="/webjars/jquery/jquery.min.js"></script>
	    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body data-new-gr-c-s-check-loaded="14.1040.0" data-gr-ext-installed="" style="background-image: url(Photos/OceanwavesBackdrop.jfif);"><span id="warning-container"><i data-reactroot=""></i></span>
		<nav class="navbar navbar-expand-xl navbar-light" style="background-color: #e3f2fd;">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/userShow/${user.id}">Welcome ${user.name}! 
		    	<object data="/Photos/${user.profilePic}" type="image/png" width="40" height="40">
      				<img src="/Photos/buddhistIcon.jpg" alt="${user.name} profile picture" width="40" height="40">
    			</object>
    		</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarLight" aria-controls="navbarLight" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse show" id="navbarLight">
		      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="/main">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/pictures">Pictures</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/topTen">Top 10 Videos</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/logout">Log Out</a>
		        </li>
		      </ul>
		      <form class="d-flex" action="/search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="video">
		        <button class="btn btn-outline-primary" type="submit">Search Videos</button>
		      </form>
		    </div>
		  </div>
		</nav>
		
		<div class="container-md">
			<h1 class="col bg-white p-3 text-dark bg-opacity-50">Top 10 Videos</h1>
			<table class="table table-hover col bg-white p-3 text-dark bg-opacity-50">
				<thead>
					<tr>
						<th scope="col">Video Title</th>
						<th scope="col">Videos</th>
						<th scope="col">Favorites</th>
					</tr>
				</thead>
				<c:forEach items="${allVideos}" var="video">
					<tbody>
						<tr>
							<td><a class="btn btn-light" href="/videos/${video.id}"><c:out value="${video.videoTitle}"/></a></td>
							<td><iframe width="280" height="158" src="${video.videoLink}" title="${video.videoTitle}" class="figure-img img-fluid rounded" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></td>
							<td><c:out value="${video.usersWhoFaved.size()}"/></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	
		<nav class="navbar fixed-bottom navbar-light bg-light">
 			<div class="container-fluid">
   				<a class="navbar-brand" href="/about"> Created by: Jenelle Hanson</a>
 			</div>
		</nav>
	</body>
</html>