<%@page import="com.demo.Dao.Dao"%>
<%@page import="com.demo.User.Appliedjob"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="allcdn.jsp"%>

<body>
	<%
	List<Appliedjob> j = Dao.getApplied();

	int count =j.size();   
	
	request.setAttribute("item", j);
	%>
	
	    <jsp:include page="Profileheader.jsp"></jsp:include>
	
	<c:forEach items="${item}" var="item">
		<div class="container mt-3">
			<div class="row">
				<div class="col">
					<div class="card bg-light">
						<div class="card-body">
				<a class="text-danger"  href="applieddelete?id=${item.id}"><i class="fa-solid fa-trash float-end"></i></a>		
							<p class="card-text"> 
						             
								<i class="fas fa-file-alt"></i> Job Description:<span> <c:out
										value="${item.description}" />
								</span>
							</p>

							<p class="card-text">
								<i class="fas fa-envelope"></i> <span> <c:out
										value="${item.email}" />
								</span>
							</p>
							
							<p class="card-text">
								<i class="fas fa-calendar-alt"></i> Date: <span> <c:out
										value="${item.date}" />
								</span>
							</p>
							<p class="card-text">
								<i class="fas fa-clock"></i> Time:
								 <span> <c:out
										value="${item.time}" />
								</span>
							</p>
							<a class="btn btn-primary" href="jobsviewfulldetails.jsp?id=${item.jobid}">
								
								 <span > 
								 See detail view 
								</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>