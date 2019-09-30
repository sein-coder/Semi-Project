package com.umo.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.umo.inquery.model.service.InqueryService;
import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class InfoFindIdEnd
 */
@WebServlet("/infoFindIdEnd")
public class InfoFindIdEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoFindIdEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int KH_No = Integer.parseInt(request.getParameter("Id"));
		
		Member m = new MemberService().findId(KH_No);

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(m,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
