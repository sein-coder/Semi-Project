package com.umo.inquery.model.service;

import java.sql.Connection;
import java.util.List;

import com.umo.inquery.model.dao.InqueryDao;
import com.umo.model.vo.Inquery;

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

	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<Inquery> selectInqueryBoardList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Inquery> list = dao.selectInqueryBoardList(conn,cPage,numPerPage);
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
	
}
