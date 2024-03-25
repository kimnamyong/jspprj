package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		String uid=request.getParameter("id");
		String upw=request.getParameter("pw");
		
		String res="<h3>User ID:" + uid+"</h3>";
		 res+="<h3>User Password:" + upw+"</h3>";
		
		response.getWriter().print(res);
		
		
	}

}
