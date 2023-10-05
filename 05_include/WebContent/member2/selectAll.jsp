<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB에서 전체 데이터 조회해서 화면 출력 --%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = JdbcUtil.getConnection();
		
		String sql = "" 
				+ " SELECT IDX, ID, PWD, NAME, AGE " 
				+ "	, NVL(ADDRESS,'주소없음') AS ADDRESS, REG "
				+ " , TO_CHAR(REG, 'YYYY/MM/DD') REG2 "
				+ " FROM MEMBER2 "
				+ " ORDER BY IDX ";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체데이터검색</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%@ include file = "includee/menu.jspf" %>
	
	<h1>전체데이터 검색</h1>
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
	while (rs.next()) { %>
		<tr>
			<td><%=rs.getInt("IDX") %></td>
			<td><%=rs.getString("ID") %></td>
			<td><%=rs.getString("PWD") %></td>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getInt("AGE") %></td>
			<td><%=rs.getString("ADDRESS") %></td>
			<%-- <td><%=rs.getDate("REG") %></td> --%>
			<td><%=rs.getString("REG2") %></td>
		</tr>
<%
	}
%>
		</tbody>
	</table>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(conn, pstmt, rs);
	}
	
%>