package com.umo.webCompiler.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Inquery;

/**
 * Servlet implementation class WebCompilerViewServlet
 */
@WebServlet("/webCopiler/webCopilerView")
public class WebCompilerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebCompilerViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Board_No")!=null) {
			int Board_No = Integer.parseInt(request.getParameter("Board_No"));
			request.setAttribute("Board_No", Board_No);
			
			Inquery inquery = new InqueryService().selectBoardView(Board_No);
			String inputCode = inquery.getInputCode().replaceAll("(\r\n|\r|\n|\n\r)", " ");
			request.setAttribute("inputCode", inputCode);
		}
		
		request.getRequestDispatcher("/views/webCompiler/webCompilerView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
