<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Field Registration Form</title>
<%@include file="allcdn.jsp"%>
<script>
	function checkFields() {
		var name = document.forms["registrationForm"]["name"].value;
		var email = document.forms["registrationForm"]["email"].value;
		var password = document.forms["registrationForm"]["password"].value;
		var gender = document.forms["registrationForm"]["gender"].value;
		var city = document.forms["registrationForm"]["city"].value;

		var submitButton = document.getElementById("submitButton");
		submitButton.disabled = (name.trim() == "" || email.trim() == ""
				|| password.trim() == "" || gender.trim() == "" || city.trim() == "");
	}
</script>
</head>
<body onload="checkFields()">

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container-fluid">

		<div
			class="container vh-100 d-flex justify-content-center align-items-center">
			<div class="card shadow p-3  bg-body rounded" style="width: 600px;">
				<div class="card-header bg-primary text-white text-center">
					<h5 class="card-title mb-0">Registration</h5>
				</div>
				<div class="card-body">
					<form name="registrationForm" action="register" method="post">
						<div class="mb-2">
							<label for="name" class="form-label">Name</label> <input
								type="text" class="form-control" name="name"
								placeholder="Enter your name" required oninput="checkFields()">
							<p id="nameMsg" class="text-danger"></p>
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" name="email"
								placeholder="Enter your email" required oninput="checkFields()">
							<p id="emailMsg" class="text-danger"></p>
						</div>
						<div class="mb-2">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" name="password"
								placeholder="Enter your password" required
								oninput="checkFields()">
							<p id="passwordMsg" class="text-danger"></p>
						</div>
						<div class="mb-2">
							<label class="form-check-label">Gender</label><br> <input
								type="radio" name="gender" value="male" required> Male <input
								type="radio" name="gender" value="female" required>
							Female
							<p id="genderMsg" class="text-danger"></p>
						</div>
						<div class="mb-2">
							<label class="form-check-label">Interests</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="field1"
									value="Technology"> <label class="form-check-label"
									for="technology">Technology</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="field1"
									value="Marketing"> <label class="form-check-label"
									for="marketing">Marketing</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="field1"
									value="Finance"> <label class="form-check-label"
									for="finance">Finance</label>
							</div>
						</div>
						<div class="mb-3">
							<label for="city" class="form-label">City</label> <select
								class="form-select" name="city" required
								onchange="checkFields()">
								<option value="">Select your city</option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Banglore">Banglore</option>
								<option value="Nashik">Nashik</option>
							</select>
							<p id="cityMsg" class="text-danger"></p>
						</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-primary btn-lg"
								id="submitButton">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	      <jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>