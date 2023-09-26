<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	function send_go() {
//		alert(">>send.go() 실행");
//		alert(document.frm); //form name으로 찾기
//		alert("-" + document.frm.username.value + "-"); 
		if(document.frm.username.value.trim() == "") { //빈문자열, 공백일 때
			alert("이름을 입력하세요");
			document.frm.username.focus(); //함수호출 - username 위치에 focus 이동
			return false; //서버쪽 전송처리 안하고 중단(send_go()함수 실행 종료)
		}
		
		let vForm = document.frm;
		console.log("vForm.id : " + vForm.getAttribute("id") //id 속성값 출력
					+ ", name : " + vForm.getAttribute("name")); //name 속성값 출력
		
		if (vForm.userid.value.trim().length < 1) { //id가 최소 1글자 이상
			alert("아이디를 입력하세요");
			vForm.userid.value="";
			vForm.userid.focus();
			return false; //서버쪽 전송 안함
		}
					
		if (vForm.pwd.value.trim().length < 1){
			alert("비밀번호를 입력하세요");
			vForm.pwd.value="";
			vForm.pwd.focus();
			return false; //서버쪽 전송 안함
		}
		
		if (vForm.pwd2.value.trim().length < 1) {
			alert("확인 비밀번호를 입력하세요");
			vForm.pwd2.value="";
			vForm.pwd2.focus();
			return false;
		}
		
		if (vForm.pwd.value != vForm.pwd2.value) {
			alert("비밀번호와 확인 비밀번호가 일치하지 않습니다\n 확인 후 다시 입력하세요");
			vForm.pwd.value="";
			vForm.pwd2.value="";
			vForm.pwd.focus();
			return false;
		}
		
		console.log(vForm.gender); //2개가 선택됨
		let genders = vForm.gender;
		let checked = false;
		
		for(let gender of genders) {
			console.log(gender.value + " : " + gender.checked);
			if(gender.checked) checked = true;
		}
		
		if (!checked) {
			alert("성별을 선택해주세요");
			return; //함수 실행 끝
		}
		
		//서버로 전송처리
		vForm.action = "07_resp_signup.jsp";
		vForm.submit();
	}
</script>
</head>
<body>
	<h1>SignUP(07_req_signup)</h1>
	<form name="frm" id="signupForm">
		<fieldset>
		<legend>Sign Up</legend>
		<p>Name : <input type="text" name="username"></p>
		<p>ID : <input type="text" name="userid"></p>
		<p>Password : <input type="password" name="pwd"></p>
		<p>Password correct : <input type="password" name="pwd2"></p>
		<p>E-mail : <input type="email" name="email"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="남" class="gender">남
			<input type="radio" name="gender" value="여" class="gender">여
		</p>
		<p>Hobby : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="게임">게임
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
			
		<input type="button" value="회원가입" onclick="send_go()">
		<input type="reset" value="초기화">
		</fieldset>
	</form>
</body>
</html>