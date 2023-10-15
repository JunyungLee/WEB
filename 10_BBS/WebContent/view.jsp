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
	pageContext.setAttribute("bvo", bvo);
	
	// 3. 게시글(bbsIdx)에 딸린 댓글이 있으면 조회 후 화면 표시
	List<CommentVO> commList = BbsDAO.getCommlist(bbsIdx);
	System.out.println("commList : " + commList);	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
	#bbs table {
		width: 500px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 15px;
	}
	#bbs table caption {
		font-size : 15px;
		font-weight : bold;
		margin-bottom : 5px;
	}
	
	#bbs th, td {
		border : 3px solid black;
		padding : 4px 10px;
		text-align : center; }
</style>
</head>
<body>
		<h1>게시글 정보</h1>
		<hr>
		<div id="bbs">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%--<tr>
					 <td><%=bvo.getBbsIdx() %></td>
					<td><%=bvo.getFileName() %></td>
					<td><%=bvo.getWriter() %> </td>
					<td><%=bvo.getWriteDate() %> </td>
					<td><%=bvo.getHit() %></td>
				</tr>--%>
				<tr>
					<td>${bvo.bbsIdx}</td>
					<td>${bvo.subject}</td>
					<td>${bvo.writer}</td>
					<td>${bvo.writeDate}</td>
					<td>${bvo.hit}</td>
				</tr>
			</tbody>
		</table>
	</div>
		<%--
		<p>내용 : <%=bvo.getContent() %></p>
		<h2>댓글 목록</h2>
		<% if (commList != null && commList.size() > 0) { %>
		<ul>
			<% for (CommentVO comment : commList) { %>
				<li>
					<p>작성자 : <%= comment.getWriter() %></p>
					<p>내용 : <%= comment.getContent() %></p>
				</li>
			<% } %>
		</ul>
	<% } else { %>
		<p>댓글이 없습니다.</p>
	<% } %> --%>
	<p>내용 : ${bvo.content}</p>
	<hr>
		<h2>댓글 목록</h2>
		<c:choose>
			<c:when test="${empty commList}">
					<tr>
						<td colspan = "2">
							<h2>댓글이 없습니다</h2>
						</td>
					</tr>
			</c:when>
			<c:otherwise>
				<ul>
					<c:forEach var="comment" items="${commList}" >
						<li>
							<p>작성자 : ${comment.writer}</p>
							<p>내용 : ${comment.content}</p>
						</li>
					</c:forEach>
				</ul>
			</c:otherwise>
		</c:choose>
		<%-- <p><a href="list.jsp"><input type="button" value="돌아가기"></a></p>--%>
		<p><input type="button" value="돌아가기" onclick = "javascript:history.back()"></p>
</body>
</html>