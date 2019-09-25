package com.umo.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.admin.service.AdminService;
import com.umo.model.vo.Member;;
/**
 * Servlet implementation class AdminMemberFinderServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		
		System.out.println(type+" "+keyword);
		
	
		
		int cPage;//현재 페이지 
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;//처리내용
		}
		int numPerPage=request.getParameter("numPerPage")!=null?Integer.parseInt(request.getParameter("numPerPage")):5;
		//cPage,numPerPage로 구현 가능
		
		//데이터 불러오기
		AdminService service=new AdminService();
		List<Member> list=service.selectSearch(cPage, numPerPage,type,keyword);
		
		
		int totalData=service.selectSearchCount(type, keyword);
		
		
		//먼저 셋팅해주기
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		//pageBar소스 코드 작성
		//이전 만들기
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/memberFinder?cPage="+(pageNo-1)
					+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>[이전]</a>";
		}
		//페이지 링크 구하기
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/memberFinder?cPage="+pageNo
						+"&searchType="+type+"&searchKeyword="+keyword+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
				
			}
			pageNo++;
		}
		//다음 만들기
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+=pageBar+="<a href='"+request.getContextPath()+"/admin/memberFinder?cPage="+pageNo
					+"&searchType="+type+"&searchKeyword="+keyword+"&numPerage="+numPerPage+"'>[다음]</a>";
			
		}
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);//memberlist.jsp에 다시 보낸거//값이 남아 있께 하려고
		request.setAttribute("type", type);
		request.setAttribute("numPerPage", numPerPage);
		
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
