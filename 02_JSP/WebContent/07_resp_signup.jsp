<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<style>
	tr {background-color : lightpink;}
	td {background-color : mistyrose;}
	table {text-align : center;
			width : 300px; }
	table ul {list-style : none;
		padding-left:0px;}
</style>
<body>
	<% 
		String name = request.getParameter("username");
		String id = request.getParameter("userid");
		String pw = request.getParameter("pwd");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
//		String hobby = request.getParameter("hobby");
		String[] hobby = request.getParameterValues("hobby");
	%>
	
	<h2>회원 정보</h2>
	<ul>
		<li>Name : <%=name %></li>
		<li>ID : <%=id %></li>
		<li>Email : <%=email %></li>
		<li>Gender : <%=gender %></li>
		<li>Hobby : <% 
			if (hobby == null) {
				out.println("취미를 선택해주세요");
			} else {
				for (String str : hobby){ 
					out.println(str); 
				};
			} %> 
		</li>
	</ul>
	
	<h2>Register Member Info</h2>
	<table border>
		<tr>
			<th>Name</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%=email %></td>
		</tr>
		<tr>
			<th>Gender</th>
			<td><%=gender%></td>
		</tr>
		<tr>
			<th>Hobby</th>
			<td>
				<ul>
	            	<% for (String str : hobby) { %>
	               		<li><%= str %></li>
	            	<% } %>
	        	</ul>
			</td>
		</tr>
	
	</table>
</body>
</html>