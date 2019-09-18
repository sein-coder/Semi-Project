package com.umo.webCompiler.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.umo.webCompiler.model.service.webCompilerService;

/**
 * Servlet implementation class CodeInputServlet
 */
@WebServlet("/webCompiler/codeInput")
public class CodeInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CodeInputServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String lang = request.getParameter("language-choice");
		String inputCode = request.getParameter("inputCode");
		
		String saveDir = getServletContext().getRealPath("/upload/inputCode"); //파일생성
		File f = new File(saveDir+"/"+"Test.java"); if(!(f.exists())) {
		f.createNewFile(); } BufferedWriter writer = new BufferedWriter(new
		OutputStreamWriter(new FileOutputStream(f),"MS949"));
		writer.write(inputCode); writer.close(); //컴파일 및 실행 결과파일값들 가져오기 List<File>
		List<File> filelist = new webCompilerService().compile(lang,f);
		request.setAttribute("filelist", filelist);
		
		String CodeResult = "";
		 
		for(File file : filelist) {
			BufferedReader bufReader = new BufferedReader(new FileReader(file));
			
			String line = "";
			while((line = bufReader.readLine()) != null) {
				CodeResult+=line+",";
			}
			bufReader.close();
			file.delete();
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(CodeResult,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
