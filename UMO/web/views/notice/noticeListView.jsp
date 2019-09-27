<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.umo.model.vo.NoticeBoard" %>

<%@ include file="/views/common/header.jsp" %>

<%
	String cPage = request.getAttribute("cPage").toString();
	String pageBar = request.getAttribute("pageBar").toString();

	List<NoticeBoard> list = (List<NoticeBoard>)request.getAttribute("list");
%>

<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="공지 게시판">공지 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
						<table>
							<caption>공지 게시판</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">글쓴이</th>
									<th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
								</tr>
							</thead>
							<tbody>
								<% for(NoticeBoard nb : list) { %>
								<tr>
								   <td class="td_num2"><%= nb.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=nb.getNo()%>"><%= nb.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= nb.getWriter() %></td>
								   <td class="td_num"><%= nb.getCount() %></td>
								   <td class="td_datetime"><%= nb.getDate() %></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/noticeWrite"
								class="btn_b02 btn"><i class="fa fa-pencil"
									aria-hidden="true"></i> 글쓰기</a></li>
						</ul>
					</div>

				</form>

				<!-- 게시판 검색 시작 { -->
				<fieldset id="bo_sch">
					<legend>게시물 검색</legend>

					<form name="fsearch" method="get">
						<input type="hidden" name="bo_table" value="gnsetting"> <input
							type="hidden" name="sca" value=""> <input type="hidden"
							name="sop" value="and"> <select name="sfl" id="sfl">
							<option value="wr_subject">제목</option>
							<option value="wr_content">내용</option>
							<option value="wr_subject||wr_content">제목+내용</option>
							<option value="mb_id,1">회원아이디</option>
							<option value="mb_id,0">회원아이디(코)</option>
							<option value="wr_name,1">글쓴이</option>
							<option value="wr_name,0">글쓴이(코)</option>
						</select> <input type="text" name="stx" value="" required id="stx"
							class="sch_input" size="25" maxlength="20"
							placeholder="검색어를 입력해주세요">
						<button type="submit" value="검색" class="sch_btn">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</fieldset>
				<!-- 게시판 검색 끝 -->
				
				<!-- 페이징 -->
				<nav class="pg_wrap">
					<span class="pg">
						<%= pageBar %>
					</span>
				</nav>
			    <!-- 페이징 끝 -->
				
			</div>
		</div>
	</div>
</div>



<!-- } 콘텐츠 끝 -->

<%@ include file="/views/common/footer.jsp"%>