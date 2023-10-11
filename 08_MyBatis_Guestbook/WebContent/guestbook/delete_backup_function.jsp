<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<script>
	function del_go(frm) {
		let pwd1 = frm.pwd.value;
		let pwd2 = "${guestbookVO.pwd}"; //안보이게 처리 필요!!
		
		if (pwd1 !== pwd2) {
			alert("암호불일치. 암호를 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		frm.action = "delete_ok.jsp";
		frm.submit();
	} 
</script>
</head>
<body>

<div id="container">
<h2>방명록 : 삭제화면</h2>
<hr>
<p><a href="list.jsp">[목록으로 이동]</a></p>

<form method="post">
<table>
	<tbody>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="pwd" onclick = "del_go(this.form)">
				<input type="submit" value="삭 제 ">
				<input type="hidden" name="idx" value="${guestbookVO.idx }">
			</td>
		</tr>
	</tbody>
</table>
</form>	
</div>


</body>
</html>