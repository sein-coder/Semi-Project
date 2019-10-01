package com.umo.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.member.model.service.MemberService;
import com.umo.model.vo.Member;

import static common.filter.EncryptPasswordFilter.getEncryptPw;

/**
 * Servlet implementation class InfoFindPwEnd
 */
@WebServlet("/infoFindPwEnd")
public class InfoFindPwEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoFindPwEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int KH_No = Integer.parseInt(request.getParameter("khNum"));
		String Id = request.getParameter("Id").toString();
		
		Member m = new MemberService().findPw(Id,KH_No);
		
		String tempPw="";
		if(m!=null) {
			tempPw += ((char)((int)(Math.random()*26)+97)) +""+ ((int)(Math.random()*1000000)+99999);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.append(tempPw);
			
			m.setMemberPw(getEncryptPw(tempPw));
			new MemberService().updateMember(m);
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
