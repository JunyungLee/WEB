<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--전달받은 데이터를 DB에 입력처리 
	정상입력 : list.jsp 페이지로 이동(입력건수 0보다 크면 list.jsp 재요청 처리)
	예외발생 : 현재 페이지에 오류메시지 보여주기
--%>
<%
	//1. 파라미터 값 추출(sabun, name, pay)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	//String sabun = request.getParameter("sabun");
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	//2. DB 입력작업
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int result = 0;
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		
		String sql =""
				+ " INSERT INTO EMPLOYEE "
				+ " (SABUN, NAME, REGDATE, PAY) "
				+ " VALUES (?,?,SYSDATE,?)";
		
		/*
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO EMPLOYEE ");
		sql.append("       (SABUN, NAME, REGDATE, PAY) ");
		sql.append("VALUES (?, ?, SYSDATE, ?) "); 
		*/
		
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		//pstmt.setInt(1, Integer.parseInt(sabun));
		pstmt.setInt(1, sabun);
		pstmt.setString(2, name);
		pstmt.setInt(3, pay);
		//4. SQL 실행 결과에 대한 처리
		//4-1 SQL 문 실행
		result = pstmt.executeUpdate();
		System.out.println("건수 : " + result);
		
		//4-2 SQL문 실행 결과에 대한 처리
		//   - INSERT, UPDATE, DELETE : int 값(건수) 처리
		if (result > 0) {
			response.sendRedirect("list.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {}
	}
	
	//3. 화면전환
	/* if (result > 0){
		response.sendRedirect("list.jsp");
	} else {
		return;
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록-DB 입력</title>
</head>
<body>
	<h1>사원등록 실패</h1>
	<p>입력처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록보기</a>
</body>
</html>