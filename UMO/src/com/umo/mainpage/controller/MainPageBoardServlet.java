package com.umo.mainpage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
 * Servlet implementation class MainPageBoardServlet
 */
@WebServlet("/mainPageBoardServlet")
public class MainPageBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("ajax");
		String sfl = null;
		String stx = null;

		switch (type) {
		case "inquery":
			List<Inquery> inquerylist = new InqueryService().selectInqueryBoardList(1, 6, "", "",sfl,stx);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(inquerylist,response.getWriter());
			
			break;
		case "anonymous":
			List<Board> anonymouslist = new AnonymousBoardService().selectanonymousBoardList(1, 6, "", "",sfl,stx);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(anonymouslist,response.getWriter());
			
			break;
		case "grade":
			List<Board> gradelist = new GradeBoardService().selectGradeBoardList(1, 6, "", "",sfl,stx);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(gradelist,response.getWriter());
			
			break;
		case "free":
			List<Board> freelist = new FreeBoardService().selectFreeBoardList(1, 6, "", "",sfl,stx);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(freelist,response.getWriter());
			
			break;
		case "food":
			List<Food> foodlist = new FoodService().selectFoodList(1, 5, "", "",sfl,stx);

			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(foodlist,response.getWriter());
			
			break;
		case "notice":
			List<Board> noticelist = new NoticeBoardService().selectNoticeboardList(1, 1, "", "",sfl,stx);
	
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(noticelist,response.getWriter());
		
			break;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
