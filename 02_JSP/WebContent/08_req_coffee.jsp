<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
</head>
<script>
	function checkValue() {
		alert("checkValue() 실행");
		
		let vForm = document.frm;
		
		//메뉴 선택 안했을 때 예외처리
		let coffees = vForm.coffee;
		let checked = false;
		
		for(let coffee of coffees) {
			if(coffee.checked) checked = true;
		}
		
		if (!checked) {
			alert("메뉴를 선택해주세요");
			return;
		}
		
		//입금액 입력 안했을 때 예외 처리
		if (vForm.deposit.value.trim() == "0") {
			alert("입금액을 입력해주세요");
			vForm.deposit.focus();
			return false;
		}
		
		//수량 입력 안했을 때 예외처리
		if (vForm.count.value.trim() =="0") {
			alert("수량을 입력해주세요");
			vForm.count.focus();
			return false;
		}
		
		//서버로 전송처리
		vForm.action = "08_resp_coffee.jsp";
		vForm.submit();
	}
</script>
<body>
	<h1>커피주문(요청-08_req_coffee.jsp)</h1>
	<form action="08_resp_coffee.jsp" name="frm">
		<input type="radio" name="coffee" value="1">아메리카노(3000원)<br>
		<input type="radio" name="coffee" value="2">카페라떼(3500원)<br>
		<input type="radio" name="coffee" value="3">카페모카(4000원)<br>
		<input type="radio" name="coffee" value="4">아인슈페너(4500원)<br>
		<hr>
		수량 : <input type="number" name="count" value="0"><br>
		입금액 : <input type="number" name="deposit" value="0"><br>
		
		<%--<input type="submit" value="주문처리" onclick="checkValue()">--%>
		<input type="button" value="주문처리" onclick="checkValue()">
	</form>
</body>
</html>