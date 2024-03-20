<%@page import="com.itextpdf.text.pdf.AcroFields.Item"%>
<%@page import="com.demo.Dao.Dao"%>
<%@page import="com.demo.Admin.Job"%>
<%@page import="java.util.List"%>
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


List<Job> list = Dao.getalljob();
request.setAttribute("list", list);

%>
 
<c:forEach var="item" items="${list}">
	<div class="container mt-3 mb-3" id="resp">

			<div class="card p-3 bg-light rounded">
				<div class="card-body">
					<h5 class="card-title mb-0">
						<i class="fas fa-user-circle me-2"></i><c:out value="${item.job_profile }"></c:out>
					</h5>
					<p class="card-text text-muted small"> <c:out value="${item.date1}"></c:out> and <c:out value="${item.time1}"> </c:out> Am </p>
			
					<p class="card-text mb-1">
						<i class="fas fa-building"></i> <span class="text-muted">
							Company :<c:out value="${item.company }"></c:out> </span> 
					</p>
					<p class="card-text mb-1">
						<i class="fas fa-briefcase"></i> <span class="text-muted">
							Experience : <c:out value="${item.experience }"></c:out></span>
					</p>
					<p class="card-text mb-1">
						<i class="fas fa-file-alt"></i> <span class="text-muted">
							Job Description : <c:out value="${item.description }"></c:out></span> 
					</p>
					<br> <a href="jobsviewfulldetails.jsp?id=${item.id}" class="btn btn-primary"><i
						class="fas fa-info-circle"></i> See Details</a>
				</div>
			</div>
		</div>
	</div>


</c:forEach>

      <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>