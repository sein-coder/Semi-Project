package com.umo.admin.dao;

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

import com.umo.admin.dao.AdminDao;
import com.umo.model.vo.Member;

public class AdminDao {
	private Properties prop=new Properties();

	public AdminDao() {
	String path=AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
	try {
		prop.load(new FileReader(path));
		
	}catch(IOException e){
		e.printStackTrace();
	}
}
	
	public List<Member> selectMemberList(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		String sql=prop.getProperty("selectMemberList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);//현재페이지 3이면 11이 나올수 있게 공식을 사용한것.//여기가 1이면
			pstmt.setInt(2, cPage*numPerPage);//끝에 값 범위를 구하기 위해 계산식 쓴것.//여기는 5
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Member m=new Member();
				m.setMemberId(rs.getString("memberId"));
				m.setMemberName(rs.getString("memberName"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setAddress(rs.getString("address"));
				m.setJoin_Date(rs.getDate("join_Date"));
				list.add(m);
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


	
	
}


