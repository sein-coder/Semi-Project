package com.umo.inquery.model.service;

import java.sql.Connection;

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
	
}
