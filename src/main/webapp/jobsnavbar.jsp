<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	if (name == null || email.equals(""))
		
		response.sendRedirect("login.jsp");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome<%=name%></title>
</head>
<body>
<script type="text/javascript">
function searchJob(search)
{
 
    
    var obj;
    obj=new XMLHttpRequest();   

    
    obj.open("POST", "searchjob.jsp?position="+search, true);
    
    obj.send();
    
    obj.onreadystatechange = function()
    {
        if(obj.readyState === 4 && obj.status === 200)
        {
            document.getElementById('resp').innerHTML = obj.responseText;
        }
    };
}
	</script>
	<%@include file="allcdn.jsp"%>



	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
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
				<li class="nav-item"><a class="nav-link text-light"
					href="jobs.jsp">Jobs</a></li>
				<li class="nav-item"><a class="nav-link text-light"
					href="Profile.jsp">Home</a></li>

				<li class="nav-item"><a class="nav-link text-light"
					href="appliedjob.jsp">Applied Job</a></li>
					<input class="form-control ms-5 " style="width: 400px;"
						onkeyup="searchJob(this.value)" type="search"
						placeholder="Search" aria-label="Search" name="query">
				
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
