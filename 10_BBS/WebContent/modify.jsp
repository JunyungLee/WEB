<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
	function updateData(){
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == ""){
				if(firstForm.elements[i].getAttribute("type") == "file") continue;
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		
		firstForm.submit();
	}
</script>
</head>
<body>
	<div id="bbs">
		<form action="modify_ok.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption>게시글 수정</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td> 
						<input type="text" name="subject" title="제목">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td> 
						<input type="text" name="writer" title="작성자">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td> 
						<textarea name="content"rows="8" cols="50" title="내용"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td> 
						<input type="file" name="filename">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td> 
						<input type="password" name="pwd" title="암호">
					</td>
				</tr>
			</tbody>
				<tr>
					<td colspan="2">
						<input type="button" value="수정완료" onclick="updateData()">
						<input type="reset" value="초기화">
					</td>
				</tr>
			<tfoot>
			</tfoot>
		</table>
		</form>
	</div>

</body>
</html>