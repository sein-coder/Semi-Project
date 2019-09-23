package com.umo.anonymousboard.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.umo.anonymousboard.dao.AnonymousBoardDao;
import com.umo.model.vo.Board;

public class AnonymousBoardService {
	private AnonymousBoardDao dao= new AnonymousBoardDao();
	public int countanonymousList() {	
		Connection conn=getConnection();	
		int result=dao.countAnonymousList(conn);
		close(conn);
		return result;
	}
	//공지 전체 리스트 불러오기
	public List<Board> selectanonymousBoardList(int cPage, int numPerPage){
		Connection conn=getConnection();		
		List<Board> list=dao.selectAnonymousBoardList(conn, cPage, numPerPage);
		close(conn);	
		return list; 
	}
}
