package com.umo.food.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.umo.food.model.vo.Food;

import static common.template.JDBCTemplate.close;

public class FoodDao {
	private Properties prop = new Properties(); //properties파일을 다루는 객체선언 및 초기화
	
	public FoodDao() {//기본생성자, properties파일을 불러오는 기능을 명시한다
		String path = FoodDao.class.getResource("/sql/food/food-query.properties").getPath(); 
		//properties파일의 저장된 경로값을 불러온다
		//FoodDao클래스의 위치를 불러오고 그 위치에서부터 괄호 안에 있는 /sql/food/food-query.properties로의 위치로 찾아가서  저장 경로를 string값으로 반환한다
		try{
			prop.load(new FileReader(path));//지정된 경로에 있는 파일을 읽어온다. 파일입출력 이기 때문에 try-catch 예외처리를 해줘야한다
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//매개변수를 넣어줄땐 형식에 맞는 변수명만 넣어줘도 된다.
	//매개변수 선언은 데이터의 형식 변수명을 다 써준다.
	public List<Food> selectFoodList(Connection conn) {
		PreparedStatement pstmt=null;
		//int반환형은 select이 아니라!! update문 delete문 insert문을 실행하고 몇개가 성공했는지의 개수를 받아올때 int값으로 받아온다
		//select는 2차원 테이블 형식으로 결과가 무조건! 나오기 때문에 ResultSet 객체를 통해서 결과를 받아온다
		ResultSet rs=null;
		List<Food> list= new ArrayList();//List는 null값이 아니라 바로 ArrayList로 초기화를 한다.
		String sql=prop.getProperty("selectFoodList");
		try {
			pstmt=conn.prepareStatement(sql);//가져온 connection타입에 매개변수를 이용해서 sql문을 넣은 preparedstatement를 초기화한다
			rs=pstmt.executeQuery();//select문은 executeQuery()메소드를 통해서 실행시킨다.
									//delete문,update,insert문은 executeUpdate()메소드를 통해서 실행시킨다.
			while(rs.next()) {
				Food f=new Food();//list에 넣어줄 Food객체를 선언 및 초기화 시켜준다.
				//생성한 Food객체 f에 맴버변수 값을 셋팅한다.
				f.setBoard_No(rs.getInt("board_no"));//생성한 Food객체 f에 board_no 맴버변수(속성)값을 셋팅한다.
													//검색결과 중에 똑같은 데이터 타입에 "board_no"라는 컬럼명의 값을 넣어준다
				f.setBoard_Writer(rs.getString("board_writer"));
				f.setBoard_Title(rs.getString("board_title"));
				f.setBoard_Contents(rs.getString("board_contents"));
				f.setBoard_MAP(rs.getString("board_map"));
				f.setBoard_Thumbnail(rs.getString("board_thumbnail"));
				f.setOriginal_Filename(rs.getString("original_filename"));
				f.setRenamed_Filename(rs.getString("renamed_filename"));
				f.setBoard_Date(rs.getDate("board_date"));
				f.setBoard_Count(rs.getInt("board_count"));
				f.setWriting_Status(rs.getString("writing_status").charAt(0));
				f.setBoard_Grade(rs.getInt("board_grade"));
				list.add(f);//값을 셋팅한 food객체 f를 list에 추가한다.
				}
		}	
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);//import static으로 JDBCTemplate class의 close메소드를 import해줘야 한다
			close(pstmt);//db와 연결된 것들을 하나씩 닫아주기 위해서
		}return list;
		
		}
}
