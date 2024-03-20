package com.demo.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.demo.Dao.Dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/updatepic")
@MultipartConfig
public class updateprofilepic extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		Part p = req.getPart("files");
		PrintWriter out = resp.getWriter();
		String fileName = p.getSubmittedFileName();
		HttpSession session = req.getSession();

		session.setAttribute("s_pic", fileName);
		int i = Dao.update(id, fileName);
		try {
			if (i > 0) {
				String path = getServletContext().getRealPath("") + "images";

				File file = new File(path);

				p.write(path + File.separator + fileName);

				resp.sendRedirect("Profile.jsp");
			}
		} catch (Exception e) {
			out.print("not update");
		}
		
		
	}

}
