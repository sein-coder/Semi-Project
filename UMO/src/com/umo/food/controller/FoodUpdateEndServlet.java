package com.umo.food.controller;

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class FoodUpdateFormServlet
 */
@WebServlet("/food/foodUpdateEnd")
public class FoodUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!(ServletFileUpload.isMultipartContent(request))){
			request.setAttribute("msg", "공지사항작성오류![form:entype 관리자에게 문의하세요]");
			request.setAttribute("loc", "/");//msg로 연결시켜주기
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		System.out.println("ㅋㅋㅋㅋ");
		
		String saveDir =getServletContext().getRealPath("/upload/food");
		
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request,saveDir,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String fileName = mr.getFilesystemName("upfile");
		String oriFileName = mr.getOriginalFileName("upfile");
		String title=mr.getParameter("title");
		String tel=mr.getParameter("tel");
		String foodtype=mr.getParameter("foodtype");
		String bills=mr.getParameter("bills");
		String park=mr.getParameter("park");
		String open=mr.getParameter("start");
		String menu=mr.getParameter("menu");
		String ir1=mr.getParameter("contents");
		int grade=Integer.parseInt(mr.getParameter("grade"));
		String address1=mr.getParameter("address1");
		
		int board_no=Integer.parseInt(mr.getParameter("board_no"));
		
		File fi=mr.getFile("up_file");
		
		if(fi!=null&&fi.length()>0) {
				File deleteFile = new File(saveDir+"/"+oriFileName);
				boolean result=deleteFile.delete();
				System.out.println(result);
		}else {
			fileName = oriFileName;
		}
		Food f=new Food();
		f.setOriginal_Filename(fileName);
		f.setRenamed_Filename(oriFileName);
		f.setBoard_Title(title);
		f.setBoard_tel(tel);
		f.setBoard_foodtype(foodtype);
		f.setBoard_foodbill(bills);
		f.setBoard_park(park);
		f.setBoard_open(open);
		f.setBoard_menu(menu);
		f.setBoard_Contents(ir1);
		f.setBoard_Grade(grade);
		f.setBoard_MAP(address1);
		f.setBoard_No(board_no);
		
		int result=new FoodService().updateFoodBoard(f);
		String msg="";
		String loc="";
		String views="/views/common/msg.jsp";
		
		if(result>0) {
			msg="글 수정이 완료되었습니다.";

		}else {
			msg="글 수정 실패되었습니다.";

		}
		loc="/food/foodView?board_no="+board_no;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(views).forward(request, response);

		}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
