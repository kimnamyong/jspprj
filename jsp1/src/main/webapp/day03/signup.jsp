<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String upass = request.getParameter("ps"); // form->input->name�Ӽ�
String uname = request.getParameter("name");

String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";

String sql = "INSERT INTO user(id,password,name,ts) values";
sql += "('" + uid + "', '" + upass + "', '" + uname + "',now())";

//String sql="INSERT INTO user(id,password,name,ts) values (?,?,?,now())";
//System.out.print(sql);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, "root", "1234");

Statement stmt = conn.createStatement();
//	st.setString(1, id);
//	st.setString(2, pass);
//	st.setString(3, name);
int count = stmt.executeUpdate(sql);// ������ ���ڵ� ����
if (count == 1) {
	out.print("ȸ�� ������ �Ϸ�Ǿ����ϴ�.");
} else {
	out.print("������ �߻��Ͼ����ϴ�.");
}

stmt.close();
conn.close();
%>
