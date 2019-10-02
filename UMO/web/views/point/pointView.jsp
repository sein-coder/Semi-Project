<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내포인트</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
<%@ page import="com.umo.model.vo.Member" %>
</head>

<body>
<div id="point" class="new_win">
    <h1 id="win_title"><i class="fa fa-database" aria-hidden="true"></i> <%= ((Member)request.getSession().getAttribute("loginMember")).getMemberId() %>님의 포인트 내역</h1>

		<div class="new_win_con list_01">

			<ul>
				<li class="point_all">보유포인트 <span><i
						class="fa fa-database" aria-hidden="true"></i> <%= ((Member)request.getSession().getAttribute("loginMember")).getPoint() %>(전체포인트)</span>
				</li>

			</ul>

		</div>


		<button type="button" onclick="javascript:window.close();" class="btn_close">창닫기</button>
</div>
</body>
</html>