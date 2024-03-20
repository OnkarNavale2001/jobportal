<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.demo.Dao.Dao"%>
<%@page import="com.demo.User.User"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information</title>
<%@include file="allcdn.jsp"%>
</head>
<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	if (name == null || email.equals(""))
		
		response.sendRedirect("login.jsp");
	%>
<%
    
    List<User> userList = Dao.getallrecordofuser();
    request.setAttribute("userList", userList);
%>

<body>

	<jsp:include page="adminheader.jsp"></jsp:include>
	<h2 class="text-center mt-2">User Details</h2>
    <table class="table table-striped mt-3 table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Gender</th>
                <th>Field</th>
                <th>City</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.gender}</td>
                    <td>
                     <c:forEach var="feild" items="${user.feild}">
                       <c:out value="${feild}"></c:out>
                     </c:forEach> 
                    </td>
                    <td>${user.city}</td>
                    <td><a class="btn btn-danger" href="deleteuserdetails?id=${user.id}">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
          <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>
