package com.umo.search.controller;

import java.io.IOException;
import com.umo.admin.service.AdminService;
import com.umo.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/search/searchList")
public class SearchMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		
		if(session.getAttribute("loginMember")==null
				||!((Member)session.getAttribute("loginMember")).getMemberId().equals("admin")){
					request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
				}
		else {
			int cPage;
			try {
				cPage=Integer.parseInt(request.getParameter("cPage"));
			}catch(NumberFormatException e) {
				cPage=1;
			}
			int numPerPage=request.getParameter("numPerPage")!=null?Integer.parseInt(request.getParameter("numPerPage")):5;
			
			AdminService service=new AdminService();
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
