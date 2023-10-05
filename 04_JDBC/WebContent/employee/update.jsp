<%@page import="com.mystudy.common.JdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터로 DB데이터 수정처리 후 페이지 전환 
	수정할데이터 : 성명, 금액, 날짜(SYSDATE)
	정상처리 후 : list.jsp 또는 detail.jsp 페이지 이동 처리
	예외발생시 : 현재 페이지에 오류메시지 보여주기
--%>
<%
	//1. 전달받은 데이터 확인
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	
	int pay = 0;
	String sPay = request.getParameter("pay");
	System.out.println("param pay : " + sPay);
	try {
		pay = Integer.parseInt(sPay);
	} catch(NumberFormatException e) { %>
		<script>
			alert("금액에 숫자가 아닌 값이 입력되었습니다.\n"
					+ "확인 후 다시 입력하세요");
			history.back();
		</script>
<%
		return; //service() 메소드 종료
	}
	
	//2. DB 데이터 수정
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int result = 0; //작업결과 값 저장용
	
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(JdbcUtil.DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = JdbcUtil.getConnection();
				
		//3. Statement 문 실행(SQL 문 실행)
		//3-1. SQL문 준비
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE EMPLOYEE ");
		sql.append("   SET NAME = ? ");
		sql.append("     , PAY = ? ");
		sql.append("     , REGDATE = SYSDATE ");
		sql.append(" WHERE SABUN = ? ");
		
		pstmt = conn.prepareStatement(sql.toString());
		
		//3-2. 바인드변수(매개변수, 파라미터) 값 설정
		pstmt.setString(1, name);
		pstmt.setInt(2, pay);
		pstmt.setInt(3, sabun);
		
		//4. SQL 실행 결과에 대한 처리
		//4-1. SQL문 실행
		result = pstmt.executeUpdate();
		System.out.println("건수 : " + result);
		
	} catch(Exception e) {
		e.printStackTrace();
		result = -1;
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
	//3. 페이지 전환
	//4-2. SQL 실행결과에 대한 처리
	if (result > 0) {
		//response.sendRedirect("list.jsp");
		response.sendRedirect("detail.jsp?sabun=" + sabun);
	}
	if (result == 0) { // SQL문 정상실행 + 데이터 없음
%>		
		<script>
			alert("[수정실패] 대상이 없어서 수정하지 못했습니다.\n"
					+ "목록 페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>[오류]사원 수정 실패</h1>
	<p>수정처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	
	<a href="detail.jsp?sabun=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>