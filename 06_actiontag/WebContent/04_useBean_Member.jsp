<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>Register</h1>
	<form action="04_useBean_proc.jsp">
		<fieldset>
		<legend>Sign Up</legend>
		<p>Name : <input type="text" name="name"></p>
		<p>ID : <input type="text" name="id"></p>
		<p>Password : <input type="password" name="pwd"></p>
		<p>Password correct : <input type="password" name="pwd2"></p>
		<p>E-mail : <input type="email" name="email"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="M">Man
			<input type="radio" name="gender" value="W">Women			
		</p>
		<p>Hobby : 
			<input type="checkbox" name="hobby" value="운동">exercise
			<input type="checkbox" name="hobby" value="게임">game
			<input type="checkbox" name="hobby" value="영화">movie
			<input type="checkbox" name="hobby" value="독서">book
		</p>
			
		<input type="submit" value="회원가입">
		<input type="reset" value="초기화">
		</fieldset>
	</form>
</body>
</html>