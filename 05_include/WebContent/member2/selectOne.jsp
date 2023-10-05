<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 아이디(id) 값으로 DB에서 데이터 조회 후 화면 표시
	없으면 : 데이터 없음 메시지 표시 --%>
<%
	//1. 전달받은 파라미터 값 확인(추출)
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = JdbcUtil.getConnection();
		
		String sql = "" 
				+ " SELECT IDX, ID, PWD, NAME, AGE " 
				+ "	, NVL(ADDRESS,'주소없음') AS ADDRESS, REG "
				+ " FROM MEMBER2 "
				+ " WHERE ID = ? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID로 검색하기</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%@ include file = "includee/menu.jspf" %>
	
	<h1>ID로 검색하기</h1>
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
<%
	if (rs.next()) { %>
			<tr>
				<td><%=rs.getInt("IDX") %></td>
				<td><%=rs.getString("ID") %></td>
				<td><%=rs.getString("PWD") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getInt("AGE") %></td>
				<td><%=rs.getString("ADDRESS") %></td>
				<td><%=rs.getDate("REG") %></td> 
				<%-- <td><%=rs.getString("REG") %></td> : 2023-10-05 16:21:02--%>
			</tr>

	<% } else { %>
		<tr>
			<td colspan = "7"> 데이터가 없습니다 </td>
		</tr>
<%
	}
%>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn, pstmt, rs);
	}
	
%>