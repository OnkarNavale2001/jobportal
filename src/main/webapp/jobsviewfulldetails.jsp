<%@page import="com.demo.Dao.Dao"%>
<%@page import="com.demo.Admin.Job"%>
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
	int id = Integer.parseInt(request.getParameter("id"));
	Job j = Dao.getalljobone(id);
	boolean hasApplied = false;
	%>
	<div class="container mb-5" style="margin-top: 50px;">
		<div class="row ">
			<div class="col-md-6 offset-md-3">
				<div class="card bg-light">
					<div class="card-body ">

						<ul class="list-group  list-group-flush">
							<li class="list-group-item bg-light"><i
								class="fas fa-briefcase"></i> <b>Job Profile:</b><%=j.getJob_profile()%>
								(<%=j.getDate1()%> and <%=j.getTime1()%>Am)</li>
							<li class="list-group-item bg-light"><i
								class="fas fa-building"></i> <b>Company:</b><%=j.getCompany()%></li>
							<li class="list-group-item bg-light"><i
								class="fas fa-user-tie"></i> <b>Experience:</b><%=j.getExperience()%>
							</li>
							<li class="list-group-item bg-light"><i
								class="fas fa-file-alt"></i> <b>Job Description:</b> <%=j.getDescription()%></li>
							<li class="list-group-item bg-light"><i
								class="fa-solid fa-indian-rupee-sign"></i> <b>Salary:</b> <%=j.getSalary()%></li>
							<li class="list-group-item bg-light"><i class="fas fa-users"></i>
								<b>No. Of Openings:</b><%=j.getNo_of_openings()%></li>
							<li class="list-group-item bg-light"><i
								class="fas fa-map-marker-alt"></i> <b>Job Location:</b><%=j.getJob_location()%></li>

							<li class="list-group-item bg-light"><i
								class="far fa-clock"></i> <b>Time / Venue:</b><%=j.getTime_venue()%></li>

							<li class="list-group-item bg-light"><i class="fas fa-user"></i>
								<b>Person Name:</b><%=j.getC_person_name()%> ( <%=j.getC_person_profile()%>)</li>
							<li class="list-group-item bg-light"><i
								class="fas fa-phone-alt"></i> <b>Phone No.:</b> <%=j.getC_phone_no()%></li>
							<form action="applyforjob" method="post">
								<input type="hidden" value="<%=id%>" name="jobid" /> <input
									type="hidden" value="<%=j.getJob_profile()%>" name="jobdesc" />
								<div class="d-flex justify-content-center">
								<input type="submit" value="Apply Now" class="btn btn-primary mt-2 mb-2" />
								</div>
							</form>

						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>