<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 값 추출	
	String name = request.getParameter("name");
	if (name != null) {
		//페이지 전환시에도 계속 이름을 사용하기 위해서 session scope에 등록
		session.setAttribute("username", name);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택</title>
<script>
	function add_list(frm) {
		frm.action = "addList.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>상품선택(shopping.jsp)</h2>
	<hr>
	<%--[ <%=name %>] 님이 접속했습니다--%>
	[ <%=session.getAttribute("username") %> ] 님이 접속했습니다
	<hr>
	<form action="addList.jsp">
		<select name="product">
			<option selected disabled >선택하세요</option>
			<option value="수박">수박</option>
			<option value="사과">사과</option>
			<option value="망고">망고</option>
			<option value="딸기">딸기</option>
			<option value="포도">포도</option>
		</select>
		<input type="button" value="추가" onclick="add_list(this.form)">
	</form>
	<p><a href="list_calc.jsp">계산하기(목록확인)</a></p>
	<p><a href="logout.jsp">로그아웃</a></p>
</body>
</html>