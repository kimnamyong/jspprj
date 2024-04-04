<%@page import="com.StudentDAO4"%>
<%@page import="com.StudentDAO2"%>
<%@page import="com.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
int id = 4;
Student student = StudentDAO4.findById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.container {
	width: 600px;
	margin: 50px auto;
}

thead th {
	background-color: #eee;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td, th {
	padding: 4px;
	border: 1px solid lightgray;
}

td:nth-child(4) {
	text-align: center;
}
</style>
</head>
<body>
<div class="container">

<h1>학생</h1>

<table>
  <tr>
    <td>ID</td>
    <td><%= student.getId() %></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><%= student.getName() %></td>
  </tr>
  <tr>
    <td>학과ID</td>
    <td><%= student.getDepartmentId() %></td>
  </tr>
  <tr>
    <td>학과명</td>
    <td><%= student.getDepartmentName() %></td>
  </tr>
  <tr>
    <td>학년</td>
    <td><%= student.getYear() %></td>
  </tr>
</table>

</div>


</body>
</html>