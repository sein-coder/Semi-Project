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
 * Servlet implementation class FoodTagSearchServlet
 */
@WebServlet("/food/foodTagSearch")
public class FoodTagSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodTagSearchServlet() {
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

		String tag = request.getParameter("tag");
		int numPerPage=8;
		
		FoodService service = new FoodService();
		int totalData=service.selectSearchCount(tag);
		List<Food> list = new FoodService().selectSearchTag(cPage,numPerPage,tag);
		
		String pageBar="";
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo =((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize -1;
		
		if(pageNo==1) {
			pageBar += "<span> [이전] </span>";
		}else {
			pageBar +="<a href='"+request.getContextPath()+"/food/foodTagSearch?cPage="+(pageNo-1)+"&tag="+tag+"'> [이전] </a>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<span> "+pageNo+" </span>";
			}else {
				pageBar += "<a href='"+request.getContextPath()+"/food/foodTagSearch?cPage="+pageNo+"&tag="+tag+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar +="<span> [다음] </span>";
		}else {
			pageBar +="<a href='"+request.getContextPath()+"/food/foodTagSearch?cPage="+pageNo+"&tag="+tag+"'> [다음] </a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("tag", tag);
		
		request.getRequestDispatcher("/views/food/foodList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
