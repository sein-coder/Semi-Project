<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 상단 시작-->    
<%@ include file="/views/common/header.jsp"%>
<!-- 상단 끝 -->
<%@ page import="java.util.List,com.umo.model.vo.Scrap" %>
<%
	List<Scrap> list = (List<Scrap>)request.getAttribute("list");
	String cPage = request.getAttribute("cPage").toString();
	String pageBar = request.getAttribute("pageBar").toString();
	String numPerPage = request.getAttribute("numPerPage").toString();
%>
<!-- 컨텐츠  -->
            			<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="FAQ 게시판">자주 하는 질문</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">
					<div class="tbl_head01 tbl_wrap">

						<table>
							<caption>자주 하는 질문</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: ceter;">종류</th>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">글쓴이</th>
									<th width="10%">날짜</th>
								</tr>
							</thead>
							<tbody>
							
							<% for(Scrap sc : list) { %>
								<tr>
								   <td class="td_num2"><%= sc.getBoard_type() %></td>
								   <td class="td_num2"><%= sc.getBoard_no() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                     	<% if(sc.getBoard_type().equals("food")){ %>
                                     	<a href="<%= request.getContextPath() %>/<%= sc.getBoard_type()%>/<%= sc.getBoard_type()%>View?Board_No=<%= sc.getBoard_no() %>&board_type=scrap">
                                        <%= sc.getBoard_title() %></a>
                                     	<% } else if(sc.getBoard_type().equals("inquery")) { %>
                                     	<a href="<%= request.getContextPath() %>/<%= sc.getBoard_type()%>/<%= sc.getBoard_type()%>View?board_no=<%= sc.getBoard_no() %>&board_type=scrap">
                                     	<%= sc.getBoard_title() %></a>
                                     	<% } else { %>
                                        <a href="<%= request.getContextPath() %>/<%= sc.getBoard_type()%>ContentView?<%= sc.getBoard_type()%>No=<%= sc.getBoard_no() %>&board_type=scrap">
                                        <%= sc.getBoard_title() %></a>
                                        <% } %>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= sc.getBoard_writer() %></td>
								   <td class="td_datetime"><%= sc.getBoard_date() %></td>
								</tr>
								<% } %>
					
							</tbody>
						</table>
					</div>
			</div>
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
<!-- 콘텐츠 끝 -->

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->
