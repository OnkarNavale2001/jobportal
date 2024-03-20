package com.demo.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.demo.Dao.Dao;

/**
 * Servlet implementation class Registerservlet
 */
@WebServlet("/register")
public class Registerservlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String[] field = request.getParameterValues("field1");
		String city = request.getParameter("city");
		System.out.println(name);
		int i = Dao.Adddataregister(name, email, password, gender, field, city);
		if (i > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("Registersuccessfully.jsp");
			rd.include(request, response);
			RequestDispatcher rd1 = request.getRequestDispatcher("register.jsp");
			rd1.include(request, response);

		}

	}

}
