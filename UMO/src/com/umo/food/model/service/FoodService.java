package com.umo.food.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import com.umo.food.model.dao.FoodDao;
import com.umo.model.vo.Food;



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
	

	
	

}
