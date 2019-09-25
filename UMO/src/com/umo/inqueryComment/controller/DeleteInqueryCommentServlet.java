package com.umo.inqueryComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;

/**
 * Servlet implementation class DeleteComment
 */
@WebServlet("/inqueryComment/deleteComment")
public class DeleteInqueryCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInqueryCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardRef = Integer.parseInt(request.getParameter("boardRef"));

		int boardCommentNo = Integer.parseInt(request.getParameter("boardCommentNo"));

		int result = new InqueryService().deleteInqueryComment(boardRef,boardCommentNo);

		String msg = "";
		String loc = "/inquery/inqueryView?Board_No="+boardRef;
		String view = "/views/common/msg.jsp";

		if(result>0) {
			msg = "댓글 삭제 완료";
		}else {
			msg="댓글 삭제 실패";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
