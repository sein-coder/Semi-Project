package com.umo.inquery.model.service;

import java.sql.Connection;
import java.util.List;

import com.umo.inquery.model.dao.InqueryDao;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.InqueryComment;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

public class InqueryService {
	
	private InqueryDao dao = new InqueryDao();

	public int insertInquery(Inquery inquery) {
		Connection conn = getConnection();
		int result = dao.insertInquery(conn,inquery);
		
		if(result>0) { commit(conn); }
		else { rollback(conn); }
		close(conn);
		
		return result;
	}

	public int selectBoardCount(String sfl,String stx) {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn,sfl,stx);
		
		close(conn);
		
		return result;
	}

	public List<Inquery> selectInqueryBoardList(int cPage, int numPerPage,String name,String userId,String sfl,String stx) {
		Connection conn = getConnection();
		List<Inquery> list = dao.selectInqueryBoardList(conn,cPage,numPerPage,name,userId,sfl,stx);
		close(conn);
		return list;
	}

	public Inquery selectBoardView(int board_No) {
		Connection conn = getConnection();
		Inquery inquery = dao.selectBoardView(conn, board_No);
		close(conn);
		return inquery;
	}

	public int deleteInquery(int Board_No) {
		Connection conn = getConnection();
		int result = dao.deleteInquery(conn,Board_No);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateInquery(Inquery inquery) {
		Connection conn = getConnection();
		int result = dao.updateInquery(conn,inquery);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<InqueryComment> selectComment(int board_No) {
		Connection conn = getConnection();
		List<InqueryComment> list = dao.selectComment(conn,board_No);
		close(conn);
		return list;
	}

	public int insertInqueryComment(InqueryComment inqueryComment) {
		Connection conn = getConnection();
		int result = dao.insertInqueryComment(conn,inqueryComment);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteInqueryComment(int boardRef, int boardCommentNo) {
		Connection conn = getConnection();
		int result = dao.deleteInqueryComment(conn,boardRef,boardCommentNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
