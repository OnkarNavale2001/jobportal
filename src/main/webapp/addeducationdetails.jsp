<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <%@include file="allcdn.jsp" %>
<body>
<jsp:include page="Profileheader.jsp"></jsp:include>
<div

		class="container  d-flex justify-content-center vh-100 align-items-center">
		<div class="card shadow p-3 mb-4 mt-1 bg-body rounded" style="width: 400px">
			<div class="card-header bg-primary text-white text-center">
				<h5 class="card-title mb-0">Education Details</h5>
			</div>
			<div class="card-body">
				<form action="addeducation" method="post">
					<div class="mb-2">
						<label for="name">School Name:</label> <input type="text"
							class="form-control" name="school"  />
					</div>
					<div class="mb-2">
						<label for="city">Degree:</label> <input type="text"
							class="form-control" name="degree"  />
					</div>
					<div class="mb-2 ">
						<label for="gender">Grade:</label> <input type="text"
							class="form-control" name="grade" ">
					</div>
					<div class="mb-2 ">
						<label for="gender">Year:</label> <input type="text"
							class="form-control" name="year" >
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-primary btn-lg">
							Add Details</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	      <jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>