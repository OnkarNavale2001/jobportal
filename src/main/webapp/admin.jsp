<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.demo.Admin.Job"%>
<%@ page import="com.demo.Dao.Dao"%>
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
	<div class="container-fluid ">
		<h1 class="mt-5 mb-4 text-center">Job List</h1>
		<div class="table-responsive">
		<table class="table table-responsive table-striped table-bordered ">
			<thead>
				<tr>
					<th>ID</th>
					<th>Job Profile</th>
					<th>Company</th>
					<th>Experience</th>
					<th>Salary</th>
					<th>Number of Openings</th>
					<th>Job Location</th>
					<th>Time Venue</th>
					<th>Description</th>
					<th>Contact Email</th>
					<th>Contact Person Name</th>
					<th>Contact Person Profile</th>
					<th>Contact Phone Number</th>
					<th>Date</th>
					<th>Time</th>
					<th>Delete</th>

				</tr>
			</thead>
			<tbody>
				<%
				List<Job> list = Dao.getalljob();
				for (Job job : list) {
				%>
				<tr>
					<td><%=job.getId()%></td>
					<td><%=job.getJob_profile()%></td>
					<td><%=job.getCompany()%></td>
					<td><%=job.getExperience()%></td>
					<td><%=job.getSalary()%></td>
					<td><%=job.getNo_of_openings()%></td>
					<td><%=job.getJob_location()%></td>
					<td><%=job.getTime_venue()%></td>
					<td><%=job.getDescription()%></td>
					<td><%=job.getC_email()%></td>
					<td><%=job.getC_person_name()%></td>
					<td><%=job.getC_person_profile()%></td>
					<td><%=job.getC_phone_no()%></td>
					<td><%=job.getDate1()%></td>
					<td><%=job.getTime1()%></td>
					<td><a class="btn btn-danger"
						href="deletejob.jsp?id=<%=job.getId()%>">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		</div>
	</div>
      <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>