<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<h1>에러에러!!</h1>
	<p><%=exception.getMessage() %></p>
	<button onclick="location.href=
	'<%=request.getContextPath()%>/'">
	메인페이지로</button>
</body>
</html>








