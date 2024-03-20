package com.demo.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.desktop.AboutEvent;
import java.io.IOException;
import java.io.PrintWriter;

import com.demo.Dao.Dao;
import com.demo.User.Aboutuser;
import com.demo.User.User;

@WebServlet("/loginn")
public class loginpage extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("rememberme");
		HttpSession session = request.getSession();
		User user = Dao.logindetail(email, password);
		Aboutuser u = Dao.About(email);

		if (email.equals("admin@gmail.com") && password.equals("admin@123")) {
			session.setAttribute("s_name", "admin");

			session.setAttribute("s_email", "admin@gmail.com");
			response.sendRedirect("admin.jsp");

		}

		else if (user != null) {
			session.setAttribute("s_name", user.getName());
			session.setAttribute("s_email", user.getEmail());
			session.setAttribute("s_gender", user.getGender());
			session.setAttribute("s_field", user.getFeild());
			session.setAttribute("s_city", user.getCity());
			session.setAttribute("s_skills", u.getSkills());
			session.setAttribute("s_about", u.getAbout());

			response.sendRedirect("Profile.jsp");
		} else {

			RequestDispatcher rd1 = request.getRequestDispatcher("loginerror.jsp");
			rd1.include(request, response);
			RequestDispatcher rd2 = request.getRequestDispatcher("login.jsp");
			rd2.include(request, response);

		}
	}
}
