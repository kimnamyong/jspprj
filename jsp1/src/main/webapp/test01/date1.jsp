<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    Date today = new Date();
        
    SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
    String s1 = f1.format(today);
        
    SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String s2 = f2.format(today);

    SimpleDateFormat f3 = new SimpleDateFormat("yy-M-d H:m:s");
    String s3 = f3.format(today);
%>

<h1>날짜 출력</h1>
<div>
    <%= s1 %>
</div>
<div>
    <%= s2 %>
</div>
<div>
    <%= s3 %>
</div>

</body>
</html>