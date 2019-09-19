package com.umo.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.model.vo.Member;
import com.umo.myPage.service.MyPageService;
import com.umo.service.MemberService;

/**
 * Servlet implementation class InfoUpdateEndServlet
 */
@WebServlet("/infoUpdateEnd")
public class InfoUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		Member m=new Member(request.getParameter("id"),request.getParameter("pw"),
//				request.getParameter("name"),request.getParameter("email"),
//				request.getParameter("phone"),request.getParameter("address"));
		Member m=new Member(request.getParameter("id"),request.getParameter("pw"),request.getParameter("name"),
				request.getParameter("email"),request.getParameter("phone"),request.getParameter("address"));
		System.out.println(m.getMemberId()+m.getMemberPw()+m.getMemberName()+m.getEmail());
		
		int result=new MemberService().updateMember(m);
		String msg="";
	      String loc="";
	      System.out.println(result);
	      if(result>0) {
	         msg="회원정보 수정이 완료되었습니다.!";
	         loc="/";
	      }else {
	         msg="회원정보 수정 실패 다시 수정해주세요!";
	         loc="/";
	      }
	      request.setAttribute("msg",msg);
	      request.setAttribute("loc",loc);
	      request.getRequestDispatcher("/views/common/msg.jsp")
	      .forward(request,response);
	            
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
