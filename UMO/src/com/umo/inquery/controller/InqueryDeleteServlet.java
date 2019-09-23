package com.umo.inquery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;

/**
 * Servlet implementation class InqueryDelete
 */
@WebServlet("/inquery/inqueryDelete")
public class InqueryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Board_No = Integer.parseInt(request.getParameter("Board_No"));
		
		int result = new InqueryService().deleteInquery(Board_No);
		
		String views = "";
		
		String msg = ""; String loc = "";
		 
		if(result > 0) { msg = "성공"; loc = "/inquery/inqueryBoard"; }
		else { msg = "실패"; loc = "/"; }
			  
		request.setAttribute("msg", msg); request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
