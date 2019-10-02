package com.umo.inquery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.InqueryComment;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class InqueryViewServlet
 */
@WebServlet("/inquery/inqueryView")
public class InqueryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		int Board_No = Integer.parseInt(request.getParameter("Board_No"));
		
		Inquery inquery = new InqueryService().selectBoardView(Board_No);
		InqueryService service = new InqueryService();
		List<InqueryComment> list = service.selectComment(Board_No);
		
		Inquery preb= null;
		Inquery nextb = null;
		
		
		int i = 1;
		int count = service.selectBoardCount(null, null);
		
		while(true) { preb = service.selectBoardView(Board_No-i);
		if((preb.getBoard_No()!=0 ) || i > count) { 
			break;
			} 
		i=i+1; 
		}
		
		i = 1;
		
		while(true) { nextb = service.selectBoardView(Board_No+i);
		if((nextb.getBoard_No()!=0) || i > count) { 
			break;
			} 
		i=i+1; 
		}

		request.setAttribute("preb", preb);
		request.setAttribute("nextb", nextb);
		
		request.setAttribute("inquery", inquery);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/inquery/inqueryView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
