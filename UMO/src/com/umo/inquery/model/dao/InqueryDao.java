package com.umo.inquery.model.dao;

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

import javax.crypto.spec.PSource;

import com.umo.model.vo.Inquery;
import com.umo.model.vo.InqueryComment;

import oracle.jdbc.proxy.annotation.Pre;

import static common.template.JDBCTemplate.close;

public class InqueryDao {
	
	private Properties prop = new Properties();

	public InqueryDao() {
		String path = InqueryDao.class.getResource("/sql/inquery/inquery-query.properties").getPath();

		try {

			prop.load(new FileReader(path));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	

	public int insertInquery(Connection conn, Inquery inquery) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertInquery");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquery.getBoard_Writer());
			pstmt.setString(2, inquery.getBoard_Title());
			pstmt.setString(3, inquery.getBoard_Contents());
			pstmt.setString(4, inquery.getInputCode());
			pstmt.setString(5, inquery.getOutputCode());
			pstmt.setString(6, inquery.getCode_Type());
			pstmt.setString(7, inquery.getOriginal_FileName());
			pstmt.setString(8, inquery.getRenamed_FileName());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int selectBoardCount(Connection conn,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from Inquery_board";
		int result = 0;
		if(sfl!=null&&stx!=null) {
			sql+=" where "+sfl+" like '%"+stx+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}


	public List<Inquery> selectInqueryBoardList(Connection conn, int cPage, int numPerPage,String name,String userId,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Inquery> list = new ArrayList();
		
		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		
		if(name.equals("myPage")) {
			if(sfl!=null&&stx!=null) {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from Inquery_board where "+sfl+" like '%"+stx+"%' order by board_date desc)a where board_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}else {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from Inquery_board order by board_date desc)a where board_writer='"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}
		}else {
			if(sfl!=null&&stx!=null) {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM Inquery_board where "+sfl+" like '%"+stx+"%' ORDER BY board_date DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}else {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM Inquery_board ORDER BY board_date DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Inquery inquery = new Inquery();
				inquery.setBoard_No(rs.getInt("Board_No"));
				inquery.setBoard_Writer(rs.getString("Board_Writer"));
				inquery.setBoard_Title(rs.getString("board_Title"));
				inquery.setBoard_Contents(rs.getString("board_Contents"));
				inquery.setInputCode(rs.getString("inputCode"));
				inquery.setOutputCode(rs.getString("outputCode"));
				inquery.setCode_Type(rs.getString("code_Type"));
				inquery.setOriginal_FileName(rs.getString("original_FileName"));
				inquery.setRenamed_FileName(rs.getString("renamed_FileName"));
				inquery.setBoard_Date(rs.getDate("board_Date"));
				inquery.setBoard_Count(rs.getInt("board_Count"));
				inquery.setWriting_Status(rs.getString("writing_Status").charAt(0));
				list.add(inquery);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		
		
		return list;
	}


	public Inquery selectBoardView(Connection conn, int board_No) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBoardView");
		Inquery inquery = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				inquery = new Inquery();
				inquery.setBoard_No(rs.getInt("Board_No"));
				inquery.setBoard_Writer(rs.getString("Board_Writer"));
				inquery.setBoard_Title(rs.getString("board_Title"));
				inquery.setBoard_Contents(rs.getString("board_Contents"));
				inquery.setInputCode(rs.getString("inputCode"));
				inquery.setOutputCode(rs.getString("outputCode"));
				inquery.setCode_Type(rs.getString("code_Type"));
				inquery.setOriginal_FileName(rs.getString("original_FileName"));
				inquery.setRenamed_FileName(rs.getString("renamed_FileName"));
				inquery.setBoard_Date(rs.getDate("board_Date"));
				inquery.setBoard_Count(rs.getInt("board_Count"));
				inquery.setWriting_Status(rs.getString("writing_Status").charAt(0));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return inquery;
	}


	public int updateInquery(Connection conn, Inquery inquery) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateInquery");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquery.getBoard_Title());
			pstmt.setString(2, inquery.getBoard_Contents());
			pstmt.setString(3, inquery.getInputCode());
			pstmt.setString(4, inquery.getOutputCode());
			pstmt.setString(5, inquery.getOriginal_FileName());
			pstmt.setString(6, inquery.getRenamed_FileName());
			pstmt.setInt(7, inquery.getBoard_No());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteInquery(Connection conn, int board_No) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteInquery");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public List<InqueryComment> selectComment(Connection conn, int board_No) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<InqueryComment> list = new ArrayList();
		String sql = prop.getProperty("selectComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InqueryComment comment = new InqueryComment();
				comment.setComment_no(rs.getInt("comment_no"));
				comment.setComment_contents(rs.getString("comment_contents"));
				comment.setComment_writer(rs.getString("comment_writer"));
				comment.setComment_level(rs.getInt("comment_level"));
				comment.setComment_Refno(rs.getInt("comment_Refno"));
				comment.setBoard_no_Ref(rs.getInt("board_no_Ref"));
				comment.setComment_date(rs.getDate("comment_date"));
				list.add(comment);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	public int insertInqueryComment(Connection conn, InqueryComment inqueryComment) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertInqueryComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,inqueryComment.getComment_writer() );
			pstmt.setString(2,inqueryComment.getComment_contents() );
			pstmt.setInt(3, inqueryComment.getBoard_no_Ref());
			pstmt.setInt(4, inqueryComment.getComment_level());
			pstmt.setInt(5, inqueryComment.getComment_Refno());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteInqueryComment(Connection conn, int boardRef, int boardCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteInqueryComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardRef);
			pstmt.setInt(2, boardCommentNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
