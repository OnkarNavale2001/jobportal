package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.demo.Dao.Dao;
import com.demo.User.UserEducation;

/**
 * Servlet implementation class addeducationdetailss
 */
@WebServlet("/addeducation")
public class addeducationdetailss extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session =request.getSession();
        String email=(String)session.getAttribute("s_email");
        System.out.println(email);
		String school = request.getParameter("school");
		String degree = request.getParameter("degree");
		String year =request.getParameter("year");
		String grade=request.getParameter("grade");
		UserEducation e=new UserEducation(email, school, degree, grade, year);
		int i=Dao.usereducation(e);
		if(i>0)
		{
			response.sendRedirect("Profile.jsp");
		}
	}

}
