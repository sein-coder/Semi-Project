package com.umo.freeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.umo.food.model.service.*;
import com.umo.freeboard.service.FreeBoardService;
import com.umo.model.vo.Board;
import com.umo.model.vo.Member;
/**
 * Servlet implementation class FreeboardSearchList
 */
@WebServlet("/free/boardSearchList")
public class FreeboardSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session=request.getSession();
		
		if(session.getAttribute("writer")==null
				|| !((Member)session.getAttribute("loginMember")).getMemberId().equals("writer")){
			request.setAttribute("msg", "검색된 결과가 없습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		else {
		//회원에 대한 페이지 설정(1~5번은 1페)
			int cPage;//현재 페이지
			try {
				cPage=Integer.parseInt(request.getParameter("cPage"));//현재몇페이지인지 계속 알려줘야함
			}catch(NumberFormatException e){
				cPage=1;
			}
			int numPerPage=request.getParameter("numPerPage")!=null?Integer.parseInt(request.getParameter("numPerPage")):5;//5개로 설정
			
			//데이터 불러오기
			FreeBoardService service=new FreeBoardService();
			int totalData=service.selectCountWriter();
			List<Board> list=service.selectMemberList(cPage,numPerPage);//계산식 한 값을  여기에 넣어줌
			//그다음엔 사람들이 뷰를 통해 이전과 다음 현재를 볼수 있도록 구현하기
			
			//페이징 처리-여기서는 페이지 바를 만들기
			//pageBar:페이지바를 구성하는 코드를 누적시키는 변수
			//pageBarSize:페이지바에서 페이지 값이 출력되는 갯수
			//pageNo:페이지바에서 페이지값을 출력해주는 변수
			//pageEnd:페이지바에서 페이지값의 끝번호
			
			//먼저 셋팅해주기
			String pageBar="";
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=10;//cpage값이 1부터 10까지(10개씩 출력)
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;//끝값을 구해줌
			 
			//pageBar 소스코드 작성!
			//[이전]만들기
			if(pageNo==1) {
				//시작값->1
//				페이지 번호가 1이면
				pageBar+="<span>[이전]</span>";
				
			}
			else {
				//시작값 ->11,21,31~
				pageBar+="<a href='"+request.getContextPath()+"/foodBoard?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'>[이전]</a>";
			}
			
			//중간 클릭한 페이지 만들기(숫자)만들기
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<span>"+pageNo+"</span>";
				}else {
					//현재페이지가 누른 페이지 값과 같지 않을 때 주소로 누른 페이지 넘겨주기
					//페이지이동 이벤트처럼 쓰기 위해 a태그 쓰기
					pageBar+="<a href='"+request.getContextPath()+"/foodBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a>";
				}
				pageNo++;
			}
	
			
			//[다음]만들기
			if(pageNo>totalPage) {
				//pageno가 전체 페이지 수보다 크면 다음 
				pageBar+="<span>[다음]</span>";
			}
			else {
				//아니면 자기자신 페이지로 값 넘겨주기
				pageBar+="<a href='"+request.getContextPath()+"/foodBoard?cPage="+pageNo+"&numPerPage="+numPerPage+"'>[다음]</a>";
			}
			//누적한 값을 넘겨주기
			request.setAttribute("cPage", cPage);
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("list",list);
			request.setAttribute("numPerPage", numPerPage);
			
			
			
			request.getRequestDispatcher("/views/foodBoard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
