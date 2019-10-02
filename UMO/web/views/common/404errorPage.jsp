<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<style>
body{text-align: center; margin-top: 20%; font-size:30px;}
</style>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<html>
<head>
<title>404에러 페이지</title>
</head>
<body>
<strong>요청하신 페이지는 존재하지 않습니다.</strong>
<br></br>
주소를 올바르게 입력했는 지 확인해 보시기 바랍니다.


</body>
</html>
