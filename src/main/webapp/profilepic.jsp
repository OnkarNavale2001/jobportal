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
<%

String path=(String)session.getAttribute("s_pic");
int id=Integer.parseInt(request.getParameter("id"));




%>
<div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <img src="images/<%=path%>" class="img-fluid rounded-circle" alt="Profile Picture">
                                </div>
                                <div class="col-md-8">
                                    <h2>Edit Profile Pic</h2>
                                    <form action="updatepic" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="<%=id%>">
                                        <p><strong>name </p>
                                        <div class="mb-3">
                                            <input type="file" name="files" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <input type="submit" value="Update Profile Pic" class="btn btn-danger">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>