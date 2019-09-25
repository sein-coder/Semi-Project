package com.umo.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.admin.dao.AdminDao;
import com.umo.model.vo.Member;


public class AdminService {
	
	private AdminDao dao=new AdminDao();
	
	public List<Member> selectMemberList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public List<Member> selectSearch(int cPage, int numPerPage, String type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectSearchCount(String type, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
