package com.umo.session.controller;

import static com.umo.session.model.vo.LoginSessionCount.loginMemberList;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.model.vo.Member;
import com.umo.session.model.service.SessionService;
import static com.umo.session.model.vo.LoginSessionCount.maxLogin;
/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/sessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int todayLogin = new SessionService().selectTodayLogin();
		int allLogin = new SessionService().selectallLogin();
		
		if(maxLogin<loginMemberList.size()) {
			maxLogin = loginMemberList.size();
		}
		
		ServletContext application = this.getServletContext();
		application.setAttribute("todayLogin", todayLogin);
		application.setAttribute("allLogin", allLogin);
		application.setAttribute("maxLogin", maxLogin);
		application.setAttribute("loginCount",loginMemberList.size());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
