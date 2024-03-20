package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.demo.Dao.Dao;

/**
 * Servlet implementation class Editprofileaboutt
 */
@WebServlet("/editprofileupdate")
public class Editprofileaboutt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("s_email");
		String name = request.getParameter("name");

		String city = request.getParameter("city");
		String gender = request.getParameter("gender");
		String skills = request.getParameter("skills");
		String about = request.getParameter("about");
		int i = Dao.updateregister(name, email, city, gender, about, skills);
		session.setAttribute("s_skills", skills);
		session.setAttribute("s_about", about);
		if (i > 0) {
			response.sendRedirect("Profile.jsp");
		}

	}

}
