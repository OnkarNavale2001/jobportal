<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Login</title>
<%@include file="allcdn.jsp"%>
</head>
<body>
        <jsp:include page="header.jsp"></jsp:include>

    <div class="container-fluid vh-100 d-flex justify-content-center align-items-center">
        <div class="card shadow p-3 mb-5 bg-body rounded" style="width: 400px;">
            <div class="card-header bg-primary text-white text-center">
                <h5 class="card-title mb-0">Login</h5>
            </div>
            <div class="card-body">
                <form name="loginForm" action="loginn" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label> 
                        <input type="email" class="form-control" name="email" placeholder="Enter your email" required  oninput="checkFields()" />
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label> 
                        <input type="password" class="form-control" name="password" placeholder="Enter your password" required  oninput="checkFields()"/>
                    </div>
                  
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg" id="submitButton" disabled>Login</button>
                    </div>
                </form>
            </div> 
        </div>
    </div>
          <jsp:include page="footer.jsp"></jsp:include>
    
</body>
<script type="text/javascript">
    function checkFields() {
        var email = document.forms["loginForm"]["email"].value;
        var password = document.forms["loginForm"]["password"].value;
        var submitButton = document.getElementById("submitButton");
        submitButton.disabled = (email.trim() === "" || password.trim() === "");
    }
</script>
</html>
