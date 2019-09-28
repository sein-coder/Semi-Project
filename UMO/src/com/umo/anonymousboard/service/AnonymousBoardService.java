package com.umo.anonymousboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.umo.anonymousboard.dao.AnonymousBoardDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;

public class AnonymousBoardService {
	private AnonymousBoardDao dao= new AnonymousBoardDao();
	public int countanonymousList(String sfl,String stx) {	
		Connection conn=getConnection();	
		int result=dao.countAnonymousList(conn,sfl,stx);
		close(conn);
		return result;
	}
	public List<Board> selectanonymousBoardList(int cPage, int numPerPage,String name,String userId,String sfl,String stx){
		Connection conn=getConnection();		
		List<Board> list=dao.selectAnonymousBoardList(conn, cPage, numPerPage,name,userId,sfl,stx);
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
	public int anonymousUpdate(NoticeBoard nb) {
		System.out.println(nb.getOriginal_filename()+" "+nb.getRenamed_filename());
		Connection conn=getConnection();
		int result=dao.anonymousUpdate(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public Board selectanonymousBoard(int no,boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.anonymousBoardContent(conn,no);
		if(!hasRead&&b!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) {commit(conn);}
			else {rollback(conn);}
		}
		close(conn);
		return b;
	}
	public List<BoardComment> selectanonymousBoardComment(int no){
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectanonymousBoardComment(conn,no);
		close(conn);
		return list;
	}
	public int insertanonymousBoardComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertanonymousBoardComment(conn,bc);
		if(result>0) {
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
		
	}
	public int deleteanonymousBoardComment(int no) {
		Connection conn=getConnection();
		int result=dao.deleteanonymousBoardComment(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int AnonymousDelete(int no)
	{
		Connection conn=getConnection();
		int result=dao.AnonymousDelete(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
}
