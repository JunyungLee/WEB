<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 자바빈(Bean) VO에 저장해서 사용 --%>
	<jsp:useBean id="vo" class="com.mystudy.MemberVO"/>
	<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 사용 응답페이지</title>
</head>
<body>
	<h1>결과보기(Bean 사용)</h1>
	<ul>
		<li>ID : <%=vo.getId() %></li>
		<li>PW : <%=vo.getPwd() %></li>
		<li>Name : <%=vo.getName() %></li>
		<li>Gender : <%=vo.getGender() %> </li>
		<li>Hobby : 
			<%
				if(vo.getHobby() == null) {
					out.print("선택안함");
				} else {
					for(String hobby : vo.getHobby()) {
						out.print(hobby + "");
					}
				}
			%>	
		</li>
	</ul>
	<hr>
	
	<h2>Bean 데이터 EL 사용</h2>
	<p>EL은 null 데이터 출력안함</p>
	<ol>
		<li>ID : ${vo.getId() }</li>
		<li>PW : ${vo.getPwd()}</li>
		<li>Name : ${vo.getName() }</li>
		<li>Gender : ${vo.getGender() }</li>
		<li>Hobby : ${vo.hobby[0] }
					${vo.hobby[1] }
					${vo.hobby[2] }
					${vo.hobby[3] }
		</li>
	</ol>
</body>
</html>