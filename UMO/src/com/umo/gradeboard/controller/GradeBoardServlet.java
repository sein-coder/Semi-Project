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
		
		if(request.getSession().getAttribute("loginMember")==null) {
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
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch (NumberFormatException e) {
			numPerPage =10;
		}
		//sfl는 선택창
		//stx는 검색어
		String sfl=request.getParameter("sfl");
		String stx=request.getParameter("stx");

		if(sfl!=null&&sfl.contains("board")) {
			sfl = sfl.replaceAll("board", "grade");
		}
		
		GradeBoardService service=new GradeBoardService();
	    int totalData=service.countGradeList(sfl,stx);
	    String name="";
	    String userId="";
	    List<Board> list =service.selectGradeBoardList(cPage, numPerPage,name,userId,sfl,stx);
	    
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
			+"/gradeBoard?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>이전</a>";
		}
		//중간 클릭한 페이지(숫자) 만들기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar+="<a class='pg_page' href='"+request.getContextPath()
				+"/gradeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//[다음]만들기
		if(pageNo>totalPage) {
			pageBar+="<strong class='pg_page pg_end'>다음</strong>";
		}
		else {
			pageBar+="<a class='pg_page pg_end' href='"+request.getContextPath()
			+"/gradeBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>다음</a>";
			
		}
		
		request.setAttribute("cPage",cPage);
		request.setAttribute("pageBar",pageBar);
	    request.setAttribute("list", list);	
	    request.setAttribute("board_type", "grade");
	    request.setAttribute("titlename", "반별");
	    request.setAttribute("numPerPage", numPerPage);
	    
	    request.getSession().setAttribute("board_path", "upload/grade/contentimg");
	    
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
