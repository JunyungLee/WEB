<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request, session scope에 설정된 값 사용(읽기)
	// request scope 설정값 읽기
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_age");
	
	//세션 설정값 읽기
	String attr_name = (String) session.getAttribute("attr_name");
	String attr_age = (String) session.getAttribute("attr_age");
	
	//세션 ID 및 상태 확인
	System.out.println(":: session id : " + session.getId()
					+", 새로운 세션여부(new) : " + session.isNew());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(session) 사용범위</title>
<script>
	function sessionSet (){
		alert(">> sessionSet() 실행");
		location.href = "ex01_sessionSet.jsp?name=hong&age=27";
		
	}
	function sessionRemove(){
		alert(">> sessionRemove() 실행");
		location.href = "ex01_sessionRemove.jsp";
	}
	function sessionInvalidate() {
		alert(">> sessionInvalidate() 실행");
		location.href = "ex01_sessionInvalidate.jsp";
	}
</script>
</head>
<body>
	<h1>세션(session) 사용범위 - [ex01_session.jsp]</h1>
	<input type="button" value="세션 속성에 저장(set)" onclick="sessionSet()">
	<input type="button" value="세션 속성 삭제(remove)" onclick="sessionRemove()">
	<input type="button" value="세션무효화(Invalidate)" onclick="sessionInvalidate()">
	<hr>
	
	<h1>리퀘스트 스코프(request scope)</h1>
	<h2>이름(request req_name) : <%=req_name %></h1>
	<h2>나이(request req_age) : <%=req_age %></h1>
	<hr>
	
	<h1>세션 스코프(session scope)</h1>
	<h2>이름(session attr_name ) : <%=attr_name %></h1>
	<h2>나이(session attr_age) : <%=attr_age %></h1>
	<hr>
</body>
</html>
