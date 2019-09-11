package com.umo.food.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.umo.food.model.dao.FoodDao;
import com.umo.food.model.vo.Food;



public class FoodService {
	private FoodDao dao=new FoodDao();//sql문을 실행하는 메소드들을 모아둔 클래스
	
	public List<Food> selectFoodList(){//foodlist를 select해주는 service 클래스의 메소드
		Connection conn=getConnection();//db와 연결해주는 static 메소드
		List<Food> list=dao.selectFoodList(conn);//select * from Food_board;를 실행할 메소드 
		
		close(conn);
		return list;
	}


}
