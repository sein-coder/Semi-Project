package com.umo.session.model.service;

import java.sql.Connection;

import com.umo.session.model.dao.SessionDao;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;


public class SessionService {

	private SessionDao dao = new SessionDao();
	
	public int insesrtLog(String id) {
		Connection conn = getConnection();
		int result = dao.insertLog(conn,id);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectTodayLogin() {
		Connection conn = getConnection();
		int result = dao.selectTodayLogin(conn);
		close(conn);
		return result;
	}

	public int selectallLogin() {
		Connection conn = getConnection();
		int result = dao.selectallLogin(conn);
		close(conn);
		return result;
	}

}
