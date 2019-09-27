package com.umo.food.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Food;

/**
 * Servlet implementation class FoodUpdateFormServlet
 */
@WebServlet("/food/foodUpdate")
public class FoodUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no=Integer.parseInt(request.getParameter("board_no"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String tag;
		try {
			tag = request.getParameter("tag");
		}catch(NullPointerException e) {
			tag = "";
		}
		
		Food f =new FoodService().selectFoodView(board_no,true);		
		
		request.setAttribute("f", f);
		request.setAttribute("cPage", cPage);
		request.setAttribute("tag", tag);
		
		request.getRequestDispatcher("/views/food/foodUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
