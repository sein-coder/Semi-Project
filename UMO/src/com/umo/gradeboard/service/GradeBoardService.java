package com.umo.gradeboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.umo.gradeboard.dao.GradeBoardDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;

public class GradeBoardService {
	private GradeBoardDao dao= new GradeBoardDao();
	public int countGradeList() {	
		Connection conn=getConnection();	
		int result=dao.countGradeList(conn);
		close(conn);
		return result;
	}
	public List<Board> selectGradeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<Board> list=dao.selectGradeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
	public Board GradeBoardContent(int no) {
		Connection conn=getConnection();
		Board b=dao.GradeBoardContent(conn, no);
		close(conn);
		return b;
	}
	public int GradeWrite(Board fb) {
		Connection conn=getConnection();
		int result=dao.GradeWrite(conn,fb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public int lastGradeContentNo(String writer) {
		Connection conn=getConnection();
		int no=dao.lastGradeContentNo(conn,writer);
		close(conn);
		return no;
	}
	public int GradeUpdate(NoticeBoard nb) {
		System.out.println(nb.getOriginal_filename()+" "+nb.getRenamed_filename());
		Connection conn=getConnection();
		int result=dao.GradeUpdate(conn,nb);
		
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		
		return result;
	}
	public int GradeDelete(int no)
	{
		Connection conn=getConnection();
		int result=dao.GradeDelete(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public Board selectGradeBoard(int no,boolean hasRead) {
		Connection conn=getConnection();
		Board b=dao.GradeBoardContent(conn,no);
		if(!hasRead&&b!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) {commit(conn);}
			else {rollback(conn);}
		}
		close(conn);
		return b;
	}
	public List<BoardComment> selectGradeBoardComment(int no){
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectGradeBoardComment(conn,no);
		close(conn);
		return list;
	}
	public int insertGradeBoardComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertgradeBoardComment(conn,bc);
		if(result>0) {
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
		
	}
	public int deleteGradeBoardComment(int no) {
		Connection conn=getConnection();
		int result=dao.deleteGradeBoardComment(conn,no);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
}
