<%@page import="dao.UserDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");	
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps"); 
	String uname = request.getParameter("name");	
	
	UserDAO dao=new UserDAO();	
	
	if(dao.���Կ���(uid)){
		out.print("�̹� ������ ȸ���Դϴ�.<p><a href=signup.html>�ڷΰ���</a></p>");
		return ;
	}
	
	if (dao.insert(uid,upass,uname)) {
		out.print("ȸ�� ������ �Ϸ�Ǿ����ϴ�.");
	} else {
		out.print("������ �߻��Ͼ����ϴ�.");
	}			

%>
