	package com.umo.notice.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.umo.board.model.service.BoardService;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("loc", "/noticeBoard");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		
		String saveDir=getServletContext().getRealPath("/upload/notice");
		
		int maxSize=1024*1024*10;
		
		MultipartRequest mr=new MultipartRequest(
					request,
					saveDir,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
				);
		String title=mr.getParameter("title");
		String writer=mr.getParameter("writer");
		String content=mr.getParameter("content");
		String fileName=mr.getFilesystemName("up_file");
		String oriFile=mr.getParameter("ori_file");
		System.out.println(title+writer+content+fileName+oriFile);
		//파일 삭제용
		File f=mr.getFile("up_file");
		
		if(f!=null&&f.length()>0) {
			File deleteFile=new File(saveDir+"/"+oriFile);
			boolean result=deleteFile.delete();
			System.out.println(result);
		}else {
			fileName=oriFile;
		}
		NoticeBoard nb=new NoticeBoard();
		nb.setTitle(title);
		nb.setWriter(writer);
		nb.setContent(content);
		nb.setOriginal_filename(fileName);
		nb.setNo(Integer.parseInt(mr.getParameter("no")));
		
		int result=new NoticeBoardService().noticeUpdate(nb);
		String msg="";
		String loc="";
		String views="/views/common/msg.jsp";
		if(result>0) {
			msg="공지사항 수정이 완료되었습니다.";
		}else {
			msg="공지사항 수정실패";
		}
		System.out.println(mr.getParameter("no"));
		loc="/noticeUpdate?noticeNo="+mr.getParameter("no");
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher(views)
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
