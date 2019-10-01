<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<meta http-equiv="refresh" content="5; url='<%=request.getContextPath()%>/'">
<div style="text-align: center; margin-top: 20%;">
	<h2>에러 타입 : <%= exception.getClass().getName() %></h2>
	<h2>에러 메세지 : <%= exception.getMessage() %></h2>
</div>





