package com.umo.scrap.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.umo.food.model.dao.FoodDao;
import com.umo.model.vo.Scrap;

public class ScrapDao {

	private Properties prop = new Properties();
	
	public ScrapDao() {
		String path = FoodDao.class.getResource("/sql/scrap/scrap-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertScrapButton(Connection conn, String board_type, String memberId, int board_no,String board_title,String board_writer,Date board_date) {
		PreparedStatement pstmt=null;
		int result= 0;
		String sql = prop.getProperty("insertScrapButton");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			pstmt.setInt(2, board_no);
			pstmt.setString(3, board_type);
			pstmt.setString(4, board_title);
			pstmt.setString(5, board_writer);
			pstmt.setDate(6, board_date);
			result=pstmt.executeUpdate();	
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	
	}


	public List<Scrap> selectScrapList(Connection conn, String member_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Scrap> list=new ArrayList();
		String sql=prop.getProperty("selectScrapList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs=pstmt.executeQuery();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
		}return list;
	}
		
	}
	
	
//insertFoodScrap = insert into Scrap_board values(SEQ_Scrap_BOARD_NO.nextval,?,?,?,default,defalut)

