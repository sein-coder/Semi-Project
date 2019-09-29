package com.umo.anonymousboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.anonymousboard.service.AnonymousBoardService;
import com.umo.model.vo.BoardComment;

/**
 * Servlet implementation class boardCommentInsertServlet
 */
@WebServlet("/anonymous/insertComment")
public class AnonymousboardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnonymousboardCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int boardRef=Integer.parseInt(request.getParameter("boardRef"));
		int level=Integer.parseInt(request.getParameter("boardCommentLevel"));
		int boardCommentRef=Integer.parseInt(request.getParameter("boardCommentRef"));
		String writer=request.getParameter("boardWriter");
		String content=request.getParameter("wr_content");
		String class1="";
		
		BoardComment bc=new BoardComment(0,level,writer,content,class1,boardRef,boardCommentRef,null);
		
		int result=new AnonymousBoardService().insertanonymousBoardComment(bc);
		String msg="";
		String loc="/anonymousContentView?anonymousNo="+boardRef;
		String view="/views/common/msg.jsp";
		if(result>0) {
			msg="댓글등록성공";
		}else {
			msg="댓글등록실패";
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
