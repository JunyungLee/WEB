<%@page import="com.mystudy.bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 파라미터 값(bbsIdx) 사용 DB데이터 조회 화면표시
	1. 게시글 조회수 1 증가(실습)
	2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	3. 게시글(bbsIdx)에 딸린 댓글이 있으면 조회 후 화면 표시
--%>
<%
	// 파라미터 값 추출(확인)
	int bbsIdx = Integer.parseInt(request.getParameter("bbsIdx"));
	String cPage = request.getParameter("cPage");
	
	// 1. 게시글 조회수 1 증가(실습)
    BbsDAO.hitup(bbsIdx); // 조회수 증가
	
	// 2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	BbsVO bvo = BbsDAO.selectOne(bbsIdx);
	System.out.println("bvo : " + bvo);
	
		
	// 3. 게시글(bbsIdx)에 딸린 댓글이 있으면 조회 후 화면 표시
	List<CommentVO> commList = BbsDAO.getCommlist(bbsIdx);
	System.out.println("commList : " + commList);	
	
	//JSTL, EL 사용을 위한 scope 상에 데이터 입력
	//pageContext.setAttribute("bvo", bvo); //(실습 -> page 객체에 저장함)
	session.setAttribute("bvo", bvo); //게시글 데이터
	session.setAttribute("cPage", cPage);
	
	pageContext.setAttribute("c_list", commList); //댓글 목록 page 객체에 저장
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script>
	function modify_go() {
		location.href="modify.jsp";
	}
	
	function delete_go() {
		location.href="delete.jsp";
	}
	
	function list_go() {
		location.href="list.jsp?cPage=${cPage}";
	}
	
</script>
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size : 20px;
		font-weight : bold;
		margin-bottom : 10px;
	}
	
	#bbs th{
		border : 1px solid black; 
		padding : 4px 10px;
		text-align: center; 
		background-color : lightsteelblue;
	} 
	#bbs td {
		border : 1px solid black; 
		padding : 4px 10px;
		text-align: center; 
	}
	#bbs .align-left {text-align: left;}
</style>
</head>
<body>
		<div id="bbs"> 
		<%--게시글 내용 표시 --%>
		<table>
			<caption>상세보기</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${bvo.subject }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${bvo.writer}</td>

				</tr>
				<tr>
					<th>작성일</th>
					<td>${bvo.writeDate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${bvo.hit}</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:if test="${empty bvo.fileName }">
							첨부파일 없음
						</c:if>
						<c:if test="${not empty bvo.fileName }">
							<a href="download.jsp?filename="${bvo.fileName}">${bvo.oriName }</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${bvo.content}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수정(개인실습)" onclick="modify_go()">
						<input type="button" value="삭제(개인실습)" onclick="delete_go()">
						<input type="button" value="목록보기" onclick="list_go()">
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		
	<%--게시글에 딸린 댓글 표시 영역 --%>
		<h2>댓글</h2>
		<c:forEach var="commVO" items="${c_list }">
		<div class="comment">
			<form action="ans_del.jsp" method="post">
				<p>작성자 : ${commVO.writer } &nbsp;&nbsp; 작성일 : ${commVO.writeDate }</p>
				<p>댓글 : ${commVO.content }</p>
				<input type="submit" value="댓글삭제">
				<input type="hidden" name="commentIdx" value="${commVO.commentIdx }">
				<!--세션에 게시글데이터, 페이지번호가 없으면 명시적으로 데이터 넘기기--> <!--세션에 있기때문에 지금은 필요X(option) -->
				<%-- <input type="hidden" name="bbsIdx" value="${commVO.bbsIdx }">
				<input type="hidden" name="cPage" value="${commVO.cPage }">--%>
			
			</form>
		</div>
		<hr>
		</c:forEach>
	<%--게시글에 대한 댓글 작성 영역 --%>
	<h2>댓글 쓰기</h2>
	<form action ="ans_write_ok.jsp" method="post">
		<p>
			작성자 : <input type="text" name="writer">
			비밀번호 : <input type="password" name="pwd">
		</p>
		<p>
			댓글 : <textarea name="comment" rows="2" cols="55"></textarea>
			<input type="submit" value="등록(실습)">
			<input type="hidden" name="bbsIdx" value="${bvo.bbsIdx }">
		</p>
	</form>
		<%--<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>--%> <%--조회수 반영 --%>
		<%--<p><a href="list.jsp"><input type="button" value="돌아가기"></a></p>
		 <p><input type="button" value="돌아가기" onclick = "javascript:history.back()"></p>--%>
</body>
</html>