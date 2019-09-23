package com.umo.freeboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.freeboard.dao.FreeBoardDao;
import com.umo.model.vo.Board;

public class FreeBoardService {
	private FreeBoardDao dao= new FreeBoardDao();
	public int countFreeList() {	
		Connection conn=getConnection();	
		int result=dao.countFreeList(conn);
		close(conn);
		return result;
	}
	//공지 전체 리스트 불러오기
	public List<Board> selectFreeBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<Board> list=dao.selectFreeBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
}
