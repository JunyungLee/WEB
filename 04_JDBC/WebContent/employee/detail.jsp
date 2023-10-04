<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sabun = request.getParameter("sabun");
	String name = request.getParameter("name");
	String sysdate = request.getParameter("date");
	String pay = request.getParameter("pay");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 상세보기</title>
</head>
<body>
	<h2>사원 상세정보</h2>
	<hr>
	<p>사번 : <%=sabun%></p>
	<p>성명 : <%=name%></p>
	<p>입사일 : <%=sysdate%></p>
	<p>급여 : <%=pay%></p>
	
</body>
</html>