<%@page import="com.demo.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
 int id=Integer.parseInt(request.getParameter("id"))  ;
 int i=  Dao.deletejobs(id);
   if(i>0)
	   response.sendRedirect("admin.jsp");
   
   
   
   %>
</body>
</html>