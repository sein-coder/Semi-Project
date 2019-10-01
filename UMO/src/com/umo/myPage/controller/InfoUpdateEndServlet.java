package com.umo.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Member;
import com.umo.myPage.model.service.MyPageService;

/**
 * Servlet implementation class InfoUpdateEndServlet
 */
@WebServlet(name="InfoUpdateEnd", urlPatterns="/infoUpdateEnd")
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

		Member m = new Member();
		m.setMemberId(request.getParameter("mb_id"));
		m.setMemberPw(request.getParameter("mb_password"));
		m.setMemberName(request.getParameter("mb_name"));
		m.setEmail(request.getParameter("mb_email"));

		m.setKhno(Integer.parseInt(request.getParameter("mb_khNum")));		
		m.setClass1(request.getParameter("mb_class"));

		int result=new MemberService().updateMember(m);
		String msg="";
	      String loc="";
	      System.out.println(result);
	      if(result>0) {
	         msg="성공!";
	         loc="/";
	      }else {
	         msg="실패!";
	         loc="/";
	      }
		 
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
