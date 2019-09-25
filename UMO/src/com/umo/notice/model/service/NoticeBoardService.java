package com.umo.notice.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.dao.NoticeBoardDao;

public class NoticeBoardService {
	
	private NoticeBoardDao dao= new NoticeBoardDao();
	
	//κ³΅μ?κΈ? μ΄? κ°??
	public int countNoticeList() {	
		Connection conn=getConnection();	
		int result=dao.countNoticeList(conn);
		close(conn);
		return result;
	}
	//κ³΅μ? ? μ²? λ¦¬μ€?Έ λΆλ¬?€κΈ?
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<NoticeBoard> list=dao.selectNoticeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
	//? ?? κ³΅μ??¬?­ ?΄?© ??Έ
	public NoticeBoard noticeBoardContent(int no) {
		Connection conn=getConnection();
		NoticeBoard nb=dao.noticeBoardContent(conn, no);
		close(conn);
		return nb;
	}
	//?λ‘μ΄ κ³΅μ? ??±
	public int noticeWrite(NoticeBoard nb) {
		Connection conn=getConnection();
		int result=dao.noticeWrite(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	//λ§μ?λ§μ ??±? κ³΅μ??¬?­ κΈ? λ²νΈ λΆλ¬?€κΈ?
	public int lastNoticeContentNo(String writer) {
		Connection conn=getConnection();
		int no=dao.lastNoticeContentNo(conn,writer);
		close(conn);
		return no;
	}
	
	public int noticeUpdate(NoticeBoard nb) {
		Connection conn=getConnection();
		int result=dao.noticeUpdate(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	

}
