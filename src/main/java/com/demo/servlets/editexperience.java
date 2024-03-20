package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.demo.Dao.Dao;
import com.demo.User.UserExperience;

@WebServlet("/editexp")
public class editexperience extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("s_email");
		System.out.println(email + "dDdddddddd");
		String company = request.getParameter("company");

		String location = request.getParameter("location");
		String year = request.getParameter("year");
		String jobTitle = request.getParameter("job_title");
		String description = request.getParameter("description");
		UserExperience u = new UserExperience();
		u.setEmail(email);
		u.setCompany(company);
		u.setDescription(description);

		u.setJob_title(jobTitle);
		u.setYear(year);
		u.setLocation(location);
		int i = Dao.updateUserExperience(u);
		if (i > 0) {
			response.sendRedirect("Profile.jsp");
		}
	}

}
