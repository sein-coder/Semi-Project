<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.umo.model.vo.NoticeBoard" %>

<%@ include file="/views/common/header.jsp" %>

<%

	String cPage = request.getAttribute("cPage").toString();
	String pageBar = request.getAttribute("pageBar").toString();
	String numPerPage = request.getAttribute("numPerPage").toString();
	String orderType = request.getAttribute("orderType").toString();
	String orderDate = "date_desc";
	String orderCount = "count_desc";
	
	switch (orderType) {
	case "count_asc":
		orderCount = "count_desc";
		break;
	case "count_desc":
		orderCount = "count_asc";
		break;
	case "date_asc":
		orderDate = "date_desc";
		break;
	case "date_desc":
		orderDate = "date_asc";
		break;
	default:
		orderDate = "date_desc";
		orderCount = "count_desc";
		break;
	}
	
	
	
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
					<div id="numPerPage-container">
						페이지 회원수 :
						<select name="numPerPage" id="numPerPage">
							<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
							<option value="5" <%=numPerPage.equals("5")?"selected":"" %>>5</option>
							<option value="3" <%=numPerPage.equals("3")?"selected":"" %>>3</option>
						</select>	
					</div>
						<table>
							<caption>공지 게시판</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">글쓴이</th>
									<th width="10%"><a href="<%= request.getContextPath() %>/noticeBoard?cPage=<%= cPage %>
									&numPerPage=<%= numPerPage %>&orderType=<%= orderCount %>">
									조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="<%= request.getContextPath() %>/noticeBoard?cPage=<%= cPage %>
									&numPerPage=<%= numPerPage %>&orderType=<%= orderDate %>">
									날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
								</tr>
							</thead>
							<tbody>
								<% for(NoticeBoard nb : list) { %>
								<tr>
								   <td class="td_num2"><%= nb.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=nb.getNo()%>&cPage=<%= cPage %>
									&numPerPage=<%= numPerPage %>&orderType=<%= orderType %>"><%= nb.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= nb.getWriter() %></td>
								   <td class="td_num">
								   	<a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=nb.getNo()%>&cPage=<%= cPage %>
									&numPerPage=<%= numPerPage %>&orderType=<%= orderType %>"><%=nb.getCount() %></a></td>
								   <td class="td_datetime"><%= nb.getDate() %></td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
						<%if(loginMember!=null&&loginMember.getMemberId().equals("admin")){ %>
							<li><a href="<%= request.getContextPath() %>/noticeWrite"
								class="btn_b02 btn"><i class="fa fa-pencil"
									aria-hidden="true"></i> 글쓰기</a></li>
									<%} %>
						</ul>
					</div>

				</form>

					
				
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
<script>
		$("#numPerPage").on("change",function(){
			location.href='<%= request.getContextPath() %>/noticeBoard?numPerPage='+$("#numPerPage").val()+'&cPage=1';
		});
</script>



<!-- } 콘텐츠 끝 -->

<%@ include file="/views/common/footer.jsp"%>