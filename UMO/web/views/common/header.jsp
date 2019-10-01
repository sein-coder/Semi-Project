<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우마오</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/connect_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/latest_basic_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/latest_pic_basic_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/latest_notice_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/outlogin_basic_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/visit_basic_style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board_basic_style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<%@ page import="com.umo.model.vo.Member" %>
<!-- loginMember객체 생성 -->
<% 
	Member loginMember = (Member)request.getSession().getAttribute("loginMember");
	int loginCount = application.getAttribute("loginCount")!=null?(int)application.getAttribute("loginCount"):0;
	int todayLogin = application.getAttribute("todayLogin")!=null?(int)application.getAttribute("todayLogin"):0;
	int allLogin = application.getAttribute("allLogin")!=null?(int)application.getAttribute("allLogin"):0;
	int maxLogin = application.getAttribute("maxLogin")!=null?(int)application.getAttribute("maxLogin"):0;
%>
<script>
	$(document).ready(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/sessionServlet",
			dataType:"text",
			type : "post", 
			success : function(data){
				$("#loginCount").val(<%=loginCount%>);
				$("#todayLogin").val(<%=todayLogin%>);
				$("#allLogin").val(<%=allLogin%>);
				$("#maxLogin").val(<%=maxLogin%>);
				$("#login-visit").load(window.location.href+" #login-visit");
			}
	});
});
	
setInterval(function(){
	$("#login-visit").load(window.location.href+" #login-visit");
},5000)
	
</script>

<!-- 상단 -->
<div id="hd_wrapper">

	<a href="<%=request.getContextPath()%>/index.jsp"><img
		src="<%=request.getContextPath()%>/images/umoLogo.png" alt="우마오"
		width="200px" height="115px"
		style="position: relative; left: 50px;"></a>

	<div class="hd_sch_wr">
		<fieldset id="hd_sch">
			<legend>사이트 내 전체검색</legend>
			<form name="fsearchbox" method="get" action="<%=request.getContextPath()%>/allboardsearch">
				<input type="text" name="stx" id="sch_stx" maxlength="20"
					placeholder="검색어를 입력해주세요">
				<button type="submit" id="sch_submit" value="검색">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>
		</fieldset>

	</div>
	<ul id="hd_qnb">
		<li><a href="<%= request.getContextPath() %>/faqServlet"><i class="fa fa-question" aria-hidden="true"></i><span>FAQ</span></a></li>
		<li><a href=""><i class="fa fa-comments" aria-hidden="true"></i><span>1:1문의</span></a></li>
		<li><a href="<%=request.getContextPath()%>/infoUpdate?id=<%=loginMember.getMemberId()%>"><i class="fa fa-user" aria-hidden="true"></i><span>내정보</span></a></li>
	</ul>
</div>

<nav id="gnb">
	<h2>메인메뉴</h2>
	<div class="gnb_wrap">
		<ul id="gnb_1dul">
			<li class="gnb_1dli gnb_mnal"><button type="button"
					class="gnb_menu_btn">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/noticeBoard" 
			    class="gnb_1da">공지 사항</a></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/anonymousBoard" 
			    class="gnb_1da">익명 게시판</a></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/freeBoard"
				class="gnb_1da">자유 게시판</a></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/gradeBoard"
				class="gnb_1da">반별 게시판</a></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/inquery/inqueryBoard"
				class="gnb_1da">질의 게시판</a></li>
			<li class="gnb_1dli" style="margin-left: 5%"><a href="<%=request.getContextPath() %>/food/foodList"
				class="gnb_1da">맛집 게시판</a></li>

		</ul>
		<div id="gnb_all">
			<h2>전체메뉴</h2>
			<ul class="gnb_al_ul">
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/noticeBoard" class="gnb_al_a">공지사항</a></li>
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/anonymousBoard" class="gnb_al_a">익명게시판</a></li>
				
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/freeBoard" class="gnb_al_a">자유게시판</a>
					<ul>

					</ul></li>
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/gradeBoard" class="gnb_al_a">반별게시판</a>
					<ul>
						<li><a href="" target="_self"><i
								class="fa fa-caret-right" aria-hidden="true"></i>R클래스</a></li>
					
					</ul></li>
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/inquery/inqueryBoard" class="gnb_al_a">코딩게시판</a>
					<ul>
						<li><a href="<%=request.getContextPath() %>/inquery/inqueryBoard" target="_self"><i
								class="fa fa-caret-right" aria-hidden="true"></i>코드 질의 게시판</a></li>
						<li><a href="<%= request.getContextPath() %>/webCopiler/webCopilerView" target="_self"><i
								class="fa fa-caret-right" aria-hidden="true"></i>컴파일러</a></li>
					</ul></li>
				<li class="gnb_al_li"><a href="<%=request.getContextPath() %>/food/foodList" class="gnb_al_a">맛집게시판</a>
					<ul>

					</ul></li>

			</ul>
			<button type="button" class="gnb_close_btn">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
		</div>
	</div>
</nav>
<script>
	$(function() {
		$(".gnb_menu_btn").click(function() {
			$("#gnb_all").show();
		});
		$(".gnb_close_btn").click(function() {
			$("#gnb_all").hide();
		});
	});
</script>

<!-- 상단 끝 -->
