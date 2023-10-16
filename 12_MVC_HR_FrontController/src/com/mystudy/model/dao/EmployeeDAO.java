package com.mystudy.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.model.vo.EmployeeVO;
import com.mystudy.mybatis.DBService;

public class EmployeeDAO {

	//전체 직원 목록 조회
	public static List<EmployeeVO> getList() {
		List<EmployeeVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("hr.list");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	//부서 직원 목록 조회
	public static List<EmployeeVO> getDeptList(String deptno) {
		List<EmployeeVO> list = null; 
		SqlSession ss = DBService.getFactory().openSession();
		try {
			list = ss.selectList("hr.deptList", deptno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	
}





