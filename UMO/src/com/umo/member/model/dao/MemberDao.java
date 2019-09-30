
package com.umo.member.model.dao;


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
		pstmt.setString(4, m.getClass1());
		pstmt.setString(5,m.getEmail());
		pstmt.setInt(6,m.getKhno());
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
				m.setClass1(rs.getString("class"));
				m.setEmail(rs.getString("member_email"));
				m.setKhno(rs.getInt("kh_cNo"));
				m.setPoint(rs.getInt("point"));
			}
			
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
	      System.out.println(m.getMemberPw());
	      try {
	        pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getMemberPw() );
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3,m.getEmail());
			pstmt.setString(4, m.getClass1());
			pstmt.setInt(5,m.getKhno());
			pstmt.setString(6,m.getMemberId());
	 		result=pstmt.executeUpdate();        
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return result;
	   }
	
	public Member selectPointId(Connection conn, String member_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("selectOne");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_password"));
				m.setMemberName(rs.getString("member_name"));
				m.setClass1(rs.getString("class"));
				m.setEmail(rs.getString("member_email"));
				m.setKhno(rs.getInt("kh_cNo"));
				m.setPoint(rs.getInt("point"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}		
		
	public Member idCheck(Connection conn,String id)
	{
		 PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      Member m=null;
	      String sql=prop.getProperty("idcheck");
	      
	      try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					m=new Member();
					m.setMemberId(rs.getString("member_id"));
					m.setMemberName(rs.getString("member_name"));
					m.setClass1(rs.getString("class"));
					m.setEmail(rs.getString("member_email"));
					m.setKhno(rs.getInt("kh_cno"));
				    m.setJoin_date(rs.getDate("join_date"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return m;
		}
	public Member findId(Connection conn, int kH_No) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		String sql=prop.getProperty("findId");
		  
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, kH_No);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setClass1(rs.getString("class"));
				m.setEmail(rs.getString("member_email"));
				m.setKhno(rs.getInt("kh_cno"));
				m.setJoin_date(rs.getDate("join_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
}



	

