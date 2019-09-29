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
import static com.umo.session.model.vo.LoginSessionCount.loginMemberCount;
/**
 * Servlet implementation class LoginhServlet
 */
@WebServlet(name="LoginChServlet", urlPatterns="/loginCheck")

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

		String id=request.getParameter("mb_id");
		String pw=request.getParameter("mb_password");		
		
		String saveId=request.getParameter("autoCom_login");
		
		MemberService ms=new MemberService();
		Member m=ms.selectId(id,pw);
		
		String msg="";
		String loc="/";
		String view="";
		
		if(m!=null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			loginMemberCount += 1;
			System.out.println(loginMemberCount);
			if(saveId!=null)
			{
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(3*24*60*60);
				response.addCookie(c);
			}else {
				Cookie c=new Cookie("saveId",id);
				c.setMaxAge(10);
				response.addCookie(c);
			}
			
			view="/";
			response.sendRedirect(request.getContextPath());
			
			}else {
				
				
				msg="등록되지않은 회원입니다.";
				
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
