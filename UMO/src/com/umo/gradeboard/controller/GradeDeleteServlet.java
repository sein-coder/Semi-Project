package com.umo.gradeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.gradeboard.service.GradeBoardService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/gradeDelete")
public class GradeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int no=Integer.parseInt(request.getParameter("gradeNo"));
		int result=new GradeBoardService().GradeDelete(no);
		

String msg="";
String loc="";
if(result>0)
{
	msg="삭제완료";
	loc="/gradeBoard";
}

else {
	msg="다시입력하시오.";
	loc="/views/grade/gradeContentView?gradeNo="+no;
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
