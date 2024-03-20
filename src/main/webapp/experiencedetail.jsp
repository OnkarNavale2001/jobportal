<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <%@include file="allcdn.jsp" %>

</head>
<body>
<jsp:include page="Profileheader.jsp"></jsp:include>
	<div
		class="container vh-100 d-flex justify-content-center align-items-center">
		<div class="card shadow p-3 bg-body rounded" style="width: 600px;">
			<div class="card-header bg-primary text-white text-center">
				<h5 class="card-title mb-0">Add Experience</h5>
			</div>
			<div class="card-body">
				<form  action="Addexperience"  method="post">
					<div class="mb-2">
						<label for="company" class="form-label">Company</label> <input
							type="text" class="form-control" name="company"
							placeholder="Enter your company">
					</div>
					<div class="mb-2">
						<label for="location" class="form-label">Location</label> <input
							type="text" class="form-control" name="location"
							placeholder="Enter your location">
					</div>
					<div class="mb-2">
						<label for="year" class="form-label">Year</label> <input
							type="text" class="form-control" name="year"
							placeholder="Enter the year">
					</div>
					<div class="mb-2">
						<label for="job_title" class="form-label">Job Title</label> <input
							type="text" class="form-control" name="job_title"
							placeholder="Enter your job title">
					</div>
					<div class="mb-2">
						<label for="description" class="form-label">Description</label>
						<textarea class="form-control" name="description"
							placeholder="Enter a description"></textarea>
					</div>

					<div class="d-grid">
						<button type="submit" class="btn btn-primary btn-lg"
							>Add Experience</button>
					</div>
				</form>
			</div>
		</div>
	</div>
      <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>