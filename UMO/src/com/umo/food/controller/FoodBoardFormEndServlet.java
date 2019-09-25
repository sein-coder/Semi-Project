package com.umo.food.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Food;

/**
 * Servlet implementation class BoardFormEndServlet
 */
@WebServlet("/board/boardFormEnd")
public class FoodBoardFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodBoardFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "질의작성 오류[관리자에게 문의하세요]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		int maxSize = 1024*1024*10;
		
		String root = getServletContext().getRealPath("/");
		
		String saveDir = root+"/upload/food";
		
		MultipartRequest mr = new MultipartRequest(request, saveDir,maxSize,"UTF-8",new DefaultFileRenamePolicy());

		
		String writer=mr.getParameter("writer");
		String title=mr.getParameter("title");
		String tel=mr.getParameter("tel");
		String foodtype=mr.getParameter("foodtype");
		String bills=mr.getParameter("bills");
		String park=mr.getParameter("park");
		String open = mr.getParameter("time");
		String menu=mr.getParameter("menu");
		String irl=mr.getParameter("irl");
		int grade=Integer.parseInt(mr.getParameter("grade"));
		String road_address=mr.getParameter("road_address");
	
		String renamed_fileNames = mr.getFilesystemName("upfile");
		String original_fileNames = mr.getOriginalFileName("upfile");	 
		
		Food f = new Food();
		//사진
		
		f.setRenamed_Filename(renamed_fileNames);
		f.setOriginal_Filename(original_fileNames);
		f.setBoard_Writer(writer);
		f.setBoard_Title(title);
		f.setBoard_tel(tel);
		f.setBoard_foodtype(foodtype);
		f.setBoard_foodbill(bills);
		f.setBoard_park(park);
		f.setBoard_open(open);
		f.setBoard_menu(menu);
		f.setBoard_Contents(irl);
		f.setBoard_Grade(grade);
		f.setBoard_MAP(road_address);
		
		int result = new FoodService().insertBoard(f);
		  
		String msg=""; 
		String loc=""; 
		String view="/views/common/msg.jsp";
		if(result>0) { 
			loc="/food/foodList"; 
			msg="신청서 등록 완료!"; 
		} else { 
			loc="/food/foodList"; 
			msg="신청서 등록 실패"; 
		} 
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher(view).forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
