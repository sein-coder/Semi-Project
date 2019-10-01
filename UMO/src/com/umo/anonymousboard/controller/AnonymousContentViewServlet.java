package com.umo.anonymousboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.anonymousboard.service.AnonymousBoardService;
import com.umo.freeboard.service.FreeBoardService;
import com.umo.model.vo.Board;
import com.umo.model.vo.BoardComment;

/**
 * Servlet implementation class FreeContentViewServlet
 */
@WebServlet("/anonymousContentView")
public class AnonymousContentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnonymousContentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int no=Integer.parseInt((request.getParameter("anonymousNo")));
		Cookie[] cookies=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false;
		if(cookies!=null) {
			for(Cookie c:cookies) {
				String name=c.getName();
				String value=c.getValue();
				if("boardCookie".equals(name)) {
					boardCookieVal=value;//이전값보관
					if(value.contains("|"+no+"|")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		//안읽었을때 조회수를 추가하고 cookie에 현재 boardNo기록
		if(!hasRead) {
			Cookie c=new Cookie("boardCookie",boardCookieVal+"|"+no+"|");
			c.setMaxAge(-1);//브라우저가 close|로그아웃했을때
			response.addCookie(c);
			
		}
		AnonymousBoardService service=new AnonymousBoardService();
		String boardid=service.selectid(no);
		if(boardid==null) {
			boardid="";
		}
		Board b= service.selectanonymousBoard(no,hasRead);
		
		Board preb= null;
		Board nextb = null;
		
		int i = 1;
		
		while(true) {
			preb = service.anonymousBoardContent(no-i);
			if(preb.getNo()!=0 || i > service.countanonymousList(null, null)) {
				break;
			}
			i=i+1;
		}
		
		i = 1;
		
		while(true) {
			nextb = service.anonymousBoardContent(no+i);
			if(nextb.getNo()!=0 || i > service.countanonymousList(null, null)) {
				break;
			}
			i=i+1;
		}
		
		List<BoardComment> list=service.selectanonymousBoardComment(no);
		
		request.setAttribute("boardid", boardid);
		request.setAttribute("b", b);
		request.setAttribute("preb", preb);
		request.setAttribute("nextb", nextb);
		
		request.setAttribute("comments", list);
	    request.setAttribute("board_type", "anonymous");
	    request.setAttribute("titlename", "익명");
	    
		request.getRequestDispatcher("/views/board/boardContentView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
