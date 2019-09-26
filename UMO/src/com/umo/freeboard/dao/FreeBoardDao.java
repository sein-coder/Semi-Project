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

	public int selectCountWriter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;//컬럼으로 불러오기 때문에 필요함
		int result=0;
		String sql=prop.getProperty("selectCountWriter");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}return result;
	
}
	
	
	public List<Board> selectSearch(Connection conn, int cPage, int numPerPage, String type, String keyword) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		
		 sql="select * from (select rownum as rnum,a.* "
	        		+ "from  (select * "
	        			+ "from free_board "
	        			+" where "+type+" like '%"+keyword+"%')a)"
	        					+ "where rnum between "+start+" and "+end;
		
		 try {
	        	stmt=conn.createStatement();
	        	rs=stmt.executeQuery(sql);
	        	while(rs.next()) {
	        		Board b=new Board();
					b.setNo(rs.getInt("no"));//글번호
					b.setWriter(rs.getString("writer"));
					b.setTitle(rs.getString("title"));
					b.setContent(rs.getString("content"));
					b.setOriginal_filename(rs.getString("original_filename"));
					b.setRenamed_filename(rs.getString("renamed_filename"));
					b.setDate(rs.getDate("date"));
					b.setCount(rs.getInt("count"));//조회수
					b.setWriting_status(rs.getString("writing_status").charAt(0));
					list.add(b);
	        	}
	        }catch(SQLException e) {
	        	e.printStackTrace();
	        }finally{
	        	close(rs);
	        	close(stmt);
	        }return list;
		}

	public int selectSearchCount(Connection conn, String type, String keyword) {
		ResultSet rs=null;
		Statement stmt=null;
		int result=0;
		String sql="";
		
		sql="select count(*) from free_board "+ "where "+type+" like '%"+keyword+"%'";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	
	}

	

	
		
}

		


