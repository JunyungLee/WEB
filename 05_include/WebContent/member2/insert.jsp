<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	
	int result = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		JdbcUtil.getConnection();
		
		String sql = "" 
				+ " INSERT INTO MEMBER2 "
				+ " (ID, PWD, NAME, AGE, ADDRESS, REG ) "
				+ " VALUES (?,?,?,?,?,SYSDATE)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, address);
		
		result = pstmt.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%@ include file = "includee/menu.jspf" %>
	
	<h1>입력하기</h1>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
	<%@ include file = "includee/insert.jspf" %>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn, pstmt);
	}
%>