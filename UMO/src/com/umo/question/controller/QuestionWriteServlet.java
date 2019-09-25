package com.umo.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QuestionWriteServlet
 */
@WebServlet("/question/questionWriteServlet")
public class QuestionWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputCode = request.getParameter("inputCode");
		String outputCode = request.getParameter("outputCode");
		//outputCode 줄개행 전처리
		inputCode = inputCode.replaceAll("(\r\n|\r|\n|\n\r)", " ");
		outputCode = outputCode.replaceAll("(\r\n|\r|\n|\n\r)", ",");
		
		request.setAttribute("inputCode", inputCode);
		request.setAttribute("outputCode", outputCode);	
		
		request.getRequestDispatcher("/views/question/questionForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
