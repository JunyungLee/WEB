package com.mystudy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.ajax.dao.MemberDAO;
import com.mystudy.ajax.vo.MemberVO;

@WebServlet("/getJsonMembersName")
public class GetJsonMembersNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> GetJsonMembersNameController doGet() 실행");
		//response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		String name= request.getParameter("name");
		List<MemberVO> list = MemberDAO.getListNameLike(name);
		System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들기
		String result = makeJson(list);
		
		//클라이언트에게 응답처리
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); //한글처리(doPost 필수)
		doGet(request, response);
	}

	private String makeJson(List<MemberVO> list) {
		/*{"list" : {},{},...,{}]}
		 {"list" : [
		 	{
		 		"idx" : 1,
		 		"name" : "홍길동",
		 		"age" : 27,
		 		"addr" : "서울", 
		 		"regdate" : "2023-10-17"
		 	},
		 	{},{},....,{}
		 ]}
		 ***********************/
		//JSON 형식 문자열 만들기 
		StringBuilder result = new StringBuilder();
		result.append("{\"list\" : [");
		for (MemberVO vo : list) {
			result.append("{");
			result.append("\"idx\" :" + vo.getIdx() + ",");
			result.append("\"name\" : \"" + vo.getName() + "\",");
			result.append("\"age\" : " + vo.getAge() + ",");
			result.append("\"addr\" : \"" + vo.getAddr() + "\",");
			result.append("\"regdate\" : \"" + vo.getRegdate() + "\" ");
			result.append("},");
		}
		//result.delete(result.length()-1, result.length()); //마지막 , 제거 -> stringBuilder에서는 charAt() 사용이 훨씬 편함
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		System.out.println("result : " + result.toString());
		
		return result.toString();
	}
}
