<%@page import="dao.ConnectionPool"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%

String sql = "select * from user";

 Connection con=ConnectionPool.get();

Statement st = con.createStatement();
ResultSet rs = st.executeQuery(sql);

String str = "<table align=center>";
str += "<tr><th colspan=3>������ ����Ʈ</th></tr>";
while(rs.next()) {
    str += "<tr><td colspan=3><hr></td></tr>";
    str += "<tr>";
    str += "<td>" + rs.getString("id") + "</td>";
    str += "<td>" + rs.getString("name") + "</td>";
    str += "<td>&nbsp;(" + rs.getString("ts") + ")</td>";
    str += "</tr>";
}
str += "</table>";
out.print(str);

rs.close();
st.close();
con.close();
%>
