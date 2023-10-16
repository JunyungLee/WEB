<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_serach(){
		//location.href="list.jsp";
		//location.href="list";
		location.href="controller?type=list"; //controller의 파라미터 type list로 연결
	}
	function dept_search(){
		//location.href="dept";
		location.href="controller?type=dept";
	}
</script>
</head>
<body>
	<h1>작업선택[index.jsp]</h1>
	<button onclick="all_serach()">전체보기(list)</button>
	<button onclick="dept_search()">부서코드 검색(dept)</button>
	
</body>
</html>