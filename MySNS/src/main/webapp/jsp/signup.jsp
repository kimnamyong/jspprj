<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String jsonstr = request.getParameter("jsonstr");

//String upass = request.getParameter("ps");
//String uname = request.getParameter("name");

UserDAO dao = new UserDAO();
if (dao.exists(uid)) {	
	out.print("EX");
	return;
}

if (dao.insert2(uid, jsonstr)) {	
	out.print("OK");	
	session.setAttribute("id", uid);
	response.sendRedirect("main.jsp");
} else {
	  out.print("ER");		
}
%>