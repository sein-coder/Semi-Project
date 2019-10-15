package com.umo.inquery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.freeboard.service.FreeBoardService;
import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;
import com.umo.model.vo.Inquery;
import com.umo.model.vo.InqueryComment;
import com.umo.model.vo.Member;

/**
 * Servlet implementation class InqueryViewServlet
 */
@WebServlet("/inquery/inqueryView")
public class InqueryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		int Board_No=Integer.parseInt((request.getParameter("Board_No")));
		Cookie[] cookies=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;
		if(cookies!=null) {
			for(Cookie c:cookies) {
				String name=c.getName();
				String value=c.getValue();
				if("boardCookie".equals(name)) {
					boardCookieVal=value;//이전값보관
					if(value.contains("|"+Board_No+"|")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		//안읽었을때 조회수를 추가하고 cookie에 현재 boardNo기록
		if(!hasRead) {
			Cookie c=new Cookie("boardCookie",boardCookieVal+"|"+Board_No+"|");
			c.setMaxAge(-1);//브라우저가 close|로그아웃했을때
			response.addCookie(c);
			
		}
		Inquery inquery = new InqueryService().selectBoardView(Board_No);
		InqueryService service = new InqueryService();
		List<InqueryComment> list = service.selectComment(Board_No);
		
		Inquery preb= null;
		Inquery nextb = null;
		
		int i = 1;
		
		while(true) {
			preb = service.selectBoardView(Board_No-i);
			if((preb!=null && preb.getBoard_No()!=0) || i > service.selectBoardCount(null, null)) {
				break;
			}
			i=i+1;
		}
		
		i = 1;
		
		while(true) {
			nextb = service.selectBoardView(Board_No+i);
			if((nextb!=null && nextb.getBoard_No()!=0) || i > service.selectBoardCount(null, null)) {
				break;
			}
			i=i+1;
		}
		

		request.setAttribute("preb", preb);
		request.setAttribute("nextb", nextb);
		
		request.setAttribute("list", list);
		if(request.getParameter("board_type")!=null && request.getParameter("board_type").equals("scrap")) {
			request.setAttribute("board_type", "scrap");
		}else {
	    	request.setAttribute("board_type", "inquery");
		}
	    request.setAttribute("titlename", "질의");
	    request.setAttribute("inquery", inquery);
	    
	    request.getRequestDispatcher("/views/inquery/inqueryView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
