package com.umo.memo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.memo.model.service.MemoService;
import com.umo.memo.model.vo.Memo;

/**
 * Servlet implementation class MemoWriteEndServlet
 */
@WebServlet("/memoWriteEndServlet")
public class MemoWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receive_id = request.getParameter("me_recv_mb_id").toString();
		String content = request.getParameter("me_memo").toString();
		String userId = request.getParameter("userId");
		
		Memo memo = new Memo();
		
		memo.setReceive_id(receive_id);
		memo.setNotes_contnet(content);
		memo.setSend_id(userId);
		
		int result = new MemoService().insertMemo(memo);
				
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append(""+result);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
