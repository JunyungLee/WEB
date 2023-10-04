<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산(확인)</title>
</head>
<body>
	<h2>장바구니 목록 확인 (list.calc.jsp)</h2>
	<hr>
	<p>[ <%=session.getAttribute("username")%> ] 님 의 장바구니 </p>
	<h2> 계산할 품목</h2>
<%--ul, li 사용해서 장바구니 목록 출력
	없으면 : <p>계산할 품목이 없습니다</p>
	있으면 : ul, li 태그로 목록을 화면 출력
--%>
	<%-- 풀이 
	<%
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("product_list");
	 if(list == null || list.size() == 0) {
		 out.print("<p>계산할 품목이 없습니다</p>");
	 } else {
		 out.println("<ul>");
		 for(int i = 0; i <list.size(); i++) {
			 out.println("<li>" + list.get(i) + "</li>");
		 }
		 out.println("</ul>");
	%>
		<hr><hr>
		<ol>
	<%
		for (String product : list) { %>
			<li><%=product %></li>
	<%
		} 
	%>
		</ol>
	<% 
	 	} //else 끝
	%> 
	--%>
	
	<%-------------------------------실습 진행--------------------------------%>
	<%
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("product_list");
	if (list != null) { %>
	<ul>
			<% for (String str : list) { %>
					<li><%=str%></li>
			<% } %>
	</ul>
	<% } else { %>
		<p>계산할 품목이 없습니다</p>
	<% } %>
	
	<hr>
	<p><a href="logout.jsp">로그아웃</a></p>
</body>
</html>