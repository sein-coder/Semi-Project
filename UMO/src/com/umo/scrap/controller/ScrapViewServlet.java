package com.umo.scrap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Food;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class ScrapViewServlet
 */
@WebServlet("/scrap/ScrapViewServlet")
public class ScrapViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/scrap/ScrapView.jsp").forward(request, response);
		
		
		String board_type=request.getParameter("board_type");
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		//type, 글번호, 스크랩한 사람
		
		int result= new FoodService().insertFoodScrap(board_type,board_no,memberId);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
