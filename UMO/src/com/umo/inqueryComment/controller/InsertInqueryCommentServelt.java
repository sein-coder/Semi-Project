package com.umo.inqueryComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.InqueryComment;

/**
 * Servlet implementation class insertInqueryCommentServelt
 */
@WebServlet("/inqueryComment/insertComment")
public class InsertInqueryCommentServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInqueryCommentServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardRef = Integer.parseInt(request.getParameter("boardRef"));
		int level = Integer.parseInt(request.getParameter("boardCommentLevel"));
		int boardCommentRef = Integer.parseInt(request.getParameter("boardCommentRef"));
		String writer = request.getParameter("boardWriter");
		String content = request.getParameter("wr_content");
		System.out.println(content);
		InqueryComment inqueryComment = new InqueryComment();
		
		inqueryComment.setBoard_no_Ref(boardRef);
		inqueryComment.setComment_level(level);
		inqueryComment.setComment_Refno(boardCommentRef);
		inqueryComment.setComment_writer(writer);
		inqueryComment.setComment_contents(content);
		
		int result = new InqueryService().insertInqueryComment(inqueryComment,writer);

		String msg = "";
		String loc = "/inquery/inqueryView?Board_No="+boardRef;
		String view = "/views/common/msg.jsp";

		if(result > 0) {
			msg = "댓글등록 성공!";
		}
		else {
			msg = "댓글 등록 실패!";
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
