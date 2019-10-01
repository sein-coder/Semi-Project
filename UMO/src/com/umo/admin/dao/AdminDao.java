package com.umo.admin.dao;

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

import com.umo.admin.dao.AdminDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.Member;

public class AdminDao {
	private Properties prop=new Properties();

	public AdminDao() {
	String path=AdminDao.class.getResource("/sql/search/search-query.properties").getPath();
	try {
		prop.load(new FileReader(path));
		
	}catch(IOException e){
		e.printStackTrace();
	}
}
//	
	public List<Board> selectBoardList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		String sql=prop.getProperty("selectboardList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);//현재페이지 3이면 11이 나올수 있게 공식을 사용한것.//여기가 1이면
			pstmt.setInt(2, cPage*numPerPage);//끝에 값 범위를 구하기 위해 계산식 쓴것.//여기는 5
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b=new Board();
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				list.add(b);
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return list;
	}
//
	public List<Board> selectSearch(Connection conn, int cPage, int numPerPage, String type, String keyword) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		String sql="";
		
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		
		sql="select * from (select rownum as rnum,a.* "
				+"from (select * "
				+"from free_board "
				+" where " +type+" like '%"+keyword+"%')a)"
					+"where  rnum between "+start+" and "+end;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Board b=new Board();
				b.setWriter(rs.getString("writer"));
				b.setContent(rs.getString("content"));
				b.setTitle(rs.getString("title"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return list;
	
	}

	public int selectCountMember(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountMember");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int selectSerachCount(Connection conn, String type, String keyword) {
		ResultSet rs=null;
		Statement stmt=null;
		int result=0;
		
		String sql="";
		
		sql="select count(*) from free_board "+ "where "+type+"like '%"+keyword+"%'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public int adoptCountMember(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("adoptCountMember");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		    }catch (SQLException e) {
			e.printStackTrace();
		  }finally {
			        close(rs);
			        close(pstmt);
		           }return result;
	}
	
	public List<Member> adoptMemberList(Connection conn,int cPage,int numPerPage)
	{
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		String sql=prop.getProperty("adoptMemberList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setClass1(rs.getString("class"));
				m.setEmail(rs.getString("member_email"));
				m.setKhno(rs.getLong("kh_cno"));
				m.setJoin_date(rs.getDate("join_date"));
				list.add(m);				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
		
		
	}
	
	public int selectMemberco(Connection conn,String type,String word)
	{
		Statement stmt=null;
		int result=0;
		ResultSet rs=null;
		String sql="";
		sql="select count(*) from member "+ " where "+type+" like '%"+word+"%'";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				result=rs.getInt(1);
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}
		return result;
		
		
	}
	
	public List<Member> findmembertype(Connection conn,int cPage,int numPerPage,String type,String word)
	{
		Statement stmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		
		sql="select * from (select rownum as rnum, a.* "+ "from (select * from member "
				+ "where "+type+" like '%"+word+"%')a)  where rnum between "+start+" and "+end;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				Member m=new Member();
				m.setMemberId(rs.getString("member_id"));
				m.setMemberName(rs.getString("member_name"));
				m.setClass1(rs.getString("class"));
				m.setEmail(rs.getString("member_email"));
				m.setKhno(rs.getLong("kh_cNo"));
				m.setJoin_date(rs.getDate("join_date"));
				list.add(m);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rs);
		}return list;
		
		
	}
	
	
	
}


