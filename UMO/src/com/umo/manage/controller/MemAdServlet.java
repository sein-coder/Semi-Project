package com.umo.manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.umo.admin.service.AdminService;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class MemAdServlet
 */
@WebServlet("/membermanage")
public class MemAdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemAdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
HttpSession session=request.getSession(false);
		
if(session.getAttribute("loginMember")==null||
!((Member)session.getAttribute("loginMember")).getMemberId().equals("admin")){
	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	request.setAttribute("loc", "/");
	request.getRequestDispatcher("/view/common/msg.jsp").forward(request, response);
}
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch(NumberFormatException e)
		{
			cPage=1;
			           
		}
		int numPerPage=4;
		AdminService service=new AdminService();
		int totalData=service.adoptCountMember();
		List<Member> list=service.adoptMemberList(cPage,numPerPage);
		
		
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		if(pageNo==1)
		{
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/membermanage?cPage="+(pageNo-1)+"'>[이전]</a>";
			
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage))
		{
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>"; 
				
				}else {
					pageBar+="<a href='"+request.getContextPath()+"/membermanage?cPage="+pageNo+"'>"
							+pageNo+"</a>";
				}
			pageNo++;
		}
			
		if(pageNo>totalPage)
		{
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()+"/membermanage?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		
		

		request.getRequestDispatcher("/views/admin/memberList2.jsp")
		.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
