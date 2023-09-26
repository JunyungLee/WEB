<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터값)를 화면 출력--%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h2>응답페이지(04_resp_id_pw.jsp)</h2>
	<h3>당신이 입력한 데이터가 맞나요?</h3>
	<h4>표현식 사용</h4>
	<h3><%="ID : " + id %></h3>
	<h3><%="PW : " + pw %></h3>
	<hr>
	<h3>ID : <%=id%> </h3>
	<h3>PW : <%=pw%> </h3>
	<hr>
	
	<h4>out객체 사용</h4>
	<h3><%out.print("ID : " + id); %></h3>
	<h3><%out.print("PW : " + pw); %></h3>
	<hr>
	<h3>ID : <%out.print(id); %></h3>
	<h3>PW : <%out.print(pw); %></h3>
	
</body>
</html>