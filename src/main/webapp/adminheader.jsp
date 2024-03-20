<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("s_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Welcome<%=name %>></title>
</head>
<body>

	

	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="admin.jsp"> <img
				src="https://www.clipartmax.com/png/middle/32-329418_find-best-jobs-in-our-portal-job-logo.png"
				alt="Job Portal Logo" width="40" height="40"
				class="d-inline-block align-text-top me-2">Job Portal
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link text-light "
						href="Adminjobpost.jsp">Add jobs</a>
					</li>
					<li class="nav-item"><a class="nav-link text-light"
						href="admin.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link text-light"
						href="adminuserdetails.jsp">User Details </a></li>
				</ul>
			
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<h5 class="nav-link text-light">
							Welcome
							<%=name%></h5>
					</li>
					<li class="nav-item"><a class="nav-link text-light"
						href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html>
