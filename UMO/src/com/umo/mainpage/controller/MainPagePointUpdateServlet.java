package com.umo.mainpage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class MainPagePointUpdateServlet
 */
@WebServlet("/mainPagePointUpdateServlet")
public class MainPagePointUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPagePointUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Member_id = request.getSession().getAttribute("loginMember").toString();
		Member member = new MemberService().selectPointId(Member_id);

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(member,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
