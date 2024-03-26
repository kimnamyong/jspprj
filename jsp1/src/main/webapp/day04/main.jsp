<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ConnectionPool"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>DAO를 사용하지 않은 경우</h3>
<%
String sql = "SELECT * FROM feed ORDER BY ts DESC";

Connection conn = ConnectionPool.get();

PreparedStatement stmt = conn.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();

String str = "<table align=center>";
str += "<tr><th colspan=4>작성글 리스트</th></tr>";
while (rs.next()) {
	str += "<tr><td colspan=2><hr></td></tr>";
	str += "<tr>";
	str += "<td><small>" + rs.getString("id") + "</small></td>";
	str += "<td><small>" + rs.getString("ts") + "</small></td>";
	str += "</tr>";
	str += "<tr><td colspan=2>" + rs.getString("content") + "</td>";
	str += "</tr>";
}
str += "</table>";
out.print(str);
rs.close();
stmt.close();
conn.close();
%>
