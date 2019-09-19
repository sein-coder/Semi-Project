package com.umo.memberDao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.umo.model.vo.Member;

import static common.template.JDBCTemplate.close;

public class MemberDao {
private Properties prop=new Properties();

public MemberDao() {
	String path=MemberDao.class.getResource("/sql/member/member.properties").getPath();
	try {
	prop.load(new FileReader(path));
	}catch(IOException e)
	{
		e.printStackTrace();
		
	}
	
}
public int insertMember(Connection conn,Member m)
{
	PreparedStatement pstmt=null;
	int result=0;
	String sql=prop.getProperty("insertMember");
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,m.getMemberId());
		pstmt.setString(2,m.getMemberPw() );
		pstmt.setString(3, m.getMemberName());
		pstmt.setString(4,m.getEmail());
		pstmt.setString(5, m.getPhone());
		pstmt.setString(6, m.getAddress());
		result=pstmt.executeUpdate();
	}catch(SQLException e)
	{
		e.printStackTrace();
	}finally {
		close(pstmt);
		
	}return result;
	
	
}
	public Member selectId(Connection conn,String id,String pw)
	{
		System.out.println(id+pw);
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("selectId");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_password"));
				m.setMemberName(rs.getString("member_name"));
				m.setEmail(rs.getString("member_email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
			}
			System.out.println(m.getMemberId());
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;		
	}
		
	public int updateMember(Connection conn, Member m) {
	      PreparedStatement pstmt=null;
	      int result=0;
	      String sql=prop.getProperty("updateMember");
	      try {
	        pstmt=conn.prepareStatement(sql);
	 		pstmt.setString(1,m.getMemberPw());
	 		pstmt.setString(2, m.getMemberName());
	 		pstmt.setString(3,m.getEmail());
	 		pstmt.setString(4, m.getPhone());
	 		pstmt.setString(5, m.getAddress());
	 		pstmt.setString(6,m.getMemberId());
	 		result=pstmt.executeUpdate();        
	         System.out.println(" "+result);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return result;
	   }	
		
	
		
		
		
		}


	

