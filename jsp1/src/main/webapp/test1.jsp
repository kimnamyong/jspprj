<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>jsp ù����</h1>
<p> jsp�� ���Ű��� ȯ���մϴ�. </p>
<h2> ��ũ��Ʈ �±�</h2>

<!-- ���� �±� -->
<%--  jsp �ּ� --%>

<%! 

   int count=3;
	String makeLower(String data){
		return data.toLowerCase();
	}
%>
<%
   for(int i=1;i<count;i++){
	   out.println("Java Server " + i+ "<br>");
   }
%>

<%= makeLower("Welcome to my world") %>
<%= makeLower("�ȳ��ϼ���") %>


<%! int count2=0;  %>
<%
out.println(++count2);
%>

<%
  out.print(myMethod(0));
%>
<%!
  public int myMethod(int count){
	return ++count;
  }
%>









</body>
</html>