<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.umo.model.vo.Inquery,java.util.List"%>

<%
	List<Inquery> list = (List<Inquery>)request.getAttribute("list");
	String pageBar = request.getAttribute("pageBar").toString();
%>

<%@ include file = "/views/common/header.jsp" %>
	
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="질의 게시판">질의 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
						<table>
							<caption>질의 게시판</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="10%" style="text-align: left;">코드 타입</th>
									<th width="50%">제목</th>
									<th width="10%">글쓴이</th>
									<th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
								</tr>
							</thead>
							<tbody>
								<% for(Inquery inquery : list) { %>
								<tr>
								   <td class="td_num2"><%= inquery.getBoard_No() %></td>
								   <td class="td_num2"><%= inquery.getCode_Type() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%= inquery.getBoard_No() %>"><%= inquery.getBoard_Title() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= inquery.getBoard_Writer() %></td>
								   <td class="td_num"><%= inquery.getBoard_Count() %></td>
								   <td class="td_datetime"><%= inquery.getBoard_Date() %></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/inquery/inqueryWrite"
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

<%@ include file = "/views/common/footer.jsp" %>
