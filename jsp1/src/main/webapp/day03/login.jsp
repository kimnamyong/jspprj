<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Date now=new Date();

	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	String date=df.format(now);
	
	if(date.endsWith("12")){
		response.sendRedirect("underCheck.jsp");
		return;
	}

	String uid=request.getParameter("id");
	if(uid==null){
		out.print("�α��� ������ �����ϴ�");
	}else{
		session.setAttribute("id",uid);
		response.sendRedirect("main.jsp");
	}
	
	/* String res="<h3> ����� ���̵�: " + uid +"</h3>";
	res+="<br>�α��� �ð�: " + now.toString();
	out.print(res); */	
	
%>
<%@ include file="visitCount.jsp" %>
