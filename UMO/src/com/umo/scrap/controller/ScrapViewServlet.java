package com.umo.scrap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.model.vo.Member;
import com.umo.model.vo.Scrap;
import com.umo.scrap.service.ScrapService;

/**
 * Servlet implementation class ScrapViewServlet
 */
@WebServlet("/scrap/scrapViewServlet")
public class ScrapViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String member_id = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		List<Scrap> list = new ScrapService().selectScrapList(member_id);
		
		request.getRequestDispatcher("/views/scrap/scrapView.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
