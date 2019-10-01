<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.NoticeBoard" %>
<%@ page import="com.umo.model.vo.BoardComment,java.util.List" %>

<% 
    NoticeBoard nb=(NoticeBoard)request.getAttribute("nb");
	NoticeBoard prenb=(NoticeBoard)request.getAttribute("prenb");
	NoticeBoard nextnb=(NoticeBoard)request.getAttribute("nextnb");

	List<BoardComment> list=(List)request.getAttribute("comments");
%>

<%@ include file="/views/common/header.jsp"%>


<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
		<h2 id="container_title">
			<span title="공지사항">공지사항</span>
		</h2>

		<!-- 게시물 읽기 시작 { -->

		<article id="bo_v" style="width: 100%; height: auto !important;">
			<header>
				<h2 id="bo_v_title">
					<span class="bo_v_tit"><%=nb.getTitle()%></span>
				</h2>
				<tr>
					<td>
                       	<a href="<%=request.getContextPath() %>/scrap/scrapButtonServlet?board_type=notice&board_no=<%=nb.getNo()%>" target="_blank" id="ol_after_scrap" class="win_scrap">스크랩<br>
                        <strong class="scrap"><i class="fa fa-thumb-tack" aria-hidden="true"></i></strong>
                        </a>
                  	</td>
				</tr>
			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>
				<strong><span
					class="sv_member"><%=nb.getWriter()%></span></strong><strong><a
					href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i>
						<%=list.size() %>건(댓글)</a></strong>
					<strong>
					<i class="fa fa-eye" aria-hidden="true"></i> <%=nb.getCount() %>회(조회수)</strong>
					<strong class="if_date">
					<i class="fa fa-clock-o" aria-hidden="true"></i> <%= nb.getDate() %></strong>

			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>

					<!-- 본문 내용 시작 { -->
					<div id="bo_v_con">
						<%= nb.getContent() %>
					</div>
					<!-- } 본문 내용 끝 -->

			</section>

			<div id="bo_v_share"></div>



			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">

				<ul class="bo_v_left">
				</ul>

				<ul class="bo_v_com">
					<li><a href="<%=request.getContextPath()%>/noticeBoard" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>
							목록</a></li>
					
					
					<li><a href="" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li>
				</ul>

				<ul class="bo_v_nb">
					<li class="btn_prv"><span class="nb_tit"><i
						class="fa fa-caret-up" aria-hidden="true"></i> 이전글</span>
						<% if(prenb!=null&&prenb.getTitle()!=null) { %>
						<a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=prenb.getNo()%>"><%= prenb.getTitle() %></a> 
						<% } else { %>
						<a href="">이전 글이 없습니다.</a> 
						<% } %>
						<span class="nb_date"><%= prenb!=null?prenb.getDate():"" %></span></li>
					<li class="btn_next"><span class="nb_tit"><i
						class="fa fa-caret-down" aria-hidden="true"></i> 다음글</span>
						<% if(nextnb!=null&&nextnb.getTitle()!=null) { %>
						<a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=nextnb.getNo()%>"><%= nextnb.getTitle() %></a> 
						<% } else { %>
						<a href="">다음 글이 없습니다.</a> 
						<% } %>
						<span class="nb_date"><%= nextnb!=null?nextnb.getDate():"" %></span></li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->


			<button type="button" class="cmt_btn">
				<i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록
			</button>
			<!-- 댓글 시작 { -->
			<section id="bo_vc">
				<h2>댓글목록</h2>

				<article>
				<% if(!list.isEmpty()) {
						for(BoardComment bc : list){
						if(bc.getBoardCommentLevel()==1){
					%>
					<header style="z-index: 2">
						<h2><%=bc.getBoardCommentWriter() %>님의 댓글</h2>
						<span class="sv_member"><%=bc.getBoardCommentWriter() %>의 댓글</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00"><%=bc.getBoardCommentDate() %></time></span>
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p><%=bc.getBoardCommentContent() %></p>
						<ul class="bo_vc_act">
							<li><button id="btn-reply" class="btn_b03" value="<%= bc.getBoardCommentNo() %>">답변</button></li>
							<li><a
								href='<%=request.getContextPath()%>/notice/deleteComment?noticeNo=<%=bc.getBoardCommentNo()%>'
								onclick="comment_delete();" class="btn_b03">삭제</a></li>
						</ul>
					</div>
					<!-- 레벨2댓글 구현부 -->
					<% } else { %>
					<header style="z-index: 2">
						<h2><%=bc.getBoardCommentWriter() %>님의 답변</h2>
						<span class="sv_member"><%=bc.getBoardCommentWriter() %>의 답변</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00"><%= bc.getBoardCommentDate() %></time></span>
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p style="text-align: right;"><%=bc.getBoardCommentContent() %></p>
						<ul class="bo_vc_act">
							<!-- <li><button class="btn_b03">답변</button></li> -->
							<li><a
								href='<%=request.getContextPath()%>/notice/deleteComment?noticeNo=<%=bc.getBoardCommentNo()%>'
								onclick="comment_delete();" class="btn_b03">삭제</a></li>
						</ul>
					</div>
					<% 	} 
						} 
					} %>

					<input type="hidden" value="" id="">
					<textarea id="save_comment" style="display: none">123</textarea>
					<!-- 무슨 의도로 만든지 물어보기 -->

				</article>

			</section>
			<!-- } 댓글 끝 -->

			<!-- 댓글 쓰기 시작 { -->
			<aside id="bo_vc_w" class="bo_vc_w">
				<h2>댓글쓰기</h2>
				<form name="fviewcomment" id="fviewcomment"
					action="<%= request.getContextPath() %>/notice/insertComment"
					onsubmit="" method="post"
					autocomplete="off">

					<textarea id="wr_content" name="wr_content" maxlength="10000"
						required class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>

					<div class="bo_vc_w_wr">
						<div class="bo_vc_w_info">
<%-- 							 <input type="text" name="wr_name" value="<%= loginMember!=null?loginMember.getMemberId():"" %>" id="wr_name"
								required class="frm_input required" size="25"
								placeholder="이름">   --%>
<!-- 							 <input
								type="password" name="wr_password" id="wr_password" required
								class="frm_input required" size="25" placeholder="비밀번호"> -->
					
						</div>
						<div class="btn_confirm">
							 <input type="submit"
								id="btn_submit" class="btn_submit" value="댓글등록">
						</div>
					</div>
					<!-- insert용 정보 저장 -->
					<input type="hidden" name="boardRef" value="<%=nb.getNo()%>"/>
					<input type="hidden" name="boardCommentRef" value="0"/>
					<input type="hidden" name="boardCommentLevel" value="1"/>
					<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>
				</form>
			</aside>
          </article>



     </div>

		<!-- } 게시글 읽기 끝 -->
	</div>
	</div>



<!-- } 콘텐츠 끝 -->

