package com.umo.notice.model.dao;

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

//반별 게시?�� DB?��?��
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

	// 공�??��?�� ?���? �? �??��
	public int countNoticeList(Connection conn,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "SELECT COUNT(*)AS CNT FROM Notice_board";

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

	// 공�??��?�� ?���? 리스?�� 불러?���?
	public List<NoticeBoard> selectNoticeBoardList(Connection conn, int cPage, int numPerPage,String sfl,String stx, String orderType) {
		Statement stmt = null;
		ResultSet rs = null;
		List<NoticeBoard> list = new ArrayList<NoticeBoard>();

		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		String order;
		
		switch (orderType) {
		case "count_asc":
			order = "ORDER BY  NOTICE_COUNT ASC,NOTICE_NO DESC";
			break;
		case "count_desc":
			order = "ORDER BY  NOTICE_COUNT DESC,NOTICE_NO DESC";
			break;
		case "date_asc":
			order = "ORDER BY  NOTICE_DATE ASC,NOTICE_NO DESC";
			break;
		case "date_desc":
			order = "ORDER BY  NOTICE_DATE DESC,NOTICE_NO DESC";
			break;
		default:
			order = "ORDER BY  NOTICE_NO DESC";
			break;
		}
		
		if(sfl!=null&&stx!=null) { //검색용
			sql="SELECT * FROM "
					+ "(SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT * FROM NOTICE_BOARD where "+sfl+" like '%"+stx+"%' "+order+ " )A ) "
					+ "WHERE RNUM BETWEEN "+ start+" AND "+end;
		}else { //전체검색
			sql="SELECT * FROM "
					+ "(SELECT ROWNUM AS RNUM, A.* FROM "
					+ "(SELECT * FROM NOTICE_BOARD "+order+")A ) "
					+ "WHERE RNUM BETWEEN "+start+" AND "+end;
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
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
			close(stmt);
		}
		return list;
	}

	// 공�??��?�� ?��?�� 불러?���?
	public NoticeBoard noticeBoardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeBoard nb = new NoticeBoard();
		String sql = prop.getProperty("noticeBoardContent");

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

	// ?��로운 공�? ?��?��
	public int noticeWrite(Connection conn, NoticeBoard nb) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("noticeWrite");
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
	//마�?막에 ?��?��?�� 공�??��?�� �? 번호 불러?���?
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
	//공�?�? ?��?��?���?
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
	public int updatePoint(Connection conn, String writer) {
		Statement stmt = null;
		int result2 =0;
		
		String sql = "";
		sql = "update Member set point= point+10 where Member_id = '"+writer+"'";
		try {
			stmt = conn.createStatement();
			result2 = stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result2;
	}

	//댓글 등록시 포인트 5점 부여
	public int updateCommentPoint(Connection conn, String writer) {
		Statement stmt=null;
		int result3 = 0;
		
		String sql="";
		sql="update Member set point=point+5 where Member_Id='"+writer+"'";
		try {
			stmt=conn.createStatement();
			result3=stmt.executeUpdate(sql);
			//System.out.println(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result3;
	}
	
	public List<Board> selectNoticeboardList(Connection conn, int cPage, int numPerPage,String name,String userId,String sfl,String stx) {
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
						+ "(select * from notice_BOARD where "+sfl+" like '%"+stx+"%' order by notice_DATE desc)a where notice_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}else {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from notice_BOARD order by notice_DATE desc)a where notice_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}
		}else {
			if(sfl!=null&&stx!=null) {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM notice_BOARD where "+sfl+" like '%"+stx+"%' ORDER BY notice_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}else {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM notice_BOARD ORDER BY notice_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Board b = new Board();
				b.setNo(rs.getInt("notice_no"));
				b.setWriter(rs.getString("notice_writer"));
				b.setTitle(rs.getString("notice_title"));
				b.setContent(rs.getString("notice_contents"));
				b.setOriginal_filename(rs.getString("Original_filename"));
				b.setRenamed_filename(rs.getString("renamed_filename"));
				b.setDate(rs.getDate("notice_date"));
				b.setCount(rs.getInt("notice_count"));
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
}
