package com.umo.allsearch.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.anonymousboard.service.AnonymousBoardService;
import com.umo.food.model.service.FoodService;
import com.umo.freeboard.service.FreeBoardService;
import com.umo.gradeboard.service.GradeBoardService;
import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Board;
import com.umo.model.vo.Food;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;

/**
 * Servlet implementation class AllBoardSearchServlert
 */
@WebServlet("/allboardsearch")
public class AllBoardSearchServlert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllBoardSearchServlert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int cPage;
		int numPerPage;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		    cPage=1;
		}
		
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch (NumberFormatException e) {
			numPerPage =10;
		}
		
		String stx=request.getParameter("stx");	
	    String name="";
	    String userId="";
	    String noticesfl="notice_title||notice_contents";
	    List<NoticeBoard> noticelist =new NoticeBoardService().selectNoticeBoardList(cPage, numPerPage,noticesfl,stx,"default");
	    String freesfl="free_title||free_contents";
	    List<Board> freelist =new FreeBoardService().selectFreeBoardList(cPage, numPerPage,name,userId,freesfl,stx,"default");
	    String foodsfl="food_board.BOARD_TITLE||food_board.BOARD_CONTENTS";
	    List<Food> foodlist = new FoodService().selectFoodList(cPage,numPerPage,name,userId,foodsfl,stx);
	    String inquerysfl="inquery_board.BOARD_TITLE||inquery_board.BOARD_CONTENTS";
	    List<Inquery> inquerylist = new InqueryService().selectInqueryBoardList(cPage,numPerPage,name,userId,inquerysfl,stx,"default");
	    String anonymoussfl="Anonymous_board.BOARD_TITLE||Anonymous_board.BOARD_CONTENTS";
	    List<Board> anonymouslist =new AnonymousBoardService().selectanonymousBoardList(cPage,numPerPage,name,userId,anonymoussfl,stx,"default");
	    String gradesfl="grade_title||grade_contents";
	    List<Board> gradelist =new GradeBoardService().selectGradeBoardList(cPage, numPerPage,name,userId,gradesfl,stx,"default");
	    
	    
		
	    request.setAttribute("stx", stx);
		request.setAttribute("noticelist", noticelist);
	    request.setAttribute("freelist", freelist);
	    request.setAttribute("foodlist", foodlist);
	    request.setAttribute("inquerylist", inquerylist);
	    request.setAttribute("anonymouslist", anonymouslist);
	    request.setAttribute("gradelist", gradelist);
//		
		request.getRequestDispatcher("/views/board/allboardListView.jsp").forward(request, response);
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
