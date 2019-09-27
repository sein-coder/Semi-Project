package com.umo.gradeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.gradeboard.service.GradeBoardService;
import com.umo.model.vo.Board;

/**
 * Servlet implementation class FreeBoardServlet
 */
@WebServlet("/gradeBoard")
public class GradeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		    cPage=1;
		}
		int numPerPage=10;
		GradeBoardService service=new GradeBoardService();
	    int totalData=service.countGradeList();
	    String name="";
	    String userId="";
	    List<Board> list =service.selectGradeBoardList(cPage, numPerPage,name,userId);
	    
	    String pageBar="";
	    int totalPage=(int)Math.ceil((double)totalData/numPerPage);
	    int pageBarSize=10;
	    int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	    int pageEnd=pageNo+pageBarSize-1;
	    
	  //pageBar 소스코드작성!
		//[이전]만들기
		if(pageNo==1) {
			pageBar+="<li><span>[이전]</span></li>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/gradeBoard?cPage="+(pageNo-1)+"'><span>[이전]</span></a>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li>"+"<a href='#'>"+pageNo+"</a>"+"</li>";
			}else {
				pageBar+="<li>"+"<a href='"+request.getContextPath()
				+"/gradeBoard?cPage="+pageNo+"'>"+pageNo+"</a>"+"</li>";
			}
			pageNo++;
		}
		//[다음]만들기
		if(pageNo>totalPage) {
			pageBar+="<li><span>[다음]</span></li>";
		}
		else {
			pageBar+="<li><a href='"+request.getContextPath()
			+"/gradeBoard?cPage="+pageNo+"'><span>[다음]</span></a></li>";
			
		}
		
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
	    request.setAttribute("list", list);	
		request.getRequestDispatcher("/views/grade/gradeBoard.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
