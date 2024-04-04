<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>학생 정보 조회</h2>
 <hr>
 <table border="1">    <tr>

        <th>id</th><th>이름</th><th>대학</th><th>생일</th><th>이메일</th>

    </tr>
     <c:forEach items="${students}" var="s">
        <tr>
              <td>${s.id}</td>
              <td>${s.username}</td>
              <td>${s.univ}</td>
              <td>${s.birth}</td>
              <td>${s.email}</td>
         </tr>
     </c:forEach>
 </table>
<hr> 
</body>
</html>