package com.umo.scrap.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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


	public List<Scrap> selectScrapList(Connection conn, int cPage, int numPerPage, String member_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Scrap> list=new ArrayList();
		String sql=prop.getProperty("selectScrapList");
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Scrap sc = new Scrap();
				sc.setMember_id(rs.getString("member_id"));
				sc.setBoard_no(rs.getInt("board_no"));
				sc.setBoard_type(rs.getString("board_type"));
				sc.setBoard_title(rs.getString("board_title"));
				sc.setBoard_writer(rs.getString("board_writer"));
				sc.setBoard_date(rs.getDate("board_date"));
				list.add(sc);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}


	public Scrap selectScrap(Connection conn, String board_type, int board_no,String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectScrap");
		Scrap sc = new Scrap();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board_type);
			pstmt.setInt(2, board_no);
			pstmt.setString(3, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sc = new Scrap();
				sc.setMember_id(rs.getString("member_id"));
				sc.setBoard_no(rs.getInt("board_no"));
				sc.setBoard_type(rs.getString("board_type"));
				sc.setBoard_title(rs.getString("board_title"));
				sc.setBoard_writer(rs.getString("board_writer"));
				sc.setBoard_date(rs.getDate("board_date"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return sc;
	}


	public int selectScrapCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from Scrap_board";
		int result = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}
		
	}
	
	
//insertFoodScrap = insert into Scrap_board values(SEQ_Scrap_BOARD_NO.nextval,?,?,?,default,defalut)

