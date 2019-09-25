package common.fileUpload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AjaxFileUploadServlet
 */
@WebServlet("/ajaxFile")
public class AjaxFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect("/");
			return;
		}
		
		//저장경로
		
		String root = getServletContext().getRealPath("/");
		
		String saveDir = root+"/upload/food/content";
		//크기
		int maxSize = 1024*1024*100;
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String originalFilenames = "";
		String renamedFilenames = "";
		
		Enumeration<String> orie = mr.getFileNames();
		Enumeration<String> renamee = mr.getFileNames();
		
		while(orie.hasMoreElements()) {
			originalFilenames+=mr.getOriginalFileName(orie.nextElement())+",";
		}
		
		while(renamee.hasMoreElements()) {
			renamedFilenames+=mr.getFilesystemName(renamee.nextElement())+",";
		}
		
		originalFilenames = originalFilenames.substring(0, originalFilenames.length()-1);
		renamedFilenames = renamedFilenames.substring(0, renamedFilenames.length()-1);
	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.append(originalFilenames);
		out.append("/");
		out.append(renamedFilenames);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
