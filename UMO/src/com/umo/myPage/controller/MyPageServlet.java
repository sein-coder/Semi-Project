package com.umo.myPage.controller;

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
import com.umo.model.vo.Comment;
import com.umo.model.vo.Food;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.Member;
import com.umo.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userId=request.getParameter("userId");
	      Member m=new MyPageService().selectOne(userId);
	  	int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=3;
		String name="myPage";
		List<Food> foodlist = new FoodService().selectFoodList(cPage,numPerPage,name,userId,null,null);
		List<Board> anonymousBoardList=new AnonymousBoardService().selectanonymousBoardList(cPage,numPerPage,name,userId,null,null);
		List<Inquery> inquerylist=new InqueryService().selectInqueryBoardList(cPage,numPerPage,name,userId,null,null);
		List<Board> freelist =new FreeBoardService().selectFreeBoardList(cPage, numPerPage,name,userId,null,null);	
		 List<Board> gradelist =new GradeBoardService().selectGradeBoardList(cPage, numPerPage,name,userId,null,null);
		
		 
		 
		String comment="Notice_Comment";
		List<Comment> NoticeCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		comment="Food_Comment";
		List<Comment> FoodCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		comment="INQUERY_COMMENT";
		List<Comment> inqueryCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		comment="grade_COMMENT";
		List<Comment> gradeCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		comment="free_COMMENT";
		List<Comment> freeCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		comment="anonymous_COMMENT";
		List<Comment> anonymousCommentlist = new MyPageService().selectCommentList(cPage,numPerPage,name,userId,comment);
		
		
		request.setAttribute("gradelist", gradelist);
		request.setAttribute("gradeCommentlist", gradeCommentlist);
		request.setAttribute("freeCommentlist", freeCommentlist);
		request.setAttribute("anonymousCommentlist", anonymousCommentlist);
		request.setAttribute("freelist", freelist);
		request.setAttribute("inquerylist", inquerylist);
		request.setAttribute("foodlist", foodlist);
		request.setAttribute("anonymousBoardList", anonymousBoardList);
		request.setAttribute("NoticeCommentlist", NoticeCommentlist);
		request.setAttribute("FoodCommentlist", FoodCommentlist);
		request.setAttribute("inqueryCommentlist", inqueryCommentlist);
		request.setAttribute("cPage", cPage);
	      request.setAttribute("member", m);
	      request.getRequestDispatcher("/views/myPage/myPage.jsp")
	      .forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
