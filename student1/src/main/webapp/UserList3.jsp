<%@page import="com.UserDAO2"%>
<%@page import="com.User"%>
<%@page import="com.UserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String srchText = request.getParameter("srchText");
if (srchText == null)
	srchText = "";
List<User> list = UserDAO2.findByName(srchText);
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
		<label>이름</label> <input type="text" name="srchText"
			value="<%=srchText%>" placeholder="검색조건" />
		<button type="submit">조회</button>
	</form>

	<div class="container">
		<h1>사용자 목록 - UserController</h1>
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>id</th>
					<th>사용자아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>학과</th>
					<th>직책</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="list" value="<%=list%>" />				
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.id}</td>
						<td>${u.userid}</td>
						<td>${u.name}</td>
						<td>${u.email}</td>
						<td>${u.departmentName}</td>
						<td>${u.userType}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}"  >
				  <tr>
				  <td colspan="6" style="text-align:center">조회된 데이터가 없습니다.</td>
				  </tr>
				</c:if>
			</tbody>
		</table>
	</div>

</body>
</html>