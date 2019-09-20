package com.umo.myPage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Comment;
import com.umo.model.vo.Food;
import com.umo.model.vo.Member;
import com.umo.myPage.service.MyPageService;

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
		List<Food> foodlist = new FoodService().selectFoodList(cPage,numPerPage,name,userId);
		List<Comment> NoticeCommentlist = new MyPageService().selectNoticeCommentList(cPage,numPerPage,name,userId);
		
		
		
		request.setAttribute("NoticeCommentlist", NoticeCommentlist);
		request.setAttribute("foodlist", foodlist);
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
