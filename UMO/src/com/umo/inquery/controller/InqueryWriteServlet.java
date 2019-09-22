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
 * Servlet implementation class QuestionWriteServlet
 */
@WebServlet("/inquery/inqueryWriteServlet")
public class InqueryWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int Board_No;
		if(request.getParameter("Board_No")!=null) {
			Board_No = Integer.parseInt(request.getParameter("Board_No"));
			System.out.println(Board_No);
		}
		else {
			Board_No = 0;
		}
		if(Board_No==0) {
			String inputCode = request.getParameter("inputCode");
			String outputCode = request.getParameter("outputCode");
			String type = request.getParameter("type");
			//outputCode 줄개행 전처리
			inputCode = inputCode.replaceAll("(\r\n|\r|\n|\n\r)", " ");
			outputCode = outputCode.replaceAll("(\r\n|\r|\n|\n\r)", ",");
			
			request.setAttribute("type", type);
			request.setAttribute("inputCode", inputCode);
			request.setAttribute("outputCode", outputCode);			
		}else {
			Inquery inquery = new InqueryService().selectBoardView(Board_No);
			
			request.setAttribute("inquery", inquery);
			String inputCode = inquery.getInputCode();
			String outputCode = inquery.getOutputCode();
			String type = inquery.getCode_Type();
			//outputCode 줄개행 전처리
			inputCode = inputCode.replaceAll("(\r\n|\r|\n|\n\r)", " ");
			outputCode = outputCode.replaceAll("(\r\n|\r|\n|\n\r)", ",");
			
			request.setAttribute("type", type);
			request.setAttribute("inputCode", inputCode);
			request.setAttribute("outputCode", outputCode);	
			
		}
		request.getRequestDispatcher("/views/inquery/inqueryForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
