package com.umo.freeboard.dao;

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

public class FreeBoardDao {
	private Properties prop = new Properties();

	public FreeBoardDao() {
		String path = NoticeBoardDao.class.getResource("/sql/freeBoard/freeboard-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int countFreeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("countFreeList");
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

	public List<Board> selectFreeBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = prop.getProperty("selectFreeBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNo(rs.getInt("Free_no"));
				b.setWriter(rs.getString("Free_writer"));
				b.setTitle(rs.getString("Free_title"));
				b.setContent(rs.getString("Free_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("Free_date"));
				b.setCount(rs.getInt("Free_count"));
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
	public Board freeBoardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = new Board();
		String sql = prop.getProperty("freeBoardContent");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				b.setNo(rs.getInt("free_no"));
				b.setWriter(rs.getString("free_writer"));
				b.setTitle(rs.getString("free_title"));
				b.setContent(rs.getString("free_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("free_date"));
				b.setCount(rs.getInt("free_count"));
				b.setWriting_status(rs.getString("writing_status").charAt(0));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return b;

	}
	public int freeWrite(Connection conn, Board fb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("freeWrite");
		
		System.out.println("sql확인"+sql);

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fb.getWriter());
			pstmt.setString(2, fb.getTitle());
			pstmt.setString(3, fb.getContent());
			pstmt.setString(4, fb.getOriginal_filename());
			pstmt.setString(5, fb.getRenamed_filename());		
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
    	
	}
	public int lastFreeContentNo(Connection conn,String writer) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql=prop.getProperty("lastFreeContentNo");
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
	public int freeUpdate(Connection conn,NoticeBoard nb) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("freeUpdate");
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
