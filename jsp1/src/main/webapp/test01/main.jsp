<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp"  %>

<h2> 메인 페이지 입니다.</h2>

<%@ include file="footer.jsp"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<c:out value="JSTL 태그 라이브러리입니다" />
<%= "jstl 태그 라이브러입니다." %>
<br>

<c:forEach var="k" begin="1" end="5" step="1">
  <c:out value="${k}" />
</c:forEach>
<br>
<%
   for(int i=1;i<5;i++){
	   out.println("Java Server " + i+ "<br>");
   }
%>
<%
out.print("<h1>안녕 JSP</h1>");
%>

<% 
    for (int i=8; i <= 30; i+=2) {
        out.println("<div style='font-size: " + i + "pt;'>");  
        out.println("    안녕 JSP! " + i + "pt");
        out.println("</div>");
    }
%>


<c:forEach var="i" begin="8" end="20" step="2">
  <div style='font-size:${i}pt;'>
   안녕 JSP! ${i} pt"
  </div>
</c:forEach>

<%
    String s1 = "hello world";
    String s2 = " JSP!";
%>

<table>
    <tr>
        <td><% out.print(s1); %></td>
        <td><%= s1 %></td>
    </tr>
    <tr>
        <td><% out.print(s1.toUpperCase()); %></td>
        <td><%= s1.toUpperCase() %></td>
    </tr>
    <tr>
        <td><% out.print(Math.PI); %></td>
        <td><%= Math.PI %></td>
    </tr>
    <tr>
        <td><% out.print(s1 + s2); %></td>
        <td><%= s1 + s2 %></td>
    </tr>
</table>









</body>
</html>