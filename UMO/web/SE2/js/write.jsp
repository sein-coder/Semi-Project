<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String content=request.getParameter("board_contents");
	
	System.out.println("내용:+content");
	