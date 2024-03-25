<%@page import="dao.UserDAO"%>
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

UserDAO dao=new UserDAO();

if(dao.가입여부(uid)==false){
	out.print("회원정보를 찾을 수 없습니다.");
	return;
}

if(dao.회원삭제(uid)){
	 out.print("회원탈퇴가 완료되었습니다.");
}else{
	out.print("회원탈퇴 중 오류가 발생하었습니다.");
}


%>

</body>
</html>