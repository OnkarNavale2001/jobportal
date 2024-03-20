<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="allcdn.jsp"%>
<body>
<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	if (name == null || email.equals(""))
		
		response.sendRedirect("login.jsp");
	%>
	<jsp:include page="adminheader.jsp"></jsp:include>

	<div class="container d-flex justify-content-center align-items-center">
		<div class="card shadow p-3 mb-5 bg-body rounded"
			style="width: 400px;">
			<div class="card-header bg-primary text-white text-center">
				<h5 class="card-title mb-0">Add Jobs</h5>
			</div>
			<div class="card-body">
				<form action="Adminpost" method="post">
					<div class="mb-2">
						<label for="jobProfile" class="form-label">Job Profile</label> <input
							type="text" class="form-control" name="jobProfile">
					</div>
					<div class="mb-2">
						<label for="company" class="form-label">Company</label> <input
							type="text" class="form-control" name="company">
					</div>
					<div class="mb-2">
						<label for="experience" class="form-label">Experience</label> <input
							type="text" class="form-control" name="experience">
					</div>
					<div class="mb-2">
						<label for="salary" class="form-label">Salary</label> <input
							type="text" class="form-control" name="salary">
					</div>
					<div class="mb-2">
						<label for="openings" class="form-label">Number of
							Openings</label> <input type="text" class="form-control" name="openings">
					</div>
					<div class="mb-2">
						<label for="location" class="form-label">Job Location</label> <input
							type="text" class="form-control" name="location">
					</div>
					<div class="mb-2">
						<label for="timeVenue" class="form-label">Time Venue</label> <input
							type="text" class="form-control" name="timeVenue">
					</div>
					<div class="mb-2">
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" name="description" rows="3"></textarea>
					</div>
					<div class="mb-2">
						<label for="cEmail" class="form-label">Contact Email</label> <input
							type="email" class="form-control" name="cEmail">
					</div>
					<div class="mb-2">
						<label for="cPersonName" class="form-label">Contact Person
							Name</label> <input type="text" class="form-control" name="cPersonName">
					</div>
					<div class="mb-2">
						<label for="cPersonProfile" class="form-label">Contact
							Person Profile</label> <input type="text" class="form-control"
							name="cPersonProfile">
					</div>
					<div class="mb-2">
						<label for="cPhoneNo" class="form-label">Contact Phone
							Number</label> <input type="tel" class="form-control" name="cPhoneNo">
					</div>
					<div class="mb-2">
						<label for="date" class="form-label">Date</label> <input
							type="date" class="form-control" name="date">
					</div>
					<div class="mb-2">
						<label for="time" class="form-label">Time</label> <input
							type="time" class="form-control" name="time">
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary ">Submit</button>

					</div>

				</form>

			</div>
		</div>
	</div>
      <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>