package com.umo.freeboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.umo.freeboard.dao.FreeBoardDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.NoticeBoard;

public class FreeBoardService {
	private FreeBoardDao dao= new FreeBoardDao();
	public int countFreeList() {	
		Connection conn=getConnection();	
		int result=dao.countFreeList(conn);
		close(conn);
		return result;
	}
	public List<Board> selectFreeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<Board> list=dao.selectFreeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
	public Board freeBoardContent(int no) {
		Connection conn=getConnection();
		Board b=dao.freeBoardContent(conn, no);
		close(conn);
		return b;
	}
	public int freeWrite(Board fb) {
		Connection conn=getConnection();
		int result=dao.freeWrite(conn,fb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public int lastFreeContentNo(String writer) {
		Connection conn=getConnection();
		int no=dao.lastFreeContentNo(conn,writer);
		close(conn);
		return no;
	}
}
