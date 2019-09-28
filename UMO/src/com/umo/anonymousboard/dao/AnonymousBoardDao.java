package com.umo.anonymousboard.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
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
	public int countAnonymousList(Connection conn,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "SELECT COUNT(*)AS CNT FROM Anonymous_board";
		if(sfl!=null&&stx!=null) {
			sql+=" where "+sfl+" like '%"+stx+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;

	}

	public List<Board> selectAnonymousBoardList(Connection conn, int cPage, int numPerPage,String name,String userId,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		
		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		
		if(name.equals("myPage")) {
			if(sfl!=null&&stx!=null) {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from anonymous_board where "+sfl+" like '%"+stx+"%' order by board_date desc)a where board_writer=?)"
						+ " where rnum between "+start+" and "+end;
			}else {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from anonymous_board order by board_date desc)a where board_writer=?)"
						+ " where rnum between "+start+" and "+end;
			}
		}else {
			if(sfl!=null&&stx!=null) {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM Anonymous_BOARD where "+sfl+" like '%"+stx+"%' ORDER BY Board_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}else {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM Anonymous_BOARD ORDER BY Board_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
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
			close(stmt);
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
	public List<BoardComment> selectanonymousBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardComment> list=new ArrayList();
		String sql=prop.getProperty("selectanonymousBoardComment");
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
	public int insertanonymousBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertanonymousBoardComment");
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
	public int deleteanonymousBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteanonymousBoardComment");
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
	public int AnonymousDelete(Connection conn,int no)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("AnonymousDelete");
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
	
}
