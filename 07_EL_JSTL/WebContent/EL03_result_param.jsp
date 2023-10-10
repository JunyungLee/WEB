<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param</title>
</head>
<body>
	param : ${param } <br>
	paramValues : ${paramValues }
	
	<h2>EL 사용해서 전달받은 데이터 표시 (param, paramValues)</h2>
	<p>ID(\${param.id }) : ${param.id } </p>
	<p>PW(\${param.pwd }) : ${param.pwd } </p>
	<p>Name(\${param.name }) : ${param.name } </p>
	<p>Gender(\${param.gender }) : ${param.gender } </p>
	<p>Hobby(\${param.hobby }) : ${param.hobby}</p>

	<p>Hobby(배열객체 \${paramValues.hobby }) : ${paramValues.hobby} </p>
	<p>
		Hobby(배열데이터 \${paramValues.hobby }) : 
									${paramValues.hobby[0]}
									${paramValues.hobby[1]}
		 							${paramValues.hobby[2]}
		 							${paramValues.hobby[3]}
	</p>
</body>
</html>