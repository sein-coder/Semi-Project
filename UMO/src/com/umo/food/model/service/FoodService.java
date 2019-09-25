package com.umo.food.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import com.umo.food.model.dao.FoodDao;
import com.umo.model.vo.Food;
import com.umo.model.vo.FoodComment;



public class FoodService {
	
	private FoodDao dao = new FoodDao();//sql문을 실행하는 메소드들을 모아둔 클래스
	
	public List<Food> selectFoodList(int cPage, int numPerPage,String name,String userId) {//foodlist를 select해주는 service 클래스의 메소드
		Connection conn  = getConnection();//db와 연결해주는 static 메소드
		List<Food> list = dao.selectFoodList(conn,cPage,numPerPage,name,userId);//select * from Food_board;를 실행할 메소드 
		close(conn);
		return list;
	}

	public int selectCountFood_Board() {
		Connection conn=getConnection();
		int result=dao.selectCountFood_Board(conn);
		close(conn);
		return result;
	}

	public int insertBoard(Food f) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn,f);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}return result;
	}

	public Food selectFoodView(int board_no) {
		Connection conn=getConnection();
		Food f= dao.selectFoodView(conn,board_no);
		close(conn);
		return f;
	}

	public int updateFoodBoard(Food f) {
		Connection conn=getConnection();
		int result=dao.updateFoodBoard(conn,f);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteFoodBoard(int board_no) {
		Connection conn=getConnection();
		int result = dao.deleteFoodBoard(conn,board_no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<FoodComment> selectComment(int board_no) {
		Connection conn=getConnection();
		List<FoodComment> list=dao.selectComment(conn,board_no);
		close(conn);
		return list;
		
		
	}

	public int insertFoodComment(FoodComment foodComment) {
		Connection conn=getConnection();
		int result=dao.insertFoodComment(conn,foodComment);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteFoodComment(int boardRef, int boardCommentNo) {
		Connection conn=getConnection();
		int result=dao.deleteFoodComment(conn,boardRef,boardCommentNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	}	
	
	
	
	
	
	
	
	

