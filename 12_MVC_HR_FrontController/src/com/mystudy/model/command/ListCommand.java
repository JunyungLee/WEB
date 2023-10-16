package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<EmployeeVO> list = EmployeeDAO.getList();
		request.setAttribute("list", list);
		
		//request.getRequestDispatcher("list.jsp").forward(request, response);
		
		return "list.jsp";
	}

}
