<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allcdn.jsp"%>

</head>
<body>

	<jsp:include page="Profileheader.jsp"></jsp:include>
	<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	String gender = (String) session.getAttribute("s_gender");
	String feild = (String) session.getAttribute("s_feild");
	String city = (String) session.getAttribute("s_city");
	String about = (String) session.getAttribute("s_about");
	String skills = (String) session.getAttribute("s_skills");

	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div
		class="container  d-flex justify-content-center align-items-center">
		<div class="card shadow p-3 mb-4 mt-1 bg-body rounded" style="width: 400px">
			<div class="card-header bg-primary text-white text-center">
				<h5 class="card-title mb-0">Update Details</h5>
			</div>
			<div class="card-body">
				<form action="editprofileupdate" method="post">
					<div class="mb-2">
						<label for="name">Name:</label> <input type="text"
							class="form-control" name="name" value="<%=name%>" />
					</div>
					<div class="mb-2">
						<label for="city">City:</label> <input type="text"
							class="form-control" name="city" value="<%=city%>" />
					</div>
					<div class="mb-2 ">
						<label for="gender">Gender:</label> <input type="text"
							class="form-control" name="gender" value="<%=gender%>">
					</div>
					<div class="mb-2 ">
						<label for="skills">Skills:</label>
						<textarea class="form-control" rows="2" name="skills"><%=skills%></textarea>
					</div>
					<div class="mb-2">
						<label for="about">About:</label>
						<textarea class="form-control" rows="2" name="about"><%=about%></textarea>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary btn-lg">
							Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	      <jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
