<%@page import="com.demo.User.Userpic"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.User.UserExperience"%>
<%@page import="com.demo.User.UserEducation"%>
<%@page import="com.demo.User.Aboutuser"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.Dao.Dao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<%@include file="allcdn.jsp"%>
<style type="text/css">
.circle {
	width: 200px;
	height: 200px;
	border-radius: 50%;
}
</style>
</head>
<body>
	<jsp:include page="Profileheader.jsp"></jsp:include>
	<%
	String name = (String) session.getAttribute("s_name");
	String email = (String) session.getAttribute("s_email");
	String gender = (String) session.getAttribute("s_gender");
	String city = (String) session.getAttribute("s_city");
	String about = (String) session.getAttribute("s_about");
	String skills = (String) session.getAttribute("s_skills");
	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	UserEducation user = null;
	String school = "", degree = "", grade = "", year = "";
	int id = 0;
	try {
		Connection con = Dao.getconnection();
		PreparedStatement ps = con.prepareStatement("select * from education where email=?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			user = new UserEducation();
			user.setId(rs.getInt("id"));
			user.setSchool(rs.getString("school"));
			user.setDegree(rs.getString("degree"));
			user.setGrade(rs.getString("grade"));
			user.setYear(rs.getString("year"));
			school = user.getSchool();
			degree = user.getDegree();
			year = user.getYear();
			grade = user.getGrade();
			id = user.getId();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	int id1 = 0;
	String email2 = "", location = "", year2 = "", description = "", job_tittle = "", company = "";
	UserExperience exp = Dao.getUserExperiencesByEmail(email);
	if (exp != null) {
		id1 = exp.getId();
		location = exp.getLocation();
		year2 = exp.getYear();
		description = exp.getDescription();
		job_tittle = exp.getJob_title();
		company = exp.getCompany();
	}
	String path2 = (String) session.getAttribute("s_pic");
	Userpic pic = Dao.getpic(email);
	int id2 = 0;
	String path = "";
	if (pic != null) {
		id2 = pic.getI();
		path = pic.getPath();
	}
	session.setAttribute("s_pic", path);
	%>

	<div class="container mt-2">
		<div class="card shadow">
			<div class="card-body">
				<div class="row">
					<div class="col-3">
						<a class="fs-5 text-end text-primary any float-end"
							href="profilepic.jsp?id=<%=id2%>"><i
							class="fas fa-pencil-alt"></i></a> <img src="images/<%=path2%>"
							class=" circle" alt="">
					</div>
					<div class="col-8">
						<div class="d-flex justify-content-between align-items-center">
							<h2 class="text-uppercase"><%=name%></h2>
							<a class="fs-5 text-end text-primary" href="editprofileabout.jsp"><i
								class="fas fa-pencil-alt"></i></a>
						</div>
						<p class="mt-1 fs-5"><%=about%></p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-tools"></i> Skills: <span class="text-dark"><%=skills%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-venus-mars"></i> Gender: <span class="text-dark"><%=gender%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-map-marker-alt"></i> City: <span
								class="text-dark"><%=city%></span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-2">
		<div class="card shadow">
			<div class="card-body">
				<div class="row">
					<div class="col-3">
						<img alt="" class="circle" src="images/educationimg.jpg">

					</div>
					<div class="col-8">
						<div class="d-flex justify-content-between align-items-center">
							<h4>Education Details</h4>
							<a class="fs-5 text-end text-primary any"
								href="addeducationdetails.jsp"><i class="fas fa-plus"></i></a> <a
								class="fs-5 text-end text-primary"
								href="editeducation.jsp?id=<%=id%>"><i
								class="fas fa-pencil-alt"></i></a> <a
								class="fs-5 text-end text-primary any"
								href="deleteeducation?id=<%=id%>"><i
								class="fas fa-trash-alt"></i></a>
						</div>
						<p class="mt-1 fs-5 text-secondary text">
							<i class="fas fa-school"></i> School: <span class="text-dark"
								id="school"><%=school%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary text">
							<i class="fas fa-graduation-cap"></i> Degree: <span
								class="text-dark" id="degree"><%=degree%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary text">
							<i class="far fa-calendar-alt"></i> Year of Passing: <span
								class="text-dark" id="year"><%=year%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary text">
							<i class="fas fa-percentage"></i> Grade: <span class="text-dark"
								id="grade"><%=grade%></span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-2">
		<div class="card shadow">
			<div class="card-body">
				<div class="row">
					<div class="col-3">
						<img alt="" class="circle" src="images/experienceimg.png">


					</div>
					<div class="col-8">
						<div class="d-flex justify-content-between align-items-center">
							<h2 class="text-uppercase">Experience detail</h2>
							<a class="fs-5 text-end text-primary" href="experiencedetail.jsp"><i
								class="fas fa-plus"></i></a> <a
								class="fs-5 text-end text-primary any"
								href="EditeExperence.jsp?id=<%=id1%>"><i
								class="fas fa-pencil-alt"></i></a> <a
								class="fs-5 text-end text-primary any"
								href="deleteall?id=<%=id1%>"><i class="fas fa-trash-alt"></i></a>
						</div>
						<p class="mt-2 fs-5 text-secondary">
							<i class="fas fa-building"></i> Company: <span class="text-dark"><%=company%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-briefcase"></i> Job Title: <span
								class="text-dark"><%=job_tittle%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-map-marker-alt"></i> Location: <span
								class="text-dark"><%=location%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="far fa-calendar-alt"></i> Year: <span class="text-dark"><%=year2%></span>
						</p>
						<p class="mt-1 fs-5 text-secondary">
							<i class="fas fa-file-alt"></i> Description: <span
								class="text-dark"><%=description%></span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
