<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지쓰기</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
<%@ page import="java.util.List,com.umo.memo.model.vo.Memo" %>
<%
	String userId = request.getAttribute("userId").toString();
	Memo memo = (Memo)request.getAttribute("memo");
	String type = request.getAttribute("type").toString();
%>
</head>
<body>
	<div id="memo_view" class="new_win">
		<h1 id="win_title">
			<i class="fa fa-envelope-o" aria-hidden="true"></i> 받은 쪽지 보기
		</h1>
		<div class="new_win_con">
			<!-- 쪽지함 선택 시작 { -->
			<ul class="win_ul">
				<li><a href="<%=request.getContextPath()%>/memoListServlet?userId=<%= userId %>">받은쪽지</a></li>
				<li><a href="<%=request.getContextPath()%>/sendMemoListServlet?userId=<%= userId %>">보낸쪽지</a></li>
				<li><a href="<%=request.getContextPath()%>/memoWriteServlet?userId=<%= userId %>">쪽지쓰기</a></li>
			</ul>
			<!-- } 쪽지함 선택 끝 -->

			<article id="memo_view_contents">
				<header>
					<h2><%= memo.getNotes_contnet() %></h2>
				</header>
				<ul id="memo_view_ul">
					<li class="memo_view_li memo_view_name"><span
						class="memo_view_subj"><%= memo.getSend_id() %></span> <strong><span
							class="profile_img"> <img
								src="<%=request.getContextPath()%>/images/icon/icon1.png" alt="profile_img"
								width="20" height="20" title=""></span><%= memo.getSend_id() %></strong></li>
					<li class="memo_view_li memo_view_date"><strong><i
							class="fa fa-clock-o" aria-hidden="true"></i><%= memo.getSent_date() %></strong></li>
				</ul>
				<p><%= memo.getNotes_contnet() %></p>
			</article>


			<div class="win_btn">
				<% if(type.equals("send")) { %>
					<a href="<%= request.getContextPath() %>/sendMemoListServlet?userId=<%= userId %>" class="btn btn_b01"><i class="fa fa-list"
					aria-hidden="true"></i> 목록</a>
				<% } else { %>
					<a href="<%= request.getContextPath() %>/memoListServlet?userId=<%= userId %>" class="btn btn_b01"><i class="fa fa-list"
					aria-hidden="true"></i> 목록</a>
				<% } %>
				<button type="button" onclick="window.close();" class="btn_close">창닫기</button>
			</div>
		</div>
	</div>
</body>
</html>