package com.umo.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.notice.model.service.NoticeBoardService;
import com.umo.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class NoticeContentViewServlet
 */
@WebServlet("/noticeContentView")
public class NoticeContentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeContentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt((request.getParameter("noticeNo")));
		System.out.println("no :"+no);
		
		NoticeBoardService service=new NoticeBoardService();
		
		NoticeBoard nb= service.noticeBoardContent(no);
		
		request.setAttribute("nb", nb);
		request.getRequestDispatcher("/views/notice/noticeContentView.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
