package com.umo.memo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.memo.model.service.MemoService;
import com.umo.memo.model.vo.Memo;

/**
 * Servlet implementation class MemoContentView
 */
@WebServlet("/memoContentView")
public class MemoContentView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoContentView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId").toString();
		String memoNo = request.getParameter("memoNo");
		String type = request.getParameter("type").toString();
		
		Memo memo = new MemoService().selectMemo(memoNo,type);
		
		request.setAttribute("userId", userId);
		request.setAttribute("memo", memo);
		request.setAttribute("type", type);
		
		request.getRequestDispatcher("/views/memo/memoContentView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
