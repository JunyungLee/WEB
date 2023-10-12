package com.mystudy.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.CommentVO;

public class BbsDAO {
	
	//게시글(BBS) 전체 건수 조회
	public static int getTotCount() {
		int totalCount = 0;
		
		SqlSession ss = DBService.getFactory().openSession();
		try {
			totalCount = ss.selectOne("BBS.totalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<BbsVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss= DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.list", map);
		ss.close();
		
		return list;
	}
	
	//게시글 조회수 1 증가 처리
	/*
	  public static BbsVO hitup (int hit) { 
	  	BbsVO vo = null; SqlSession
	 	ss=DBService.getFactory().openSession();
	 
	 	vo = ss.update(null); 
	 	return vo; 
	 	}
	 */
	
	//게시글 하나 조회
	public static BbsVO selectOne(int bbsIdx) {
		BbsVO vo = null;
		SqlSession ss= DBService.getFactory().openSession();
		
		try {
			vo = ss.selectOne("BBS.one",bbsIdx);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return vo;
	}
	
	//=================== 댓글 관련 ===============================
	//
	public static List<CommentVO> getCommlist(int bbsIdx) {
		SqlSession ss= DBService.getFactory().openSession();
		List<CommentVO> list = ss.selectList("BBS.commList", bbsIdx);
		ss.close();
		
		return list;
	}
	
}
