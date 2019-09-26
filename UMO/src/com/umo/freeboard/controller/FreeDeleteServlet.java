package com.umo.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.freeboard.service.FreeBoardService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/freeDelete")
public class FreeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int no=Integer.parseInt(request.getParameter("freeNo"));
		int result=new FreeBoardService().freeDelete(no);
		

String msg="";
String loc="";
if(result>0)
{
	msg="삭제완료";
	loc="/freeBoard";
}

else {
	msg="다시입력하시오.";
	loc="/views/free/freeContentView?freeeNo="+no;
}
request.setAttribute("msg", msg);
request.setAttribute("loc", loc);
request.getRequestDispatcher("/views/common/msg.jsp")
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
