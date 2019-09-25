package com.umo.notice.controller;

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
 * Servlet implementation class NoticeFileDownLoadServlet
 */
@WebServlet("/notice/fileDown")
public class NoticeFileDownLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileName=request.getParameter("fileName");
		System.out.println(fileName);
		
		//서버에 저장된 파일을 client한테 전송!
		//1. 실제저장경로에서 파일 불러오기(inputStream)
		//2. 파일입출력을 위한 스트림 생성
		//   파일불러올때는 서버에서 inputStream생성
		//   파일을 보낼때 : client -> response에서 스트림 받아서 처리
		//3. 파일에 대한 인코딩(브라우저에따른 인코딩처리)
		//4. 해더환경설정 
		//	응답 contentType설정(application/octet-stream
		//   Content-Disposition설정 : 파일을 어떻게 받을것인지, 파일명설정
		//   attachment(다운로드 팝업 open)
		//   /inline(브라우저가 열수있는 확장자면 브라우저에서 open)
		//   filename=파일명
		//5. outputStream으로 해당 파일 보내기! write()!!
		
		String root=getServletContext().getRealPath("/");
		String saveDir=root+"/upload/notice";
		
		//inputStream생성
		File f=new File(saveDir+"/"+fileName);
		BufferedInputStream bi=new BufferedInputStream(new FileInputStream(f));		
		
		//보낼 outputStream생성
		ServletOutputStream sos=response.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		//브라우저에 맞춰 인코딩처리, 파일명
		String reNameFile="";
		boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1
				||request.getHeader("user-agent").indexOf("Trident")!=-1;
		if(isMSIE) {
			reNameFile=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		}else {
			reNameFile=new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		//response해더설정
		response.setHeader("Content-Disposition",
				"attachment;filename="+reNameFile);
		response.setContentType("application/octet-stream");
		
		//파일전송!!
		int read=-1;
		while((read=bi.read())!=-1) {
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
