<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL ���սǽ�</title>
</head>
<body>
<h1>JSTL ���� ����</h1>
<h3>set, out</h3>
 <c:set var="product1" value="<h2>���þ�����</h2>"  />
 <c:set var="product2" value="<h2>�Ｚ ������ ��Ʈ</h2>"  />
 <c:set var="inArray" value="${[1,2,3,4,5]}"  />
 <p>
   product1(true) : 
   <c:out value="${product1}"  default="Not regieted"  escapeXml="true" />
 </p>
 <p>
 product1(false) :
   <c:out value="${product1}"  default="Not regieted"  escapeXml="false" />
 </p>
 
 <p>   products1(el) : ${product2} </p>
 <p>   inArray[2] : ${inArray[2]} </p>
 
 
 <ul>
   <c:forEach var="num" varStatus="i" items="${inArray}">
   		<li> ${i.index} : ${num}    </li>
   
   </c:forEach>   
 </ul>
 
  <c:set var="strArray" value="${[ '������','ȭ����','������']}"  />
 <ul>
   <c:forEach var="num" varStatus="i" items="${strArray}">
   		<li> ${i.index} : ${num}    </li>   
   </c:forEach>   
 </ul>
 
 <h3> if��</h3> 
 <c:set var="check" value="true" />
 <c:if test="${check}">
    <p>�ֹ���ǰ : ${product2}</p>
 </c:if>
 <c:if test="${!check}">
 <p>�ֹ���ǰ : ${product1}</p>
 </c:if>
 
 <c:set var="check" value="false" />
 <c:if test="${check}">
    <p>�ֹ���ǰ : ${product2}</p>
 </c:if>
 <c:if test="${!check}">
 <p>�ֹ���ǰ : ${product1}</p>
 </c:if>
 
 <c:if test="${!empty product2}">
   <p> ${product2} �߰���!! </p>
 </c:if>
 <h3> choose, when, otherwise</h3>
 <c:choose>
 	<c:when test="${check}">
 	   <p>�ֹ���ǰ2 : ${product2}</p>
 	</c:when>
 	<c:otherwise>
 		<p>üũ�ƿ� ���°� �ƴ�!!</p>
 	</c:otherwise>
 </c:choose>
 
  <c:choose>
 	<c:when test="${!check}">
 	   <p>�ֹ���ǰ2 : ${product2}</p>
 	</c:when>
 	<c:otherwise>
 		<p>üũ�ƿ� ���°� �ƴ�!!</p>
 	</c:otherwise>
 </c:choose>
 
 <h3> forTokens</h3>
 <c:forTokens var="city" 
 items="Seoul|busan|daegu|��õ|����"  delims="|" varStatus="i">
   <c:if test="${i.first}"> ���ø��:</c:if>   
      ${city}   
   <c:if test="${!i.last}"> ,</c:if>  
 </c:forTokens>
 
 <%@page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 
 <c:set var="myDate"  value="2023-01-01"/>
  <c:out value="${myDate}" />
 <br>
 <hr>
 <fmt:parseDate value="2024-02-02" pattern="yyyy-mm-dd" var="cal"/>
 <fmt:formatDate value="${cal}" pattern="yyyy-mm-dd" />
 
 <% Date currentDate=new Date(); %>
 <p>
 <fmt:formatDate value="<%= currentDate %>" 
 pattern="yyyy-mm-dd hh:mm:ss" />
 </p>
 <br>
<h3> EL ����</h3>
 ${10+20}
 
 <c:set var="today" value="<%= new Date() %>"  />   
 <p> ���� �ð�: <fmt:formatDate value='${today}' pattern='yyyy-M-dd' /> </p>
  <c:out value="${today}"  />  
 <br>
 EL�� ������� �ʴ� ����  : 
 <%= currentDate %>
 <br>
 EL�� ����ϴ� ����  :  
   <c:out value="${today}" />  <br>
 <b>${today}</b>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

</body>
</html>