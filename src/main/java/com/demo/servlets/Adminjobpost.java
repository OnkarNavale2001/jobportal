package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.demo.Admin.Job;
import com.demo.Dao.Dao;

/**
 * Servlet implementation class Adminjobpost
 */
@WebServlet("/Adminpost")
public class Adminjobpost extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jobProfile = request.getParameter("jobProfile");
		String company = request.getParameter("company");
		String experience = request.getParameter("experience");
		String salary = request.getParameter("salary");
		String noOfOpenings = request.getParameter("openings");
		String jobLocation = request.getParameter("location");
		String timeVenue = request.getParameter("timeVenue");
		String description = request.getParameter("description");
		String contactEmail = request.getParameter("cEmail");
		String contactPersonName = request.getParameter("cPersonName");
		String contactPersonProfile = request.getParameter("cPersonProfile");
		String contactPhoneNo = request.getParameter("cPhoneNo");
		String date = request.getParameter("date");
		String time = request.getParameter("time");

		Job j = new Job(contactPersonProfile, company, experience, salary, noOfOpenings, jobLocation, time, description,
				contactEmail, contactPersonProfile, jobProfile, contactPhoneNo, date, time);

		int i = Dao.insertJob(j);
		if (i > 0)
			response.sendRedirect("admin.jsp");

	}

}
