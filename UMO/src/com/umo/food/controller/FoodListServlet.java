package com.umo.food.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.food.model.service.FoodService;
import com.umo.model.vo.Food;

/**
 * Servlet implementation class FoodListServlet
 */
@WebServlet("/food/foodList")
public class FoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=8;
		
		//sfl는 선택창
		//stx는 검색어
		String sfl=request.getParameter("sfl");
		String stx=request.getParameter("stx");
		
		FoodService service = new FoodService();
		int totalData=service.selectCountFood_Board(sfl,stx);
		String name="";
		String userId="";
		List<Food> list = new FoodService().selectFoodList(cPage,numPerPage,name,userId,sfl,stx);
		String pageBar="";
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo =((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize -1;
		
		if(pageNo==1) {
			pageBar += "<strong class='pg_page pg_start'>이전</strong>";
		}else {
			pageBar +="<a class='pg_page pg_start' href='"+request.getContextPath()+"/food/foodList?cPage="+(pageNo-1)+"'> [이전] </a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar += "<a class='pg_page' href='"+request.getContextPath()+"/food/foodList?cPage="+pageNo+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar +="<strong class='pg_page pg_end'>다음</strong>";
		}else {
			pageBar +="<a class='pg_page pg_end' href='"+request.getContextPath()+"/food/foodList?cPage="+pageNo+"'> [다음] </a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		
		request.getSession().setAttribute("board_path", "upload/food/contentimg");
		
		request.getRequestDispatcher("/views/food/foodList.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
