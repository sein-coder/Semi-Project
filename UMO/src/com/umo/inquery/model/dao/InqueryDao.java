package com.umo.inquery.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.umo.model.vo.Inquery;

import static common.template.JDBCTemplate.close;

public class InqueryDao {
	
	private Properties prop = new Properties();

	public InqueryDao() {
		String path = InqueryDao.class.getResource("/sql/inquery/inquery-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	

	public int insertInquery(Connection conn, Inquery inquery) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertInquery");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquery.getBoard_Writer());
			pstmt.setString(2, inquery.getBoard_Title());
			pstmt.setString(3, inquery.getBoard_Contents());
			pstmt.setString(4, inquery.getInputCode());
			pstmt.setString(5, inquery.getOutputCode());
			pstmt.setString(6, inquery.getCode_Type());
			pstmt.setString(7, inquery.getOriginal_FileName());
			pstmt.setString(8, inquery.getRenamed_FileName());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
