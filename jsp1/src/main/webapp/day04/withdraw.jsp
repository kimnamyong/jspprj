<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("id");
String sql = "DELETE FROM user WHERE id=?";

// JDBC - 데이터베이스 연결
String url="jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
String dbID="root";
String dbPW="1234";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, dbID, dbPW);

// 쿼리실행
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, uid);
int count = stmt.executeUpdate();

if (count == 1) {
    out.print("회원탈퇴가 완료되었습니다.");
  } else {
   out.print("회원탈퇴 중 오류가 발생하었습니다.");
 }

 stmt.close();
 conn.close();

%>

</body>
</html>