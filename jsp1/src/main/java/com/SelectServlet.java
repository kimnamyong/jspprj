package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/select")

 public class SelectServlet extends HttpServlet {		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String region=request.getParameter("region");
		String res="";
		String res1="";
		res+="<h3>내사 사는 곳은 : " + region  +"입니다.</h3>";		
	//	response.getWriter().print(res);	
		
		String[] hobby=request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++) {
			res1+="<h3>나의 "+ i+ "취미는 " + hobby[i] + "</h3>";
		}
		
		String msg=res+res1;
		
		response.getWriter().print(msg);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}
}

