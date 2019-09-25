package com.umo.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.umo.model.vo.NoticeBoard;
import com.umo.notice.model.service.NoticeBoardService;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/noticeWriteEnd")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				if(!ServletFileUpload.isMultipartContent(request)) {
					request.setAttribute("msg", "ê³µì??‚¬?•­ ?‘?„±?š”ë¥?![form:enctype ê´?ë¦¬ì?—ê²? ë¬¸ì˜ ?•˜?„¸?š”]");
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					return;
				}
				
				String root=getServletContext().getRealPath("/");
				System.out.println("root : "+root);
				
				String saveDir=root+"/upload/notice";
			    
				//?—…ë¡œë“œ ?ŒŒ?¼?¬ê¸? ?„¤? •
				int maxSize=1024*1024*10;
				
				//multipartRequest ê°ì²´?ƒ?„±
				
				//ê°ì²´?ƒ?„±?‹œ ë§¤ê°œë©´ìˆ˜ê°? ?ˆ?Š” ?ƒ?„±?ë¥? ?´?š©
				//ë§¤ê°œë³??ˆ˜ : 1.request 2.?ŒŒ?¼???¥ê²½ë¡œ 3.?ŒŒ?¼ìµœë??¬ê¸? 4.?¸ì½”ë”©ê°? 5.rename? •ì±?(?ŒŒ?¼?´ë¦?) ì¤‘ë³µ?˜ë©? ?•ˆ?¨
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
				
				NoticeBoard nb=new NoticeBoard();
				
				
				
				nb.setTitle(title);
				nb.setWriter(writer);
				nb.setContent(content);
				nb.setOriginal_filename(fileName);
				
				int result=new NoticeBoardService().noticeWrite(nb);
				int noticeNo=new NoticeBoardService().lastNoticeContentNo(writer);
				System.out.println("ìµœì‹ ê³µì??‚¬?•­ no:"+noticeNo);
				
						
				String msg="";
				String loc="";
				//ë·°ì—?„œ ?‹¤ë¥? ë·°ë¡œ ?´?™?•˜?Š” ì£¼ì†Œ
				String view="/views/common/msg.jsp";//index.jsp
				
				if(result>0) {
					msg="ê³µì??‚¬?•­ ?“±ë¡? ?„±ê³?"; loc="/noticeContentView?noticeNo="+noticeNo;
				}else {
					msg="ê³µì??‚¬?•­ ?“±ë¡? ?‹¤?Œ¨"; loc="/noticeWriteEnd";
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				request.getRequestDispatcher(view).forward(request, response);
				
				
				
				System.out.println("?“±ë¡ì™„ë£?");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
