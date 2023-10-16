package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.command.Command;
import com.mystudy.model.dao.EmployeeDAO;
import com.mystudy.model.vo.EmployeeVO;

public class DeptListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String deptno = request.getParameter("deptno");
		
		List<EmployeeVO> list = EmployeeDAO.getDeptList(deptno);
		
		request.setAttribute("list", list);
		
		//request.getRequestDispatcher("deptList.jsp").forward(request, response);
		
		return "deptList.jsp";
	}

}
