package com.umo.notice.model.dao;

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

import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;

//Î∞òÎ≥Ñ Í≤åÏãú?åê DB?†ë?Üç
public class NoticeBoardDao {

	private Properties prop = new Properties();

	public NoticeBoardDao() {
		String path = NoticeBoardDao.class.getResource("/sql/noticeBoard/noticeBoard-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// Í≥µÏ??Ç¨?ï≠ ?†ÑÏ≤? Í∏? Í∞??àò
	public int countNoticeList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("countNoticeList");
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

	// Í≥µÏ??Ç¨?ï≠ ?†ÑÏ≤? Î¶¨Ïä§?ä∏ Î∂àÎü¨?ò§Í∏?
	public List<NoticeBoard> selectNoticeBoardList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeBoard> list = new ArrayList<NoticeBoard>();
		String sql = prop.getProperty("selectNoticeBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cPage);
			pstmt.setInt(2, numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBoard nb = new NoticeBoard();
				nb.setNo(rs.getInt("Notice_no"));
				nb.setWriter(rs.getString("Notice_writer"));
				nb.setTitle(rs.getString("Notice_title"));
				nb.setContent(rs.getString("Notice_contents"));
				nb.setOriginal_filename(rs.getString("Original_filename"));
				nb.setRenamed_filename(rs.getString("renamed_filename"));
				nb.setDate(rs.getDate("Notice_date"));
				nb.setCount(rs.getInt("Notice_count"));
				nb.setWriting_status(rs.getString("writing_status").charAt(0));
				list.add(nb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// Í≥µÏ??Ç¨?ï≠ ?Ç¥?ö© Î∂àÎü¨?ò§Í∏?
	public NoticeBoard noticeBoardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBoard nb = new NoticeBoard();
		String sql = prop.getProperty("noticeBoardContent");
		
<<<<<<< HEAD
		System.out.println("Í≥µÏ??Ç¨?ï≠ ?Ç¥?ö© sql"+sql);
=======
>>>>>>> refs/remotes/origin/purum

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				nb.setNo(rs.getInt("Notice_no"));
				nb.setWriter(rs.getString("Notice_writer"));
				nb.setTitle(rs.getString("Notice_title"));
				nb.setContent(rs.getString("Notice_contents"));
				nb.setOriginal_filename(rs.getString("Original_filename"));
				nb.setRenamed_filename(rs.getString("renamed_filename"));
				nb.setDate(rs.getDate("Notice_date"));
				nb.setCount(rs.getInt("Notice_count"));
				nb.setWriting_status(rs.getString("writing_status").charAt(0));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return nb;

	}

	// ?ÉàÎ°úÏö¥ Í≥µÏ? ?ûë?Ñ±
	public int noticeWrite(Connection conn, NoticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("noticeWrite");
		
<<<<<<< HEAD
		System.out.println("sql?ôï?ù∏"+sql);

=======
>>>>>>> refs/remotes/origin/purum
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nb.getWriter());
			pstmt.setString(2, nb.getTitle());
			pstmt.setString(3, nb.getContent());
			pstmt.setString(4, nb.getOriginal_filename());
			pstmt.setString(5, nb.getRenamed_filename());		
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
    	
	}
	//ÎßàÏ?ÎßâÏóê ?ûë?Ñ±?ïú Í≥µÏ??Ç¨?ï≠ Í∏? Î≤àÌò∏ Î∂àÎü¨?ò§Í∏?
	public int lastNoticeContentNo(Connection conn,String writer) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
		String sql=prop.getProperty("lastNoticeContentNo");
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
	//Í≥µÏ?Í∏? ?Ç≠?†ú?ïòÍ∏?
	public int noticeUpdate(Connection conn,NoticeBoard nb) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("noticeUpdate");
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
	public List<BoardComment> selectnoticeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardComment> list=new ArrayList();
		String sql=prop.getProperty("selectnoticeBoardComment");
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
	public int deletenoticeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deletenoticeBoardComment");
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
	public int insertnoticeBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertNoticeBoardComment");
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
	public int deleteNoticeBoardComment(Connection conn,int no){
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteNoticeBoardComment");
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
	public int noticeDelete(Connection conn,int no)
	{
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("noticeDelete");
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
