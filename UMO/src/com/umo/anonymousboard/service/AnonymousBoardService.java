package com.umo.anonymousboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.umo.anonymousboard.dao.AnonymousBoardDao;
import com.umo.model.vo.Board;

public class AnonymousBoardService {
	private AnonymousBoardDao dao= new AnonymousBoardDao();
	public int countanonymousList() {	
		Connection conn=getConnection();	
		int result=dao.countAnonymousList(conn);
		close(conn);
		return result;
	}
	public List<Board> selectanonymousBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<Board> list=dao.selectAnonymousBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
	public Board anonymousBoardContent(int no) {
		Connection conn=getConnection();
		Board b=dao.anonymousBoardContent(conn, no);
		close(conn);
		return b;
	}
	public int anonymousWrite(Board ab) {
		Connection conn=getConnection();
		int result=dao.anonymousWrite(conn,ab);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public int lastAnonymousContentNo(String writer) {
		Connection conn=getConnection();
		int no=dao.lastAnonymousContentNo(conn,writer);
		close(conn);
		return no;
	}
}
