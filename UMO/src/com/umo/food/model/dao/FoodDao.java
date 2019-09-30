package com.umo.food.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.umo.model.vo.Food;
import com.umo.model.vo.FoodComment;

import oracle.jdbc.proxy.annotation.Pre;

import static common.template.JDBCTemplate.close;

public class FoodDao {
	private Properties prop = new Properties();
	
	public FoodDao() {
		String path = FoodDao.class.getResource("/sql/food/food-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectCountFood_Board(Connection conn,String sfl,String stx) {
		Statement stmt = null;
		int result=0;//테이블 개수마다 처리하는 거니까 int 쓰는것
		ResultSet rs=null;//select는 언제나 resultSet쓰기
		String sql="select count(*) from food_board";
		if(sfl!=null&&stx!=null) {
			sql+=" where "+sfl+" like '%"+stx+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result =rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
	}
	
	public List<Food> selectFoodList(Connection conn, int cPage, int numPerPage,String name,String userId,String sfl,String stx) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Food> list = new ArrayList();
		String sql="";
		int start=(cPage-1)*numPerPage+1;
		int end=cPage*numPerPage;
		if(name.equals("myPage")) {
			if(sfl!=null&&stx!=null) {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from food_board where "+sfl+" like '%"+stx+"%' order by board_date desc)a where board_writer= '"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}else {
				sql = "select * from  "
						+ "(select rownum as rnum, a.* from "
						+ "(select * from food_board order by board_date desc)a where board_writer= '"+userId+"')"
						+ " where rnum between "+start+" and "+end;
			}
		}else {
			if(sfl!=null&&stx!=null) {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM food_board where "+sfl+" like '%"+stx+"%' ORDER BY Board_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}else {
				sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS RNUM, A.* FROM "
						+ "(SELECT * FROM food_board ORDER BY Board_DATE DESC)A ) "
						+ "WHERE RNUM BETWEEN "+start+" and "+end;
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Food f = new Food();
				f.setBoard_No(rs.getInt("board_no"));
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
				f.setBoard_tag(rs.getString("board_tag"));
				f.setBoard_tel(rs.getString("board_tel"));
				list.add(f);
			}
		}catch(SQLException e) {
				e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return list;
	}

	public int insertBoard(Connection conn, Food f) {
		PreparedStatement pstmt =null;
		int result = 0 ;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, f.getBoard_Writer());
			pstmt.setString(2, f.getBoard_Title());
			pstmt.setString(3, f.getBoard_Contents());
			pstmt.setString(4, f.getBoard_MAP());
			pstmt.setString(5, f.getBoard_Thumbnail());
			pstmt.setString(6, f.getOriginal_Filename());
			pstmt.setString(7, f.getRenamed_Filename());
			pstmt.setInt(8, f.getBoard_Grade());
			pstmt.setString(9, f.getBoard_tel());
			pstmt.setString(10,f.getBoard_foodtype());
			pstmt.setString(11, f.getBoard_foodbill());
			pstmt.setString(12, f.getBoard_park());
			pstmt.setString(13, f.getBoard_open());		
			pstmt.setString(14,f.getBoard_tag());			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public Food selectFoodView(Connection conn, int board_no) {
		PreparedStatement pstmt = null;
		ResultSet rs=null;//resultset은 select한 결과를 저장할때 쓰는것
		String sql = prop.getProperty("selectFoodView");
		Food f=new Food();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				f.setBoard_No(rs.getInt("board_no"));
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
				f.setBoard_foodtype(rs.getString("board_foodtype"));
				f.setBoard_foodbill(rs.getString("board_foodbill"));
				f.setBoard_open(rs.getString("board_open"));
				f.setBoard_tag(rs.getString("board_tag"));
				f.setBoard_park(rs.getString("board_park"));
				f.setBoard_tel(rs.getString("board_tel"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return f;
		
	}

	public int updateFoodBoard(Connection conn, Food f) {
		PreparedStatement pstmt =null;
		int result=0;
		String sql=prop.getProperty("updateFoodBoard");
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, f.getOriginal_Filename());
			pstmt.setString(2, f.getRenamed_Filename());
			pstmt.setString(3, f.getBoard_Title());
			pstmt.setString(4, f.getBoard_tel());
			pstmt.setString(5,f.getBoard_foodtype());
			pstmt.setString(6, f.getBoard_foodbill());
			pstmt.setString(7, f.getBoard_park());
			pstmt.setString(8, f.getBoard_open());		
			pstmt.setString(9,f.getBoard_tag());			
			pstmt.setString(10, f.getBoard_Contents());
			pstmt.setInt(11, f.getBoard_Grade());
			pstmt.setString(12, f.getBoard_MAP());
			pstmt.setString(13, f.getBoard_Thumbnail());
			pstmt.setInt(14, f.getBoard_No());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int deleteFoodBoard(Connection conn, int board_no) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("deleteFoodBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public List<FoodComment> selectComment(Connection conn, int Board_No) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FoodComment> list= new ArrayList();
		String sql=prop.getProperty("selectComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,Board_No);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FoodComment comment=new FoodComment();
				comment.setComment_No(rs.getInt("comment_No"));
				comment.setComment_Writer(rs.getString("comment_Writer"));
				comment.setComment_Contents(rs.getString("comment_Contents"));
				comment.setDate(rs.getDate("comment_date"));
				comment.setBoard_no_Ref(rs.getInt("board_no_Ref"));
				comment.setComment_Level(rs.getInt("comment_Level"));
				comment.setComment_Refno(rs.getInt("comment_Refno"));
				list.add(comment);				
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return list;
		}

	public int insertFoodComment(Connection conn, FoodComment foodComment) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertFoodComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, foodComment.getComment_Writer());
			pstmt.setString(2, foodComment.getComment_Contents());
			pstmt.setInt(3, foodComment.getBoard_no_Ref());
			pstmt.setInt(4, foodComment.getComment_Level());
			pstmt.setInt(5, foodComment.getComment_Refno());
			result=pstmt.executeUpdate();	
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFoodComment(Connection conn, int boardRef, int boardCommentNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteFoodComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardRef);
			pstmt.setInt(2, boardCommentNo);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public List<Food> selectSearchTag(Connection conn, int cPage, int numPerPage, String tag) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Food> list = new ArrayList();
		String sql = prop.getProperty("selectSearchTag");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+tag+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Food f = new Food();
				f.setBoard_No(rs.getInt("board_no"));
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
				f.setBoard_tag(rs.getString("board_tag"));
				list.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectSearchCount(Connection conn, String tag) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) from food_board where board_tag like '%"+tag+"%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public int updateReadCount(Connection conn, int board_no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReadCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePoint(Connection conn, String writer) {
		Statement stmt=null;
		int result2=0;
		
		String sql="";
		sql="update Member set point=point=10 where Member_id='"+writer+"'";
		try {
			stmt=conn.createStatement();
			result2=stmt.executeUpdate(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result2;
	}

	public int updateCommentPoint(Connection conn, String writer) {
		Statement stmt=null;
		int result3=0;
		String sql="";
		sql="update Member set point=point+5 where Member_id='"+writer+"'";
		try {
			stmt=conn.createStatement();
			result3=stmt.executeUpdate(sql);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result3;
	}
}
	

	
//	private Properties prop = new Properties(); //properties파일을 다루는 객체선언 및 초기화
//	
//	public FoodDao() {//기본생성자, properties파일을 불러오는 기능을 명시한다
//		String path = FoodDao.class.getResource("/sql/food/food-query.properties").getPath(); 
//		//properties파일의 저장된 경로값을 불러온다
//		//FoodDao클래스의 위치를 불러오고 그 위치에서부터 괄호 안에 있는 /sql/food/food-query.properties로의 위치로 찾아가서  저장 경로를 string값으로 반환한다
//		try{
//			prop.load(new FileReader(path));//지정된 경로에 있는 파일을 읽어온다. 파일입출력 이기 때문에 try-catch 예외처리를 해줘야한다
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	//매개변수를 넣어줄땐 형식에 맞는 변수명만 넣어줘도 된다.
//	//매개변수 선언은 데이터의 형식 변수명을 다 써준다.
//	public List<Food> selectFoodList(Connection conn) {
	//try~catch문내에서 sql문을 처리할 변수들을 미리 null값으로 선언하는 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//		PreparedStatement pstmt=null;
//		//int반환형은 select이 아니라!! update문 delete문 insert문을 실행하고 몇개가 성공했는지의 개수를 받아올때 int값으로 받아온다
//		//select는 2차원 테이블 형식으로 결과가 무조건! 나오기 때문에 ResultSet 객체를 통해서 결과를 받아온다
//		ResultSet rs=null;
//		List<Food> list= new ArrayList();//List는 null값이 아니라 바로 ArrayList로 초기화를 한다.
//		String sql=prop.getProperty("selectFoodList");
//		try {
//			pstmt=conn.prepareStatement(sql);//가져온 connection타입에 매개변수를 이용해서 sql문을 넣은 preparedstatement를 초기화한다
//			rs=pstmt.executeQuery();//select문은 executeQuery()메소드를 통해서 실행시킨다.
//									//delete문,update,insert문은 executeUpdate()메소드를 통해서 실행시킨다.
//			while(rs.next()) {
//				Food f=new Food();//list에 넣어줄 Food객체를 선언 및 초기화 시켜준다.
//				//생성한 Food객체 f에 맴버변수 값을 셋팅한다.
//				f.setBoard_No(rs.getInt("board_no"));//생성한 Food객체 f에 board_no 맴버변수(속성)값을 셋팅한다.
//													//검색결과 중에 똑같은 데이터 타입에 "board_no"라는 컬럼명의 값을 넣어준다
//				f.setBoard_Writer(rs.getString("board_writer"));
//				f.setBoard_Title(rs.getString("board_title"));
//				f.setBoard_Contents(rs.getString("board_contents"));
//				f.setBoard_MAP(rs.getString("board_map"));
//				f.setBoard_Thumbnail(rs.getString("board_thumbnail"));
//				f.setOriginal_Filename(rs.getString("original_filename"));
//				f.setRenamed_Filename(rs.getString("renamed_filename"));
//				f.setBoard_Date(rs.getDate("board_date"));
//				f.setBoard_Count(rs.getInt("board_count"));
//				f.setWriting_Status(rs.getString("writing_status").charAt(0));
//				f.setBoard_Grade(rs.getInt("board_grade"));
//				list.add(f);//값을 셋팅한 food객체 f를 list에 추가한다.
//				}
//		}	
//		catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);//import static으로 JDBCTemplate class의 close메소드를 import해줘야 한다
//			close(pstmt);//db와 연결된 것들을 하나씩 닫아주기 위해서
//		}return list;
//		
//		}
	
	
	
	
	
	
	
	
	
	
	
	
	

