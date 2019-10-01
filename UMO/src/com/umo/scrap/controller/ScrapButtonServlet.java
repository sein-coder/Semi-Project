package com.umo.scrap.controller;

import java.io.IOException;
import java.sql.Date;

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
import com.umo.model.vo.Member;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;
import com.umo.scrap.service.ScrapService;

/**
 * Servlet implementation class ScrapButtonServlet
 */
@WebServlet("/scrap/scrapButtonServlet")
public class ScrapButtonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapButtonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String board_type=request.getParameter("board_type");
			int board_no=Integer.parseInt(request.getParameter("board_no"));
			String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();

			System.out.println(board_no+" "+board_type+" "+memberId);
			
			String board_title="";
			String board_writer="";
			Date board_date=new Date(0);
			
			switch (board_type) {
			case "food":
				Food food = new FoodService().selectFoodView(board_no, true);
				board_title = food.getBoard_Title();
				board_writer = food.getBoard_Writer();
				board_date = food.getBoard_Date();
				break;
			case "free":
				Board free = new FreeBoardService().selectfreeBoard(board_no, true);
				board_title = free.getTitle();
				board_writer = free.getWriter();
				board_date = free.getDate();
				break;
			case "inqeury":
				Inquery inquery = new InqueryService().selectBoardView(board_no);
				board_title = inquery.getBoard_Title();
				board_writer = inquery.getBoard_Writer();
				board_date = inquery.getBoard_Date();
				break;
			case "anonymous":
				Board anonymous = new AnonymousBoardService().selectanonymousBoard(board_no, true);
				board_title = anonymous.getTitle();
				board_writer = anonymous.getWriter();
				board_date = anonymous.getDate();
				break;
			case "grade":
				Board grade = new GradeBoardService().selectGradeBoard(board_no, true);
				board_title = grade.getTitle();
				board_writer = grade.getWriter();
				board_date = grade.getDate();
				break;
			case "notice":
				NoticeBoard notice = new NoticeBoardService().selectnoticeBoard(board_no, true);
				board_title = notice.getTitle();
				board_writer = notice.getWriter();
				board_date = notice.getDate();
				break;
			}
			
			int result = new ScrapService().insertScrapButton(board_type, memberId, board_no, board_title, board_writer, board_date);
			
			
			String msg="";
			String loc="";
			
			if(result>0) {
				msg="글 등록을 성공하였습니다.";
				loc = "/"+board_type+"ContentView?"+board_type+"No="+board_no;
			}else {
				msg="공지사항 수정 실패";
				loc = "/";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
