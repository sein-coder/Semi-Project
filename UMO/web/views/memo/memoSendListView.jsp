<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸쪽지</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
</head>
<body>
	<div id="memo_list" class="new_win">
		<h1 id="win_title">
			<i class="fa fa-envelope-o" aria-hidden="true"></i> 내 쪽지함
		</h1>
		<div class="new_win_con">
			<ul class="win_ul">
				<li><a
					href="<%=request.getContextPath()%>/views/memo/memoGetListView.jsp">받은쪽지</a></li>
				<li class="selected"><a
					href="<%=request.getContextPath()%>/views/memo/memoSendListView.jsp">보낸쪽지</a></li>
				<li><a
					href="<%=request.getContextPath()%>/views/memo/memoWriteView.jsp">쪽지쓰기</a></li>
			</ul>
			<div class="win_total">
				<span> 전체 받은쪽지 1통<br>
				</span>
			</div>
			<div class="list_01">

				<ul>
					<li><span class="memo_name"><a
							href="<%=request.getContextPath()%>/views/memo/memoContentView.jsp">보낸사람
								이름</a></span> <span class="memo_datetime">받은 날짜 <a href=""
							onclick="(메모삭제기능)" class="memo_del"><i
								class="fa fa-times-circle" aria-hidden="true"></i> </a></span></li>
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