<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--주문한 내역에 따라 계산하고 결과를 표시 --%>
 <%
 	//(실습)주문한 내역에 따라 계산하고 결과를 표시
 	//1. 파라미터 값 추출(확인)
 		/* 
 		int menu = Integer.parseInt(request.getParameter("coffee")); //int 타입 사용하면 -> menu == 1 와 같이 비교하기
 		*/
 		
	 	String menu = request.getParameter("coffee"); //string으로 사용 시 .equals 활용해서 비교하기
 		/*
 		if(menu == null) {
 			System.out.println(">>>메뉴 선택 안됨 : " + menu);
 			response.sendRedirect("08_req_coffee.jsp");
 			return;
 		}
	 	*/
	 	int count = Integer.parseInt(request.getParameter("count")); //선택수량
 		int deposit = Integer.parseInt(request.getParameter("deposit")); //입금액
 		
 	//2. 계산처리 : 구입금액, 잔액
 	//2-1. 메뉴 선택에 따른 메뉴명 단가 확인
 		int price = 0; //메뉴 금액
 		String menuName ="선택안됨"; //메뉴명
 		
 		if ("1".equals(menu)) { //equals() : null 처리 해줌
 			price = 3000;
 			menuName = "AMERICANO";	
 		} else if ("2".equals(menu)) {
 			price = 3500;
 			menuName = "CAFFE LATTE";
 		} else if ("3".equals(menu)) {
 			price = 4000;
 			menuName = "CAFFE MOCHA";
 		} else if ("4".equals(menu)) {
 			price = 4500;
 			menuName = "EINSPANNER";
 		}
 		//2-2 구입금액(tot), 잔액(change) 계산처리
		int tot = price * count;
 		int change = deposit - tot;
 		
	 	if (deposit < tot) {
	 		System.out.println("금액이 부족합니다");
	 		response.sendRedirect("08_req_coffee.jsp");
	 		return;
	 	}
 	//3. 결과 표시
 %>
<!DOCTYPE html>
<html>
<head>
<style>
	h2, ul, p {text-align :center;}
	li {list-style : none;
		padding-left:0px;}
</style>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h3>주문 계산 결과(응답-08_resp.jsp)</h3>
<%--
	커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3
	구입금액 : 9000원 (단가 * 수량)
	----------------
	입금액 : 10000원
	잔액 : 1000원 (입금액 - 구입금액)
 --%>
 	<hr>
 	<h2>RECEIPT</h2>
 	<p>---------------------------</p>
 	<ul>
 		<li>메뉴명 : <%= menuName %> </li>
 		<li>수량 : <%=count %> 잔</li>
 		<li>금액: <%=price %> 원</li>
 		<li>합계 : <%=tot %> 원</li>
 		<p>---------------------------</p>
 		<li>내신 금액 : <%=deposit %> 원</li>
 		<li>받을 금액 : <%=change %> 원</li> 
 	</ul>
 	
 	<hr>
 	
</body>
</html>