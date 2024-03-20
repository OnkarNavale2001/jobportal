package com.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.demo.Dao.Dao;

@WebServlet("/deleteall")
public class Deletecode extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   int id1=Integer.parseInt(request.getParameter("id"));
	   int i2=Dao.deleteexperence(id1);
	   
	   if(i2>0)
	   {
		   response.sendRedirect("Profile.jsp");
	   }
	   
	   
	}

}
