<%@page import="org.apache.catalina.realm.NullRealm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<section>
	<p>검색된 아이디</p>
	<p><%= request.getParameter("id")!=null?request.getParameter("id"):request.getParameter("pw") %></p>
</section>
