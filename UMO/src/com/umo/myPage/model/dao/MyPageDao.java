package com.umo.myPage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static common.template.JDBCTemplate.close;

import com.umo.member.model.dao.MemberDao;
import com.umo.model.vo.Member;
import com.umo.notice.model.vo.NoticeBoard;

public class MyPageDao {
	private Properties prop=new Properties();
	public MyPageDao() {
	      String path=MemberDao.class.getResource("/sql/member/member.properties").getPath();
	      try {
	         prop.load(new FileReader(path));
	      }catch(IOException e) {
	         e.printStackTrace();
	      }
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
					m.setPhone(rs.getString("phone"));
					m.setAddress(rs.getString("address"));
	         }
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return m;
	   }


}