<script>
	

	$("[name=content]").focus(function(){
		if(<%=loginMember==null%>){
			fn_loginAlert();
		}
	})

	$("#btn-reply").click(function(){
    		console.log("실행");
			if(<%=loginMember==null%>){
    			fn_loginAlert();
    			return;
    		}
    		var tr=$("<tr>");
    		var html="<td style='display:none;text-align:left;' colpsan='2'>";
    		html+="<form action='<%=request.getContextPath()%>/notice/insertComment' method='post'>";
       		html+='<input type="hidden" name="boardRef" value="<%=nb.getNo()%>"/>';
			html+='<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'"/>';
			html+='<input type="hidden" name="boardCommentLevel" value="2"/>';
			html+='<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>';					
			html+='<textarea name="wr_content" cols="60" rows="3"></textarea>';
			html+='<input type="submit" value="등록">';
			html+='</form></td>';
			tr.html(html);
			tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			$(this).off('click');
    	});
	
    function fn_commentValidate(){
    	if(<%=loginMember==null%>){
    		fn_loginAlert();
    		return false;
    	}
    	var len=$("[name==wr_content]").val().trim().length;
    	if(len<1){
    		alert("내용을 입력하세요!");
    		return false;
    	}
    	return true;
    }
	
	function fn_loginAlert(){
    	alert("로그인 후 이용하세요!");
    	$("[name=wr_content]").blur();
    }
	
</script>

<%@ include file="/views/common/footer.jsp"%>