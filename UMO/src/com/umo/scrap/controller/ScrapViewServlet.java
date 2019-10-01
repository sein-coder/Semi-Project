package com.umo.scrap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.Member;
import com.umo.model.vo.Scrap;
import com.umo.scrap.service.ScrapService;

/**
 * Servlet implementation class ScrapViewServlet
 */
@WebServlet("/scrap/scrapViewServlet")
public class ScrapViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScrapViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String member_id = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
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
		
		int totalData = new ScrapService().selectScrapCount();
		
		List<Scrap> list = new ScrapService().selectScrapList(cPage,numPerPage,member_id);
		
		String pageBar = "";
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		if(pageNo==1) {
			pageBar += "<strong class='pg_page pg_start'>이전</strong>";
		}else {
			pageBar += "<a class='pg_page pg_start' href='"+request.getContextPath()
			+"/scrap/scrapViewServlet?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>이전</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar += "<a class='pg_page' href='"+request.getContextPath()
				+"/scrap/scrapViewServlet?cPage="+pageNo+"&numPerPage="+numPerPage+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<strong class='pg_page pg_end'>다음</strong>";
		}else {
			pageBar += "<a class='pg_page pg_end' href='"+request.getContextPath()
			+"/scrap/scrapViewServlet?cPage="+pageNo+"&numPerPage="+numPerPage+"'>다음</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/scrap/scrapView.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
