package com.umo.freeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.freeboard.service.FreeBoardService;
import com.umo.model.vo.Board;

/**
 * Servlet implementation class FreeBoardServlet
 */
@WebServlet("/freeBoard")
public class FreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginMember")==null) {
			System.out.println("실행");
			request.setAttribute("msg", "로그인을 하셔야 열람 가능합니다.");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		int cPage;
		int numPerPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		    cPage=1;
		}
		try {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 10;			
		}
		//sfl는 선택창
		//stx는 검색어
		String sfl=request.getParameter("sfl");
		String stx=request.getParameter("stx");	
		
		if(sfl!=null&&sfl.contains("board")) {
			sfl = sfl.replaceAll("board", "free");
		}
		
		FreeBoardService service=new FreeBoardService();
	    int totalData=service.countFreeList(sfl,stx);
	    String name="";
	    String userId="";
	    List<Board> list =service.selectFreeBoardList(cPage, numPerPage,name,userId,sfl,stx);
	    
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
			+"/freeBoard?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>이전</a>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar+="<a class='pg_page' href='"+request.getContextPath()
				+"/freeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]만들기
		if(pageNo>totalPage) {
			pageBar+="<strong class='pg_page pg_end'>다음</strong>";
		}
		else {
			pageBar+="<a class='pg_page pg_end' href='"+request.getContextPath()
			+"/freeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>다음</a>";
			
		}
		
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
	    request.setAttribute("list", list);
	    request.setAttribute("numPerPage", numPerPage);
	    request.setAttribute("board_type", "free");
	    request.setAttribute("titlename", "자유");
	    
	    request.getSession().setAttribute("board_path", "upload/free/contentimg");
	    
		request.getRequestDispatcher("/views/board/boardListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
