package com.umo.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;

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
		int numPerPage;
		String orderType;
		
		try {
			orderType = request.getParameter("orderType").toString();
		}catch(NullPointerException e) {
			orderType = "default";
		}

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		    cPage=1;
		}
		
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch (NumberFormatException e) {
			numPerPage =10;
		}
		//sfl는 선택창
		//stx는 검색어
		String sfl=request.getParameter("sfl");
		String stx=request.getParameter("stx");	
		
	    NoticeBoardService service=new NoticeBoardService();
	    int totalData=service.countNoticeList(sfl,stx);
	    
	    List<NoticeBoard> list =service.selectNoticeBoardList(cPage, numPerPage,sfl,stx,orderType);
	    
	    String pageBar="";
	    int totalPage=(int)Math.ceil((double)totalData/numPerPage);
	    int pageBarSize=10;
	    int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	    int pageEnd=pageNo+pageBarSize-1;
	    
	  //pageBar 소스코드작성!
		//[이전]만들기
	    if(pageNo==1) {
			pageBar+="<strong class='pg_page pg_start'>다음</strong>";
		}else {
			pageBar+="<a class='pg_page pg_start' href='"+request.getContextPath()
			+"/noticeBoard?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"&orderType="+orderType+"'>이전</a>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar+="<a class='pg_page' href='"+request.getContextPath()
				+"/noticeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"&orderType="+orderType+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]만들기
		if(pageNo>totalPage) {
			pageBar+="<strong class='pg_page pg_end'>다음</strong>";
		}
		else {
			pageBar+="<a class='pg_page pg_end' href='"+request.getContextPath()
			+"/noticeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"&orderType="+orderType+"'>다음</a>";
			
		}
		
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
	    request.setAttribute("list", list);
	    request.setAttribute("numPerPage", numPerPage);
	    request.setAttribute("orderType", orderType);
	    
	    request.getSession().setAttribute("board_path", "upload/notice/contentimg");
	    
		request.getRequestDispatcher("/views/notice/noticeListView.jsp").forward(request, response);	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}