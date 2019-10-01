package com.umo.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.admin.dao.AdminDao;
import com.umo.model.vo.Board;
import com.umo.model.vo.Member;


public class AdminService {
	
	private AdminDao dao=new AdminDao();
	
	public List<Board> selectMemberList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Board> list=dao.selectBoardList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	public int selectCountMember() {
		Connection conn=getConnection();
		int result=dao.selectCountMember(conn);
		close(conn);
		return result;
	}

	public List<Board> selectSearch(int cPage, int numPerPage, String type, String keyword) {
		Connection conn=getConnection();
		List<Board> list=dao.selectSearch(conn,cPage,numPerPage,type,keyword);
		close(conn);
		return list;
		
	}

	public int selectSearchCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.selectSerachCount(conn,type,keyword);
		close(conn);
		return result;
	}
	
	public int adoptCountMember()
	{
		Connection conn=getConnection();
		int result=dao.adoptCountMember(conn);
		close(conn);
		return result;
	}

	public List<Member> adoptMemberList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.adoptMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectMemberco(String type,String word)
	{
		Connection conn=getConnection();
		int result=dao.selectMemberco(conn,type,word);
		close(conn);
		return result;
		
		
	}
	
	public List<Member> findmembertype(int cPage,int numPerPage,String type,String word)
	{
		Connection conn=getConnection();
		List<Member> list=dao.findmembertype(conn,cPage,numPerPage,type,word);
				close(conn);
				return list;
		
		
	}
	
	
	
}
