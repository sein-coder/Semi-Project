package com.umo.myPage.model.dao;

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

import com.umo.member.model.dao.MemberDao;
import com.umo.model.vo.Comment;
import com.umo.model.vo.Food;
import com.umo.model.vo.Member;

public class MyPageDao {
	private Properties prop=new Properties();
	public MyPageDao() {
	      String path=MemberDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
	      try {
	         prop.load(new FileReader(path));
	      }catch(IOException e) {
	         e.printStackTrace();
	      }
	   }
	public int selectAttendance(Connection conn,String userId,int attendance) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      String sql=prop.getProperty("selectAttendance");
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	        	 attendance=rs.getInt("ceil(ABS(join_date-sysdate))");
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return attendance;
	   }
	
	public Member selectOne(Connection conn,String userId) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      Member m=null;
	      String sql=prop.getProperty("selectOne");
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, userId);
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	        	 m=new Member();
					m.setMemberId(rs.getString("member_id"));
					m.setMemberPw(rs.getString("member_password"));
					m.setMemberName(rs.getString("member_name"));
					m.setEmail(rs.getString("member_email"));
					m.setClass1(rs.getString("class"));
					m.setKhno(rs.getInt("kh_cno"));
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return m;
	   }
	public List<Comment> selectNoticeCommentList(Connection conn, int cPage, int numPerPage,String name,String userId,String comment) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList();
		String sql="";
		if(name.equals("myPage")) {
			if(comment.equals("Notice_Comment")) {
				sql = prop.getProperty("selectNoticeCommentList");
			}else if(comment.equals("Food_Comment")) {
				sql = prop.getProperty("selectFoodCommentList");
			}else if(comment.equals("INQUERY_COMMENT")) {
				sql = prop.getProperty("selectinqueryCommentList");
			}else if(comment.equals("grade_COMMENT")) {
				sql = prop.getProperty("selectgradeCommentList");
			}else if(comment.equals("free_COMMENT")) {
				sql = prop.getProperty("selectfreeCommentList");
			}else if(comment.equals("anonymous_COMMENT")) {
				sql = prop.getProperty("selectanonymousCommentList");
			}
			
		}else {
			
		}
		try {
			pstmt = conn.prepareStatement(sql);
			if(name.equals("myPage")) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, (cPage-1)*numPerPage+1);
				pstmt.setInt(3, cPage*numPerPage);
				}else {

				}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setComment_no(rs.getInt("comment_no"));
				c.setComment_writer(rs.getString("comment_writer"));
				c.setComment_contents(rs.getString("comment_contents"));
				c.setComment_date(rs.getDate("comment_date"));
				c.setBoard_no_ref(rs.getInt("board_no_ref"));
				c.setComment_level(rs.getInt("comment_level"));
				c.setComment_refno(rs.getInt("comment_refno"));
				
				list.add(c);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

}
