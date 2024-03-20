<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.demo.Admin.Job"%>
<%@page import="com.demo.Dao.Dao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Search Results</title>
    <!-- Add your CSS and JavaScript imports here -->
</head>
<body>

<%
    String position = request.getParameter("position");

    try {
        Connection conn = Dao.getconnection();
        PreparedStatement statement = conn.prepareStatement("select * from jobs where job_profile LIKE ? Limit 4");
        statement.setString(1, "%" + position + "%");
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Job job = new Job();
            job.setId(resultSet.getInt("id"));
            job.setJob_profile(resultSet.getString("job_profile"));
            job.setCompany(resultSet.getString("company"));
            job.setExperience(resultSet.getString("experience"));
            job.setSalary(resultSet.getString("salary"));
            job.setNo_of_openings(resultSet.getString("no_of_openings"));
            job.setJob_location(resultSet.getString("job_location"));
            job.setTime_venue(resultSet.getString("time_venue"));
            job.setDescription(resultSet.getString("description"));
            job.setC_email(resultSet.getString("c_email"));
            job.setC_person_name(resultSet.getString("c_person_name"));
            job.setC_person_profile(resultSet.getString("c_person_profile"));
            job.setC_phone_no(resultSet.getString("c_phone_no"));
            job.setDate1(resultSet.getString("date1"));
            job.setTime1(resultSet.getString("time1"));
            System.out.println(job.getC_email());
%>
            <div class="card p-3 bg-light mt-3 rounded">
                <div class="card-body">
                    <h5 class="card-title mb-0">
                        <i class="fas fa-user-circle me-2"></i><%= job.getJob_profile() %>
                    </h5>
                    <p class="card-text text-muted small"><%= job.getDate1() %> and <%= job.getTime1() %> AM</p>
                    <p class="card-text mb-1">
                        <i class="fas fa-building"></i> <span class="text-muted">Company: <%= job.getCompany() %></span>
                    </p>
                    <p class="card-text mb-1">
                        <i class="fas fa-briefcase"></i> <span class="text-muted">Experience: <%= job.getExperience() %></span>
                    </p>
                    <p class="card-text mb-1">
                        <i class="fas fa-file-alt"></i> <span class="text-muted">Job Description: <%= job.getDescription() %></span>
                    </p>
                    <br>
                    <a href="jobsviewfulldetails.jsp?id=<%= job.getId() %>" class="btn btn-primary"><i class="fas fa-info-circle"></i> See Details</a>
                </div>
            </div>
<%
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
%>

</body>
</html>
