package com.umo.myPage.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.model.vo.Comment;
import com.umo.model.vo.Food;
import com.umo.model.vo.Member;
import com.umo.model.vo.NoticeBoard;
import com.umo.myPage.model.dao.MyPageDao;
public class MyPageService {
	private MyPageDao dao=new MyPageDao();
	
	public Member selectOne(String userId) {
	      Connection conn=getConnection();
	      Member m=dao.selectOne(conn,userId);
	      close(conn);
	      return m;
	   }
	public List<Comment> selectCommentList(int cPage, int numPerPage,String name,String userId,String comment) {
		Connection conn  = getConnection();
		List<Comment> list = dao.selectNoticeCommentList(conn,cPage,numPerPage,name,userId,comment);
		close(conn);
		return list;
	}
	
	
}
