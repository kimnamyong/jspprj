<%@page import="dao.FeedObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FeedDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ConnectionPool"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>DAO를 사용하고 세션에 저장한다.</h3>

<%
String uid = (String) session.getAttribute("id");
if (uid == null) {
	response.sendRedirect("login.html");
	return;
}
session.setAttribute("id", uid);

ArrayList<FeedObj> feeds = (new FeedDAO()).getList();

String str = "";
str += "<table align=center>";
str += "<tr height=40><td><b>작성글 리스트</b></td>";
str += "<td align=right>";
str += "<a href='feedAdd.html'><button>글쓰기</button></a>";
str += "<a href='logout.jsp'><button>로그아웃</button></a><br>";
str += "</td></tr>";

for (FeedObj feed : feeds) {
	String img = feed.getImages(), imgstr = "";
	if (img != null) {
		imgstr = "<img src='/images/" + img + "' width=150>";
	}

	 str += "<tr>";
     str += "<td>" + feed.getId() + "</td>";
     str += "<td>" + feed.getContent() + "</td>";
     str += "<td>" + feed.getTs() + "</td>";
     str += "<td>" + imgstr + "</td>";
     str += "</tr>";    
     
}

str += "</table>";
out.print(str);
%>
