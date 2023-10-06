<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터처리(EL)</title>
</head>
<body>
	<h1>데이터처리(EL)</h1>
	<form>
		<fieldset>
		<legend>Sign Up</legend>
		<p>ID : <input type="text" name="id"></p>
		<p>Password : <input type="password" name="pwd"></p>
		<p>Name : <input type="text" name="name"></p>
		<p>Gender : 
			<input type="radio" name="gender" value="M">Man
			<input type="radio" name="gender" value="W">Women			
		</p>
		<p>Hobby : 
			<input type="checkbox" name="hobby" value="운동">exercise
			<input type="checkbox" name="hobby" value="게임">game
			<input type="checkbox" name="hobby" value="영화">movie
			<input type="checkbox" name="hobby" value="독서">book
		</p>
			
		<input type="button" value="전달1(자바빈)" onclick="send_go1(this.form)">
		<input type="button" value="전달2(param)" onclick="send_go2(this.form)">
		</fieldset>
	</form>
	
<script>
	function send_go1(frm) {
		frm.action = "EL03_result_bean.jsp";
		frm.submit();
	}
	
	function send_go2(frm) {
		frm.action = "EL03_result_param.jsp";
		frm.submit();
	}
</script>	
</body>
</html>