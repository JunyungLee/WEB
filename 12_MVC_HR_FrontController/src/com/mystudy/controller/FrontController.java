package com.mystudy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

//@WebServlet("/controller")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 시작");
		
		String type = request.getParameter("type"); //controller의 type
		System.out.println("> type : " + type);
		
		if ("list".equals(type)) {  //type이 list일 때 조건
			List<EmployeeVO> list = EmployeeDAO.getList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		} 
		
		if ("dept".equals(type)) { //type이 dept 일 때 조건
			request.getRequestDispatcher("dept.jsp").forward(request, response);
		}
		
		if ("deptList".equals(type)) { //type이 deptList 일 때 조건
			String deptno = request.getParameter("deptno");
			List<EmployeeVO> list = EmployeeDAO.getDeptList(deptno);
			request.setAttribute("list", list);
			request.getRequestDispatcher("deptList.jsp").forward(request, response);
		}
		
		System.out.println(">> FrontController doGet() 끝");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 시작");
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
		System.out.println(">> FrontController doPost() 끝");
	}
	
}
