package com.umo.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.notice.model.vo.NoticeBoard;
import com.umo.notice.service.NoticeBoardService;

/**
 * Servlet implementation class ClassBoardListServlet
 */
@WebServlet("/noticeBoard")
public class NoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		    cPage=1;
		}
		int numPerPage=3;
	    NoticeBoardService service=new NoticeBoardService();
	    int totalData=service.countNoticeList();
	  
	    System.out.println("noticeListTotal : "+totalData);
	    
	    List<NoticeBoard> list =service.selectNoticeBoardList(cPage, numPerPage);
	    
	    String pageBar="";
	    int totalPage=(int)Math.ceil((double)totalData/numPerPage);
	    int pageBarSize=10;
	    int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	    int pageEnd=pageNo+pageBarSize-1;
	    
	  //pageBar 소스코드작성!
		//[이전]만들기
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/noticeBoard?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/noticeBoard?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]만들기
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()
			+"/noticeBoard?cPage="+pageNo+"'>[다음]</a>";
			
		}
		
		
		
	
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
	    request.setAttribute("list", list);
	    
		
		
		
		
		
		request.getRequestDispatcher("/views/notice/noticeBoard.jsp").forward(request, response);
		
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
