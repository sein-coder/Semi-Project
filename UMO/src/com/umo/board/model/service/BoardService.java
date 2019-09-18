package com.umo.board.model.service;

import static common.template.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.umo.board.model.dao.BoardDao;
import com.umo.model.vo.Board;

public class BoardService {
	
	private BoardDao dao= new BoardDao();
	
	public List<Board> selectBoardClassList(int cPage, int numPerPage, String boardType){
		Connection conn=getConnection();
		
		List<Board> list=dao.selectBoardClassList(conn, cPage, numPerPage, boardType);
		
		if(list.size()>0) {
			close(conn);
		}	
		return list; 
		
	}

}
