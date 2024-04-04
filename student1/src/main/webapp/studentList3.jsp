<%@page import="com.StudentDAO2"%>
<%@page import="com.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String srchText = request.getParameter("srchText");
if (srchText == null) srchText = "";
List<Student> list = StudentDAO2.findByName(srchText);

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
<form name="f">
  <label>이름</label>
  <input type="text" name="srchText" 
  value="<%= srchText %>" placeholder="검색조건"  
  />
  <button type="submit">조회</button>
</form>

	<div class="container">
		<h1>학생목록2-JSTL</h1>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>학과</th>
					<th>학년</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="student" value="<%=list%>" />			

				<c:forEach items="${student}" var="s">
					<tr>
						<td>${s.studentNumber}</td>
						<td>${s.name}</td>
						<td>${s.departmentName}</td>
						<td>${s.year}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>


	</div>

</body>
</html>