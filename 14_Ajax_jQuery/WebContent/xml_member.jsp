<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	//$(document).ready(function(){});
	//$().ready(function(){});
	//$(function(){});
	$(document).ready(function(){
		$("#getDataBtn").click(ajaxGetXmlMembers);
	});
	function ajaxGetXmlMembers(){
		alert(">> ajaxGetXmlMembers() 실행~~");
		
		$.ajax({
			url : "getXmlMembers", //요청할 서버 url
			type : "get", //타입 (get,post,put 등등)
			dataType : "xml", //응답 받을 데이터 타입 //데이터 타입 (html, xml, json, text 등)
			success : function(respData){ //결과 성공 콜백 함수
				alert(">> 성공");
				console.log(respData);
				
				//XML 데이터 사용 tbody 영역에 tr 만들어 넣기
				let htmlTag ="";
				$(respData).find("member").each(function(){
					//console.log($(this).find("idx").text());	
					//console.log($(this).find("name").text());	
					//console.log("--------");
					htmlTag += "<tr>";
					htmlTag += "<td>" + $(this).find("idx").text() + "</td>";
					htmlTag += "<td>" + $(this).find("name").text() + "</td>";
					htmlTag += "<td>" + $(this).find("age").text() + "</td>";
					htmlTag += "<td>" + $(this).find("addr").text() + "</td>";
					htmlTag += "<td>" + $(this).find("regdate").text() + "</td>";
					htmlTag += "</tr>";
					
				});
				$("#tbody").html(htmlTag);
			},
			
			error : function(jqXHR, textStatus, errorThrown){ //결과 에러 콜백함수
				alert(">> Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
	<button id="getDataBtn">Ajax - XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>홍길동</td>
				<td>27</td>
				<td>서울</td>
				<td>2023-10-17</td>
			</tr>
		</tbody>
	</table>
</body>
</html>





