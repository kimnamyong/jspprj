<%@page import="java.util.List"%>
<%@page import="com.StudentDAO"%>
<%@page import="com.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<Student> list = StudentDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	crossorigin="anonymous"></script>
<script src="./res/common.js"></script>
<link rel="stylesheet" href="./res/common.css" />
<style>
div.container {
	width: 600px;
}

h1 {
	margin-bottom: -20px;
}

a.btn {
	float: right;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div class="container">

		<h1>학생목록</h1>
		<a class="btn" href="studentCreate.jsp">학생등록</a>

		<table class="table">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>학과</th>
					<th>학년</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="list" value="<%=list%>" />
				
				<c:forEach items="${list}" var="student">
					<tr class="clickable" data-url="studentEdit.jsp?id=${student.id}">
						<td>${student.id}</td>						
						<td>${student.studentNumber}</td>
						<td>${student.name}</td>
						<td>${student.departmentName}</td>
						<td>${student.year}</td>
					</tr>
				</c:forEach>				

			</tbody>
		</table>

	</div>
</body>
</html>
