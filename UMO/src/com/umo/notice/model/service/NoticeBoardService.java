package com.umo.notice.model.service;

import static common.template.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.umo.notice.model.dao.NoticeBoardDao;
import com.umo.notice.model.vo.NoticeBoard;

public class NoticeBoardService {
	
	private NoticeBoardDao dao= new NoticeBoardDao();
	
	public int countNoticeList() {	
		Connection conn=getConnection();	
		int result=dao.countNoticeList(conn);
		close(conn);
		return result;
	}
	
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<NoticeBoard> list=dao.selectNoticeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}

}
