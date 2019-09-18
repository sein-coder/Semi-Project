package com.umo.board.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.umo.model.vo.Board;

import static common.template.JDBCTemplate.*;


//반별 게시판 DB접속
public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(path));
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	//반별 게시판 글목록 불러오기
	public List<Board> selectBoardClassList(Connection conn, int cPage, int numPerPage, String boardType){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList<Board>();
		String sql=prop.getProperty("selectBoardClassList");//sql문 수정해야 함
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
			pstmt.setString(3, boardType);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board cb=new Board();
				cb.setNo(rs.getInt("class_no"));
				cb.setWriter(rs.getString("class_writer"));
				cb.setTitle(rs.getString("calss_title"));
				cb.setContent(rs.getString("class_content"));
				cb.setOriginal_filename(rs.getString("original_filename"));
				cb.setRenamed_filename(rs.getString("renamed_filename"));
				cb.setDate(rs.getDate("class_date"));
				cb.setCount(rs.getInt("class_count"));
				cb.setWriting_status(rs.getString("writing_status").charAt(0));
				cb.setBoard_grade(rs.getInt("board_grade"));			
				list.add(cb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { 
			close(rs); close(pstmt);
		}return list;		
	}
	
	
	

}
