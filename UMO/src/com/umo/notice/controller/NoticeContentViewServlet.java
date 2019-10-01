package com.umo.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.umo.model.vo.BoardComment;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;

/**
 * Servlet implementation class NoticeContentViewServlet
 */
@WebServlet("/noticeContentView")
public class NoticeContentViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeContentViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt((request.getParameter("noticeNo")));
		
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
		NoticeBoardService service=new NoticeBoardService();
		
		NoticeBoard nb= service.selectnoticeBoard(no,hasRead);
		NoticeBoard prenb= null;
		NoticeBoard nextnb = null;
		
		int i = 1;
		
		while(true) {
			prenb = service.noticeBoardContent(no-i);
			if(prenb.getNo()!=0 || i > service.countNoticeList(null, null)) {
				break;
			}
			i=i+1;
		}
		
		i = 1;
		
		while(true) {
			nextnb = service.noticeBoardContent(no+i);
			if(nextnb.getNo()!=0 || i > service.countNoticeList(null, null)) {
				break;
			}
			i=i+1;
		}

		
		List<BoardComment> list=service.selectnoticeBoardComment(no);
		
		request.setAttribute("nb", nb);
		request.setAttribute("prenb", prenb);
		request.setAttribute("nextnb", nextnb);
		
		request.setAttribute("comments", list);
		request.getRequestDispatcher("/views/notice/noticeContentView.jsp").forward(request, response);
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
