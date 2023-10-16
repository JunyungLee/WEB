<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서코드 검색</title>
</head>
<body>
	<h1>부서코드검색[dept.jsp]</h1>
	<form action="controller?type=deptList" method="post">
	<%-- <form action="controller" method="get">--%> <%--파라미터 값 hidden 해서 form 태그 안에 작성해서 넘겨주여야 함 --%>
		부서코드 : <input type="text" name="deptno">
		<input type="submit" value="부서코드로 검색">
	<%--<input type="hidden" name="type" value="deptList">--%><%--get 방식일 때 --%>
	</form>
</body>
</html>
