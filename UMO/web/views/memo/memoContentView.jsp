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
</head>
<body>
	<div id="memo_view" class="new_win">
		<h1 id="win_title">
			<i class="fa fa-envelope-o" aria-hidden="true"></i> 받은 쪽지 보기
		</h1>
		<div class="new_win_con">
			<!-- 쪽지함 선택 시작 { -->
			<ul class="win_ul">
				<li><a
					href="<%=request.getContextPath()%>/views/memo/memoGetListView.jsp">받은쪽지</a></li>
				<li><a
					href="<%=request.getContextPath()%>/views/memo/memoSendListView.jsp">보낸쪽지</a></li>
				<li class="selected"><a
					href="<%=request.getContextPath()%>/views/memo/memoWriteView.jsp">쪽지쓰기</a></li>
			</ul>
			<!-- } 쪽지함 선택 끝 -->

			<article id="memo_view_contents">
				<header>
					<h2>쪽지 내용</h2>
				</header>
				<ul id="memo_view_ul">
					<li class="memo_view_li memo_view_name"><span
						class="memo_view_subj">보낸사람</span> <strong><span
							class="profile_img"> <img
								src="<%=request.getContextPath()%>/images/icon/icon1.png" alt="profile_img"
								width="20" height="20" title=""></span>보낸사람(ID로나오게)</strong></li>
					<li class="memo_view_li memo_view_date"><strong><i
							class="fa fa-clock-o" aria-hidden="true"></i> 받은 시간</strong></li>
				</ul>
				<p>쪽지내용</p>
			</article>


			<div class="win_btn">

				<a href="" class="btn btn_b01"><i class="fa fa-list"
					aria-hidden="true"></i> 목록</a>
				<button type="button" onclick="window.close();" class="btn_close">창닫기</button>
			</div>
		</div>
	</div>
</body>
</html>