package com.demo.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.demo.Dao.Dao;

/**
 * Servlet implementation class Applyforjob
 */
@WebServlet("/applyforjob")
public class Applyforjob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("jobid"));
		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("s_email");
		String jobdesc = request.getParameter("jobdesc");
		Date d = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		String date = sdf1.format(d);
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
		String time = sdf2.format(d);
		int i = Dao.userapplied(id, email, jobdesc, date, time);
		if (i > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("Jobappliedmessage.jsp");
			rd.include(request, response);
			RequestDispatcher rd1 = request.getRequestDispatcher("jobs.jsp");
			rd1.include(request, response);

		}

	}

}
