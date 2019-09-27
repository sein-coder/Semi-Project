package com.umo.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class LoginhServlet
 */
@WebServlet(name="LoginChServlet", urlPatterns="/loginCh")
public class LoginChServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginChServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("userId");
		String pw=request.getParameter("pw");
		String saveId=request.getParameter("saveId");
		System.out.println(saveId);
		MemberService ms=new MemberService();
		Member m=ms.selectId(id,pw);
		
		String msg="";
		String loc="/";
		String view="";
		
		if(m!=null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			if(saveId!=null)
			{
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(3*24*60*60);
				response.addCookie(c);
			}else {
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
			view="/";
			response.sendRedirect(request.getContextPath());
			
			}else {
				msg="��ϵ������� ȸ���Դϴ�.";
			   view="views/common/msg.jsp";
			   request.setAttribute("msg", msg);
			   request.setAttribute("loc", loc);
			   RequestDispatcher rs=request.getRequestDispatcher(view);
					rs.forward(request, response);   
			  
			}
//		request.setAttribute("loginMember", m);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
