<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
<%@ page import="java.util.List,com.umo.memo.model.vo.Memo" %>
<% 
	List<Memo> list = (List<Memo>)request.getAttribute("list");
	String userId = request.getAttribute("userId").toString();
%>

</head>
<body>
	<div id="memo_list" class="new_win">
		<h1 id="win_title">
			<i class="fa fa-envelope-o" aria-hidden="true"></i> 내 쪽지함
		</h1>
		<div class="new_win_con">
			<ul class="win_ul">
				<li class="selected"><a href="<%=request.getContextPath()%>/memoListServlet?userId=<%= userId %>">받은쪽지</a></li>
				<li><a href="<%=request.getContextPath()%>/sendMemoListServlet?userId=<%= userId %>">보낸쪽지</a></li>
				<li><a href="<%=request.getContextPath()%>/memoWriteServlet?userId=<%= userId %>">쪽지쓰기</a></li>
			</ul>
			<div class="win_total">
				<span> 전체 받은쪽지 <%= list.size() %>통<br>
				</span>
			</div>
			<div class="list_01">
				<ul>
					<% for(Memo m : list) { %>
					<li><span class="memo_name"><a
							href="<%=request.getContextPath()%>/memoContentView?memoNo=<%= m.getNotes_no() %>&userId=<%=userId%>&type=receive"><%= m.getSend_id()!=null?m.getSend_id():"익명" %></a>
							</span> <span class="memo_datetime"><%= m.getRead_date()!=null?m.getRead_date():"안 읽음" %> <a href=""
							onclick="(메모삭제기능)" class="memo_del"><i
								class="fa fa-times-circle" aria-hidden="true"></i> </a></span>
					</li>
					<% } %>
				</ul>
			</div>

			<!-- 페이지 -->

			<p class="win_desc">
				쪽지 보관일수는 최장 <strong>60</strong>일 입니다.
			</p>

			<div class="win_btn">
				<button type="button" onclick="window.close();" class="btn_close">창닫기</button>
			</div>
		</div>
	</div>
</body>
</html>