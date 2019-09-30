package com.umo.session.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Properties;

import com.umo.notice.model.dao.NoticeBoardDao;
import static common.template.JDBCTemplate.close;

public class SessionDao {

	private Properties prop = new Properties();

	public SessionDao() {
		String path = NoticeBoardDao.class.getResource("/sql/session/session-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	public int insertLog(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertLog");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e){
			return result;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectTodayLogin(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = prop.getProperty("selectTodayLogin");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectallLogin(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = prop.getProperty("selectallLogin");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

}
