<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2> 오늘 날짜및 시간-second</h2>
<% request.setCharacterEncoding("utf-8"); %>

<p>
  <%= (new java.util.Date()).toLocaleString() %>
</p>
<p>
아이디:<%= request.getParameter("id") %>
</p>
<p>
이름:<%= request.getParameter("name") %>
</p>
<%
 String address = request.getParameter("address");
%>

<p>
주소:<%=java.net.URLDecoder.decode(address)%>
</p>

<%
 String title = request.getParameter("title");
%>

<h3>
<%=java.net.URLDecoder.decode(title) %>
</h3>
Today is : <%= request.getParameter("date") %>








</body>
</html>