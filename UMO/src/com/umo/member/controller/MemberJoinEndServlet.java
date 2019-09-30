package com.umo.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class MemberJoinEndServlet
 */
@WebServlet(name="MemberJoinEnd", urlPatterns="/memberJoinEnd")
public class MemberJoinEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("mb_id");
		String pw=request.getParameter("mb_password");
		String name=request.getParameter("mb_name");
		String email=request.getParameter("mb_email");
		String class1=request.getParameter("class1");
		int khno= Integer.parseInt(request.getParameter("mb_khNum"));

		Member m = new Member();
		m.setMemberId(id);
		m.setMemberPw(pw);
		m.setMemberName(name);
		m.setEmail(email);
		m.setClass1(class1);
		m.setKhno(khno);
		
		int result=new MemberService().registMember(m);
		String msg=result>0?"성공":"실패";
		String loc="/";
		if(result>0) {
		loc="/";	
		}else {
			loc="/views/member/memberJoin.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("views/common/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
