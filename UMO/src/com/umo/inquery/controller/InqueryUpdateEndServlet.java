package com.umo.inquery.controller;

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
import com.umo.inquery.model.service.InqueryService;
import com.umo.model.vo.Inquery;

/**
 * Servlet implementation class InqueryUpdateEndServlet
 */
@WebServlet("/inquery/inqueryUpdateEnd")
public class InqueryUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "질의작성 오류[관리자에게 문의하세요]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		int maxSize = 1024*1024*10;
		
		String root = getServletContext().getRealPath("/");
		
		String saveDir = root+"/upload/inquery";
		
		MultipartRequest mr = new MultipartRequest(request, saveDir,maxSize,"UTF-8",new DefaultFileRenamePolicy());

		int board_No = Integer.parseInt(mr.getParameter("inquery_no"));
		String board_Title = mr.getParameter("inquery_title");
		String board_Contents = mr.getParameter("inquery_content");
		String inputCode = mr.getParameter("inputCode");
		String outputCode = mr.getParameter("outputCode");		
		
		String fileName = mr.getFilesystemName("up_file");
		String original_FileName = mr.getOriginalFileName("up_file");
		String pre_fileName = mr.getParameter("pre_file");
		
		File f = mr.getFile("up_file");
		
		if(f!=null && f.length()>0) {
			File deleteFile = new File(saveDir+"/"+pre_fileName);
			boolean result = deleteFile.delete();
		}else {
			fileName = pre_fileName;
		}
		
		Inquery inquery = new Inquery();
		inquery.setBoard_No(board_No);
		inquery.setBoard_Title(board_Title);
		inquery.setBoard_Contents(board_Contents);

		inquery.setInputCode(inputCode);
		inquery.setOutputCode(outputCode);
		
		inquery.setRenamed_FileName(fileName);
		inquery.setOriginal_FileName(original_FileName);			
		
		InqueryService service = new InqueryService();
		int result = service.updateInquery(inquery);
			  
		String msg = ""; String loc = "";
			 
		if(result > 0) { msg = "성공"; loc = "/inquery/inqueryView?Board_No="+board_No; }
		else { msg = "실패"; loc = "/"; }
			  
		request.setAttribute("msg", msg); 
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
