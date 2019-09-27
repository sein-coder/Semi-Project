package com.umo.inquery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Inquery;

/**
 * Servlet implementation class InqueryBoardServlet
 */
@WebServlet("/inquery/inqueryBoard")
public class InqueryBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = request.getParameter("numPerPage")!=null?Integer.parseInt(request.getParameter("numPerPage")):5;
		
		InqueryService service = new InqueryService();
		
		int totalData = service.selectBoardCount();
		String name="";
		String userId="";
		List<Inquery> list = service.selectInqueryBoardList(cPage,numPerPage,name,userId);
		
		String pageBar = "";
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 10;
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		if(pageNo==1) {
			pageBar += "<strong class='pg_page pg_start'>이전</strong>";
		}else {
			pageBar += "<a class='pg_page pg_start' href='"+request.getContextPath()+"/inquery/inqueryBoard?cPage="+(pageNo-1)+"'>이전</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<strong class='pg_current'>"+pageNo+"</strong>";
			}else {
				pageBar += "<a class='pg_page' href='"+request.getContextPath()+"/inquery/inqueryBoard?cPage="+pageNo+"'> "+pageNo+" </a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar += "<strong class='pg_page pg_end'>다음</strong>";
		}else {
			pageBar += "<a class='pg_page pg_end' href='"+request.getContextPath()+"/inquery/inqueryBoard?cPage="+pageNo+"'>다음</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("cPage", cPage);

		request.getRequestDispatcher("/views/inquery/inqueryListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
