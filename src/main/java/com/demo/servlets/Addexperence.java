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

@WebServlet("/Addexperience")
public class Addexperence extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("s_email");

		String company = request.getParameter("company");
		String location = request.getParameter("location");
		String year = request.getParameter("year");
		String jobTitle = request.getParameter("job_title");
		String description = request.getParameter("description");
		UserExperience exp = new UserExperience(email, location, company, description, jobTitle, year);
		int i = Dao.adduserexper(exp);
		if (i > 0)
			response.sendRedirect("Profile.jsp");

	}

}
