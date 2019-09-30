package com.umo.FoodComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.FoodComment;

/**
 * Servlet implementation class InsertFoodCommentServelt
 */
@WebServlet("/foodComment/insertComment")
public class InsertFoodCommentServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFoodCommentServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("boardRef"));
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		System.out.println(boardRef);
		int level=Integer.parseInt(request.getParameter("boardCommentLevel"));
		int boardCommentRef=Integer.parseInt(request.getParameter("boardCommentRef"));
		String writer=request.getParameter("boardWriter");
		String content=request.getParameter("content");
		
		FoodComment foodComment = new FoodComment();
		
		foodComment.setBoard_no_Ref(boardRef);
		foodComment.setComment_Level(level);
		foodComment.setComment_Refno(boardCommentRef);
		foodComment.setComment_Writer(writer);
		foodComment.setComment_Contents(content);
		
		int result=new FoodService().insertFoodComment(foodComment,writer);
		
		String msg="";
		String loc="/food/foodView?board_no="+boardRef;
		String view="/views/common/msg.jsp";
		
		if(result>0) {
			msg="댓글 등록 성공 ";
		}else {
			msg="댓글 등록 실패";
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
