package com.umo.inquery.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InqueryFileDownloadServlet
 */
@WebServlet("/inquery/inqueryFileDownload")
public class InqueryFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InqueryFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName = request.getParameter("fileName");
		
		String root = getServletContext().getRealPath("/");
		String saveDir = root+"/upload/inquery";
		
		File f = new File(saveDir+"/"+fileName);
		
		BufferedInputStream bi = new BufferedInputStream(new FileInputStream(f));
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);

		String reNameFile = "";
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE")!=-1
				||request.getHeader("user-agent").indexOf("Trident")!=-1;
		
		if(isMSIE) {
			reNameFile = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		}else {
			reNameFile = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename="+reNameFile);
		response.setContentType("application/octet-stream");
		
		int read = -1;
		while((read = bi.read())!=-1) {
			bos.write(read);
		}
		bos.close();
		bi.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
