<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String upass = request.getParameter("ps"); // form->input->name�Ӽ�
	String uname = request.getParameter("name");
	
	String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	
	String sql = "INSERT INTO user(id,password,name,ts) values (?,?,?,now())";	
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	psmt.setString(2, upass);
	psmt.setString(3, uname);
	
	int count = psmt.executeUpdate();// ������ ���ڵ� ����
	
	if (count == 1) {
		out.print("ȸ�� ������ �Ϸ�Ǿ����ϴ�.");
	} else {
		out.print("������ �߻��Ͼ����ϴ�.");
	}
	
	psmt.close();
	conn.close();
%>
