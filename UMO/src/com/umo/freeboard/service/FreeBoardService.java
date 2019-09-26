package com.umo.freeboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import com.umo.freeboard.dao.FreeBoardDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
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
	public int freeUpdate(NoticeBoard nb) {
		System.out.println(nb.getOriginal_filename()+" "+nb.getRenamed_filename());
		Connection conn=getConnection();
		int result=dao.freeUpdate(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public int freeDelete(int no)
	{
		Connection conn=getConnection();
		int result=dao.freeDelete(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public Board selectfreeBoard(int no,boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.freeBoardContent(conn,no);
		if(!hasRead&&b!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) {commit(conn);}
			else {rollback(conn);}
		}
		close(conn);
		return b;
	}
	public List<BoardComment> selectFreeBoardComment(int no){
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectFreeBoardComment(conn,no);
		close(conn);
		return list;
	}
	public int insertFreeBoardComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertFreeBoardComment(conn,bc);
		if(result>0) {
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
		
	}
	public int deleteFreeBoardComment(int no) {
		Connection conn=getConnection();
		int result=dao.deleteFreeBoardComment(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int selectCountWriter() {
		Connection conn=getConnection();
		int result=dao.selectCountWriter(conn);
		close(conn);
		return result;
	}
	
	
	//검색된 결과 중 numPerPage갯수만큼만 조회
	public List<Board> selectSearch(int cPage,int numPerPage,String type, String keyword) {
		Connection conn=getConnection();
		List<Board> list=dao.selectSearch(conn,cPage,numPerPage,type,keyword);	
		close(conn);
		return list;
	
	}
	//검색에 대한 전체 자료수
	public int selectSearchCount(String type,String keyword) {
		Connection conn=getConnection();
		int result=dao.selectSearchCount(conn, type, keyword);
		close(conn);
		return result;
	}
	public List<Board> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
