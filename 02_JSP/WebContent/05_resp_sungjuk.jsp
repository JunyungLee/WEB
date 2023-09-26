<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--전달받은 데이터를 사용해서 계산처리 후 결과를 테이블 형태로 작성 
 	데이터 처리 : 스크립트릿(<% %>)
 	데이터 출력 : 표현식 (<%= %>) 
 --%>
 <% 
 	String name = request.getParameter("name");
 	String kor = request.getParameter("kor");
 	String eng = request.getParameter("eng");
 	String math = request.getParameter("math");
 	
 	int tot =  Integer.parseInt(kor) + Integer.parseInt(eng) + Integer.parseInt(math);
	double avg = tot * 100 / 3 / 100.0;
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리</title>
</head>
<style>
	th {background-color : lightblue; }
	td {background-color : azure; }
	th, td {text-align : center;}
</style>
<body>
	<h2>성적처리결과(05_resp.jsp)</h2>
	<table border>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><%=kor %></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=eng %></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><%=math %></td>
		</tr>
		<tr>
			<th>총점</th>
			<td><%=tot %></td>
		</tr>
		<tr>
			<th>평균</th>
			<td><%=avg %></td>
		</tr>
	</table>

</body>
</html>