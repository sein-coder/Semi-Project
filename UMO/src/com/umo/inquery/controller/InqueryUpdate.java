package com.umo.inquery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Inquery;

/**
 * Servlet implementation class InqueryUpdate
 */
@WebServlet("/inquery/inqueryUpdate")
public class InqueryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Board_No = Integer.parseInt(request.getParameter("Board_No").trim());
		
		Inquery inquery = new InqueryService().selectBoardView(Board_No);

		String inputCode = "";
		String outputCode = "";	
		
		if(request.getParameter("flag")!=null) {
			inputCode = request.getParameter("inputCode").replaceAll("(\r\n|\r|\n|\n\r)", " ");
			outputCode = request.getParameter("outputCode").replaceAll("(\r\n|\r|\n|\n\r)", ",");
		}
		else {
			try {
				inputCode = inquery.getInputCode().replaceAll("(\r\n|\r|\n|\n\r)", " ");
				outputCode = inquery.getOutputCode().replaceAll("(\r\n|\r|\n|\n\r)", ",");
			}catch(NullPointerException e) {
				inputCode = "";
				outputCode = "";
			}
		}
		request.setAttribute("inputCode", inputCode);
		request.setAttribute("outputCode", outputCode);		
		
		request.setAttribute("inquery", inquery);
		
		System.out.println(inputCode);
		System.out.println(outputCode);
		
		request.getRequestDispatcher("/views/inquery/inqueryUpdateForm.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
