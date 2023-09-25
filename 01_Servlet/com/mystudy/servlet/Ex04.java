package com.mystudy.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println(">> Ex04.doGet() 실행!!");
		
		//request 객체로 부터 파라미터 값 추출 
		// getParameter(name) : 1개의 파라미터 값 추출(확인)
		// getParameterValues(name) : 동일이름의 여러개 데이터 추출시 사용
		// getParameterMap() : 파라미터 데이터 Map 형태로 받기
		// getParameterNames() : 파라미터명 확인(추출)
		
		//전달받은 데이터 추출 후 응답 처리
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pw = req.getParameter("pwd");
		String email = req.getParameter("email");
		
		//체크박스 
//		String hobby = req.getParameter("hobby");
		
		//취미(hobby - checkbox) 값 추출
		String[] hobby = req.getParameterValues("hobby");

		//서버 콘솔(console)에 값 출력
		System.out.println("======================");
		System.out.println("> name : " + name);
		System.out.println("> id : " + id);
		System.out.println("> pw : " + pw);
		System.out.println("> email : " + email);
		
		System.out.println("> hobby : " + hobby); 
		//hobby 2개 값 넘겼을 때 먼저 작성된 한개만 출력
	}
}
