package com.umo.scrap.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import com.umo.food.model.dao.FoodDao;
import com.umo.model.vo.Scrap;
import com.umo.scrap.dao.ScrapDao;

public class ScrapService {

	private ScrapDao  dao = new ScrapDao();

	public int insertScrapButton(String board_type, String memberId, int board_no, String board_title, String board_writer, Date board_date) {
		Connection conn=getConnection();
		int result=dao.insertScrapButton(conn,board_type,memberId,board_no,board_title,board_writer,board_date);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<Scrap> selectScrapList(int cPage, int numPerPage, String member_id) {
		Connection conn = getConnection();
		List<Scrap> list=dao.selectScrapList(conn,cPage,numPerPage,member_id);
		close(conn);
		return list;
		
	}

	public Scrap selectScrap(String board_type, int board_no,String memberId) {
		Connection conn = getConnection();
		Scrap sc =dao.selectScrap(conn,board_type,board_no,memberId);
		close(conn);
		return sc;
	}

	public int selectScrapCount() {
		Connection conn = getConnection();
		int result =dao.selectScrapCount(conn);
		close(conn);
		return result;
	}

	

	
	
	

}
