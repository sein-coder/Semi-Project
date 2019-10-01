package com.umo.food.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Food;
import com.umo.model.vo.FoodComment;
import com.umo.model.vo.Scrap;

/**
 * Servlet implementation class FoodViewServlet
 */
@WebServlet("/food/foodView")
public class FoodViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		int cPage;
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		String tag;
		try {
			tag = request.getParameter("tag");
		}catch(NullPointerException e) {
			tag = "";
		}
		
		Cookie[] cookies = request.getCookies();
		String boardCookieVal="";
		boolean hasRead = false;//읽었는지 안읽었는지 구분하는 기준
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName(); //key값
				String value = c.getValue(); //value값
				if("boardCookie".equals(name)) {
					boardCookieVal = value;//이전값 보관
					if(value.contains("|"+board_no+"|")) {
						hasRead = true;
						break;
					}
				}
			}
		}

		if(!hasRead) {
			Cookie c = new Cookie("boardCookie", boardCookieVal+"|"+ board_no +"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		String board_type;
		String memberId;

				
				
		Food f = new FoodService().selectFoodView(board_no,hasRead);
		List<FoodComment> list = new FoodService().selectComment(board_no);
		
		request.setAttribute("f",f);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("tag", tag);
		
		
		
		
		
		request.getRequestDispatcher("/views/food/foodView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
