package com.umo.anonymousboard.dao;

import static common.template.JDBCTemplate.close;

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
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.dao.NoticeBoardDao;

public class AnonymousBoardDao {
	private Properties prop = new Properties();

	public AnonymousBoardDao() {
		String path = NoticeBoardDao.class.getResource("/sql/anonymousBoard/anonymousboard-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 공지사항 전체 글 갯수
	public int countAnonymousList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("countAnonymousList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}

	public List<Board> selectAnonymousBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = prop.getProperty("selectAnonymousBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNo(rs.getInt("board_no"));
				b.setWriter(rs.getString("board_writer"));
				b.setTitle(rs.getString("board_title"));
				b.setContent(rs.getString("board_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("board_date"));
				b.setCount(rs.getInt("board_count"));
				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public Board anonymousBoardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = new Board();
		String sql = prop.getProperty("anonymousBoardContent");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				b.setNo(rs.getInt("board_no"));
				b.setWriter(rs.getString("board_writer"));
				b.setTitle(rs.getString("board_title"));
				b.setContent(rs.getString("board_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("board_date"));
				b.setCount(rs.getInt("board_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return b;

	}
	public int anonymousWrite(Connection conn, Board ab) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("anonymousWrite");
		
		System.out.println("sql확인"+sql);

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ab.getWriter());
			pstmt.setString(2, ab.getTitle());
			pstmt.setString(3, ab.getContent());
			pstmt.setString(4, ab.getOriginal_filename());
			pstmt.setString(5, ab.getRenamed_filename());		
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
    	
	}
	public int lastAnonymousContentNo(Connection conn,String writer) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql=prop.getProperty("lastAnonymousContentNo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				no=rs.getInt("NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return no;

	}
	public int anonymousUpdate(Connection conn,NoticeBoard nb) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("anonymousUpdate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nb.getTitle());
			pstmt.setString(2, nb.getContent());
			pstmt.setString(3, nb.getOriginal_filename());
			pstmt.setInt(4, nb.getNo());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
		
		
	}
}
