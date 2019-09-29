package com.umo.anonymousboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.umo.anonymousboard.service.AnonymousBoardService;
import com.umo.model.vo.Board;
import com.umo.notice.model.service.NoticeBoardService;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/anonymousWriteEnd")
public class AnonymousWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnonymousWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				if(!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("msg", "익명게시판 작성오류![form:enctype 관리자에게 문의 하세요]");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					return;
				}
				
				String root=getServletContext().getRealPath("/");
				System.out.println("root : "+root);
				
				String saveDir=root+"/upload/anonymous";
			    
				//업로드 파일크기 설정
				int maxSize=1024*1024*10;
				
				//multipartRequest 객체생성
				
				//객체생성시 매개면수가 있는 생성자를 이용
				//매개변수 : 1.request 2.파일저장경로 3.파일최대크기 4.인코딩값 5.rename정책(파일이름) 중복되면 안됨
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
				content=content.replace("\r\n", "<br>");
				String fileName=mr.getFilesystemName("up_file");
				
				Board ab=new Board();
				
				
				
				ab.setTitle(title);
				ab.setWriter(writer);
				ab.setContent(content);
				ab.setOriginal_filename(fileName);
				
				int result=new AnonymousBoardService().anonymousWrite(ab,writer);
				int anonymousNo=new AnonymousBoardService().lastAnonymousContentNo(writer);
				
						
				String msg="";
				String loc="";
				//뷰에서 다른 뷰로 이동하는 주소
				String view="/views/common/msg.jsp";//index.jsp
				
				if(result>0) {
					msg="익명게시판 등록 성공"; loc="/anonymousBoard";
				}else {
					msg="익명게시판 등록 실패"; loc="/anonymousWriteEnd";
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				request.getRequestDispatcher(view).forward(request, response);
				
				
				
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
