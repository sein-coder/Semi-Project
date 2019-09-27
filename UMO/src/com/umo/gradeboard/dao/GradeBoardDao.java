package com.umo.gradeboard.dao;

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
import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.dao.NoticeBoardDao;

public class GradeBoardDao {
	private Properties prop = new Properties();

	public GradeBoardDao() {
		String path = GradeBoardDao.class.getResource("/sql/gradeBoard/gradeboard-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int countGradeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("countGradeList");
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

	public List<Board> selectGradeBoardList(Connection conn, int cPage, int numPerPage,String name,String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql="";
		if(name.equals("myPage")) {
			sql = prop.getProperty("selectMyGradeBoardList");
		}else {
			sql = prop.getProperty("selectGradeBoardList");
		}
		try {
			pstmt = conn.prepareStatement(sql);
			if(name.equals("myPage")) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, (cPage-1)*numPerPage+1);
				pstmt.setInt(3, cPage*numPerPage);
				}else {
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
				}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board b = new Board();
				b.setNo(rs.getInt("grade_no"));
				b.setWriter(rs.getString("grade_writer"));
				b.setTitle(rs.getString("grade_title"));
				b.setContent(rs.getString("grade_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("grade_date"));
				b.setCount(rs.getInt("grade_count"));
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
	public Board GradeBoardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = new Board();
		String sql = prop.getProperty("gradeBoardContent");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				b.setNo(rs.getInt("grade_no"));	
				b.setWriter(rs.getString("grade_writer"));
				b.setTitle(rs.getString("grade_title"));
				b.setContent(rs.getString("grade_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("grade_date"));
				b.setCount(rs.getInt("grade_count"));
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
	public int GradeWrite(Connection conn, Board fb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("gradeWrite");

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
	public int lastGradeContentNo(Connection conn,String writer) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql=prop.getProperty("lastGradeContentNo");
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
	public int GradeUpdate(Connection conn,NoticeBoard nb) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("gradeUpdate");
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
	public int GradeDelete(Connection conn,int no)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("GradeDelete");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			result=pstmt.executeUpdate();
		}catch(SQLException e)
		{e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	
}
	public int updateReadCount(Connection conn,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateReadCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertgradeBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertGradeBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bc.getBoardCommentWriter());
			pstmt.setString(2, bc.getBoardCommentContent());
			pstmt.setInt(3, bc.getBoardRef());
			pstmt.setInt(4, bc.getBoardCommentLevel());
			pstmt.setString(5, bc.getBoardCommentRef()==0?null:String.valueOf(bc.getBoardCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}return result;
		
	}
	public List<BoardComment> selectGradeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardComment> list=new ArrayList();
		String sql=prop.getProperty("selectGradeBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardComment bc=new BoardComment();
				bc.setBoardCommentNo(rs.getInt("comment_no"));
				bc.setBoardCommentWriter(rs.getString("comment_writer"));
				bc.setBoardCommentContent(rs.getString("comment_contents"));
				bc.setBoardCommentDate(rs.getDate("comment_date"));
				bc.setBoardRef(rs.getInt("board_no_ref"));
				bc.setBoardCommentLevel(rs.getInt("comment_level"));
				bc.setBoardCommentRef(rs.getInt("comment_refno"));
				list.add(bc);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int insertGradeBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertGradeBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bc.getBoardCommentWriter());
			pstmt.setString(2, bc.getBoardCommentContent());
			pstmt.setInt(3, bc.getBoardRef());
			pstmt.setInt(4, bc.getBoardCommentLevel());
			pstmt.setString(5, bc.getBoardCommentRef()==0?null:String.valueOf(bc.getBoardCommentRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}return result;
		
	}
	public int deleteGradeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteGradeBoardComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
