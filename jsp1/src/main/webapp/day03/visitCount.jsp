<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String cnt= (String) application.getAttribute("counter");

int count=(cnt==null) ? 0 : Integer.valueOf(cnt);
out.print("<br>�湮�ڼ� : " + count);

application.setAttribute("counter",String.valueOf(++count));


%>