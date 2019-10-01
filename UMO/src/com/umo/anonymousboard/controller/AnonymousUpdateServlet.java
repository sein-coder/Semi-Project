	package com.umo.anonymousboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.anonymousboard.service.AnonymousBoardService;
import com.umo.model.vo.Board;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/anonymousUpdate")
public class AnonymousUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnonymousUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt(request.getParameter("anonymousNo"));
		
		Board b=new AnonymousBoardService().anonymousBoardContent(no);
		request.setAttribute("board_type", "anonymous");
	    request.setAttribute("titlename", "익명");
		request.setAttribute("b", b);
		request.getRequestDispatcher("/views/board/boardUpdate.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
