package com.umo.inquery.controller;

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
 * Servlet implementation class QuestionWriteEndServlet
 */
@WebServlet("/inquery/inqueryWriteEnd")
public class InqueryWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryWriteEndServlet() {
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

		String board_Writer = mr.getParameter("writer");
		String board_Title = mr.getParameter("inquery-title");
		String board_Contents = mr.getParameter("inquery-content");
		String inputCode = mr.getParameter("inputCode");
		String outputCode = mr.getParameter("outputCode");		
		String code_Type = mr.getParameter("code-type");
		String fileName = mr.getFilesystemName("up_file");
		String original_FileName = mr.getOriginalFileName("up_file");
		
		System.out.println(fileName);
		System.out.println(mr.getFilesystemName("up_file"));
		
		Inquery inquery = new Inquery();
		inquery.setBoard_Writer(board_Writer);
		inquery.setBoard_Title(board_Title);
		inquery.setBoard_Contents(board_Contents);

		inquery.setInputCode(inputCode);
		inquery.setOutputCode(outputCode);
		
		inquery.setCode_Type(code_Type);
		inquery.setRenamed_FileName(fileName);
		inquery.setOriginal_FileName(original_FileName);
		
		
		InqueryService service = new InqueryService();
		int result = service.insertInquery(inquery);
			  
		String msg = ""; String loc = "";
			 
		if(result > 0) { msg = "성공"; loc = "/"; }else { msg = "실패"; loc = "/"; }
			  
		request.setAttribute("msg", msg); request.setAttribute("loc", loc);
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
