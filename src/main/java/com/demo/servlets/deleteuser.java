package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.demo.Dao.Dao;

/**
 * Servlet implementation class deleteuser
 */
@WebServlet("/deleteuserdetails")
public class deleteuser extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id=Integer.parseInt(request.getParameter("id"));
		 int i=Dao.deleteuserdetails(id);
		 if(i>0)
			 response.sendRedirect("adminuserdetails.jsp");;
	}

	
}
