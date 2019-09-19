package com.umo.myPage.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.model.vo.Member;
import com.umo.myPage.model.dao.MyPageDao;
import com.umo.notice.model.vo.NoticeBoard;
public class MyPageService {
	private MyPageDao dao=new MyPageDao();
	
	public Member selectOne(String userId) {
	      Connection conn=getConnection();
	      Member m=dao.selectOne(conn,userId);
	      close(conn);
	      return m;
	   }

}
