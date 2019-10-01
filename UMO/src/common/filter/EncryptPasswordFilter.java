package common.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;



/**
 * Servlet Filter implementation class EncryptPasswordFilter
 */
//@WebFilter("/EncryptPasswordFilter")
public class EncryptPasswordFilter extends HttpServletRequestWrapper  {

    public EncryptPasswordFilter(HttpServletRequest request) {
        super(request);
        // TODO Auto-generated constructor stub
    }

	@Override
	public String getParameter(String key) {
		// TODO Auto-generated method stub
		String value="";
		if(key!=null&&(key.equals("mb_password"))) {
			value=getEncryptPw(super.getParameter(key));	
		}else {
			value=super.getParameter(key);
		}
		return value;
	}

	public static String getEncryptPw(String pw)
	{
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e)
		{
			e.printStackTrace();
		}
		byte[] bytes;
		try {
			bytes=pw.getBytes("UTF-8");
			md.update(bytes);
		}catch(UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		String encryPw=Base64.getEncoder().encodeToString(md.digest());
		return encryPw;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	



	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	

}
