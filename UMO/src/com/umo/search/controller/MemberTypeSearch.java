package com.umo.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.admin.service.AdminService;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class MemberTypeSearch
 */
@WebServlet("/mef")
public class MemberTypeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberTypeSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("searchType");
		String word=request.getParameter("searchKeyword");
		System.out.println(type+":"+word);
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		AdminService service=new AdminService();
		int totalcount=service.selectMemberco(type,word);
		List<Member> list=service.findmembertype(cPage,numPerPage,type,word);
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalcount/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		if(pageNo==1)
		{
			pageBar="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/mef?cPage="+(pageNo-1)+"&searchType="
					+type+"&searchKeyword="+word+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage))
		if(pageNo==cPage)
		{
			pageBar="<span>"+pageNo+"</span>";
		}
		
		else {
			pageBar+="<a href='"+request.getContextPath()+"/mef?cPage="+pageNo+"&searchType="+type
					+"&searchKeyword="+word+"'>"+pageNo+"</a>";
		}pageNo++;
		
		if(pageNo>totalPage)
		{
			pageBar="<span>다음</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/mef?cPage="+pageNo
					+ "&searchType="+type
					+ "&searchKeyword="+word+"'>[다음]</a>";
		}
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/memberList2.jsp")
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
