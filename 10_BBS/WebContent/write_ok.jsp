<%@page import="com.mystudy.bbs.dao.BbsDAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터 값을 DB에 입력하고 list.jsp 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<%--enctype="multipart/form-data" 사용시 setProperty 값 설정안됨 --%>
	<jsp:useBean id="testVO" class="com.mystudy.bbs.vo.BbsVO"/>
	<jsp:setProperty property="*" name="testVO"/>
	<%-- \${testVO } : ${testVO }--%> <%--데이터 저장 안됨 --%>
	<hr>
	<%-- \${param.subject } : ${param.subject }--%> <%--param 값 없음 --%>
	
<%
	//파일 저장위치 
	String path = "c:/Mystudy/temp";
	//String path = "c:/upload/bbs";
	MultipartRequest mpr = new MultipartRequest(request,path,(10 * 1024 * 1024), "UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 VO에 저장 후 DB에 입력처리(DB 연동작업)
	BbsVO bvo = new BbsVO();
	bvo.setSubject(mpr.getParameter("subject"));
	bvo.setWriter(mpr.getParameter("writer"));
	bvo.setContent(mpr.getParameter("content"));
	bvo.setPwd(mpr.getParameter("pwd"));
	
	bvo.setIp(request.getRemoteAddr());
	System.out.println("bvo : " + bvo);
	
	//첨부파일 데이터 처리
	if (mpr.getFile("filename") != null) { //첨부파일 있으면
		bvo.setFileName(mpr.getFilesystemName("filename"));
		bvo.setOriName(mpr.getOriginalFileName("filename"));
	} else { //첨부파일이 없으면
		bvo.setFileName("");
		bvo.setOriName("");
	}
	
	//DB에 입력(저장) 처리
	BbsDAO.insert(bvo);
	
	//화면전환(목록페이지로 이동-첫페이지로 가기)
	response.sendRedirect("list.jsp");
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>