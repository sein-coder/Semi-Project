package com.umo.freeboard.dao;

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

	public int countFreeList(Connection conn,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "SELECT COUNT(*)AS CNT FROM free_board";
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

	public List<Board> selectFreeBoardList(Connection conn, int cPage, int numPerPage,String name,String userId,String sfl,String stx,String orderType) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();

		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;	
		String order;
		
		switch (orderType) {
		case "count_asc":
			order = "ORDER BY  Free_count ASC,free_No desc";
			break;
		case "count_desc":
			order = "ORDER BY  Free_count DESC,free_No desc";
			break;
		case "date_asc":
			order = "ORDER BY  Free_DATE ASC,free_No desc";
			break;
		case "date_desc":
			order = "ORDER BY  Free_DATE DESC,free_No desc";
			break;
		default:
			order = "ORDER BY  Free_no DESC";
			break;
		}
		
		if(name.equals("myPage")) {
			if(sfl!=null&&stx!=null) {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from free_BOARD where "+sfl+" like '%"+stx+"%' "+order+")a where free_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}else {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from free_BOARD "+order+")a where free_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}
		}else {
			if(sfl!=null&&stx!=null) {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM free_BOARD where "+sfl+" like '%"+stx+"%' "+order+")A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}else {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM free_BOARD "+order+")A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
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
			close(stmt);
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
	public int freeUpdate(Connection conn,Board fb) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("freeUpdate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, fb.getTitle());
			pstmt.setString(2, fb.getContent());
			pstmt.setString(3, fb.getOriginal_filename());
			pstmt.setInt(4, fb.getNo());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return result;
		
		
	}
	public int freeDelete(Connection conn,int no)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("freeDelete");
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
		System.out.println(sql);
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
	public int insertfreeBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertFreeBoardComment");
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
	public List<BoardComment> selectFreeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardComment> list=new ArrayList();
		String sql=prop.getProperty("selectFreeBoardComment");
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
	public int insertFreeBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertFreeBoardComment");
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
	public int deleteFreeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteFreeBoardComment");
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

	public int updatePoint(Connection conn, String writer) {
		Statement stmt=null;
		int result2=0;
		
		String sql="";
		sql="update Member set point=point+10 where Member_id='"+writer+"'";
		
		try {
			stmt=conn.createStatement();
			result2=stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			}
		return result2;
	}
	//댓글 등록시 5점 부여
	public int updateCommentPoint(Connection conn, String writer) {
		Statement stmt=null;
		int result3 = 0;
		
		String sql="";
		sql="update Member set point=point+5 where Member_Id='"+writer+"'";
		try {
			stmt=conn.createStatement();
			result3=stmt.executeUpdate(sql);
			System.out.println(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return 0;
	}
}
