<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="com.MemberBean">
</jsp:useBean>
<jsp:setProperty property="id" name="member" value="1234"/>
<jsp:setProperty property="name" name="member" value="ȫ�浿"/>

<p>���̵�:<%= member.getId() %></p>
<p>�̸�:<%= member.getName() %></p>

<jsp:useBean id="date" class="java.util.Date" />
<p>
 <% out.print("���ó�¥ �� �ð���? ") ; %>
</p>
<p> <%=date %></p>


<jsp:useBean id="cal" class="com.Calculator" scope="request">
</jsp:useBean>

<%
  int m=cal.calc(5);
out.print("5�� ������ :" + m);
%>

<%
  member.setId(7777);
  member.setName("������");
%>

<%= member.getId() %>
<%= member.getName() %>







</body>
</html>