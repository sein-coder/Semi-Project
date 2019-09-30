	package com.umo.freeboard.controller;

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
import com.umo.freeboard.service.FreeBoardService;
import com.umo.model.vo.Board;;


/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/freeUpdateEnd")
public class FreeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 요청입니다.");
			request.setAttribute("loc", "/freeBoard");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			return;
		}
		
		String saveDir=getServletContext().getRealPath("/upload/free");
		
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
		Board fb=new Board();
		fb.setTitle(title);
		fb.setWriter(writer);
		fb.setContent(content);
		fb.setOriginal_filename(fileName);
		fb.setNo(Integer.parseInt(mr.getParameter("no")));
		
		
		int result=new FreeBoardService().freeUpdate(fb);
		String msg="";
		String loc="";
		String views="/views/common/msg.jsp";
		if(result>0) {
			msg="자유게시판 수정이 완료되었습니다.";
		}else {
			msg="자유게시판 수정실패";
		}
		System.out.println(mr.getParameter("no"));
		loc="/freeUpdate?freeNo="+mr.getParameter("no");
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
