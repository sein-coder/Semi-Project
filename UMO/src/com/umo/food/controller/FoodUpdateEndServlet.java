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
		String tag;
		try {
			tag = request.getParameter("tag");
		}catch(NullPointerException e) {
			tag = "";
		}
		
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		String saveDir =getServletContext().getRealPath("/upload/food/thumnail");
		
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(request,saveDir,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
		int board_no = Integer.parseInt(mr.getParameter("board_no"));
		String thumnail = mr.getFilesystemName("thumnail_select");
		if(thumnail==null) {
			thumnail = mr.getParameter("hidden_thumnail");
		}
		String writer=mr.getParameter("writer");
		String title=mr.getParameter("title");
		String tel=mr.getParameter("tel");
		String foodtype=mr.getParameter("foodtype");
		String bills=mr.getParameter("bills");
		String park=mr.getParameter("park");
		String open = mr.getParameter("time");
		String tags=mr.getParameter("tags");
		String content=mr.getParameter("ir1");
		int grade=Integer.parseInt(mr.getParameter("grade"));
		String road_address=mr.getParameter("road_address");
		
		String ori_file = mr.getParameter("ori_file");
		String renamed_file = mr.getParameter("renamed_file");
		
		Food f = new Food();
		//사진
		f.setBoard_No(board_no);
		f.setBoard_Thumbnail(thumnail);
		f.setRenamed_Filename(renamed_file);
		f.setOriginal_Filename(ori_file);
		f.setBoard_Writer(writer);
		f.setBoard_Title(title);
		f.setBoard_tel(tel);
		f.setBoard_foodtype(foodtype);
		f.setBoard_foodbill(bills);
		f.setBoard_park(park);
		f.setBoard_open(open);
		f.setBoard_tag(tags);
		f.setBoard_Contents(content);
		f.setBoard_Grade(grade);
		f.setBoard_MAP(road_address);
		
		int result=new FoodService().updateFoodBoard(f);
		String msg="";
		String loc="";
		String views="/views/common/msg.jsp";
		
		if(result>0) {
			msg="글 수정이 완료되었습니다.";

		}else {
			msg="글 수정 실패되었습니다.";

		}
		loc="/food/foodView?board_no="+board_no+"&cPage="+cPage+"&tag="+tag;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("tag", tag);
		
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
