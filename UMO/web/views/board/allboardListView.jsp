<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.umo.model.vo.Board,com.umo.model.vo.NoticeBoard,com.umo.model.vo.Inquery,com.umo.model.vo.Food" %>

<%@ include file="/views/common/header.jsp" %>

<%
	/* String titlename = request.getAttribute("titlename").toString();
	String board_type = request.getAttribute("board_type").toString();
	String cPage = request.getAttribute("cPage").toString();
	String pageBar = request.getAttribute("pageBar").toString();
	String numPerPage = request.getAttribute("numPerPage").toString();
 
	 List<Board> list = (List<Board>)request.getAttribute("list"); */
	String stx = request.getAttribute("stx").toString();
	List<NoticeBoard> noticelist = (List<NoticeBoard>)request.getAttribute("noticelist");
	List<Board> freelist = (List<Board>)request.getAttribute("freelist");
	List<Board> anonymouslist = (List<Board>)request.getAttribute("anonymouslist");
	List<Board> gradelist = (List<Board>)request.getAttribute("gradelist"); 
	List<Inquery> inquerylist = (List<Inquery>)request.getAttribute("inquerylist");
	List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
	
	int count=0;
	
%>
<style>
	section#food-container{ margin-bottom:20px; padding: 0% 0 5% 0;}
	table#big-tbl{ margin-left: auto; margin-right: auto; border-spacing: 50px 20px; }
	table#sml-tbl{ border: 1px solid red;}
	img.foodimg{ width: 300px; height: 200px; }
	p.viewCount{ text-align: right; margin-top: -2px; }
	span.foodTag{ font-style:italic; }
	button#btn-add{margin-left:85%; margin-top: 20px;}
	button#btn-all{margin-left:85%; margin-top: 20px;}
</style>
<style>
	* { margin: 0; padding: 0; list-style: none; }
    ul { padding: 16px 0; }
    ul li { display: inline-block; margin: 0 1px; font-size: 14px; letter-spacing: -.5px; }
    /* form { padding-top: 16px; } */
    ul li.tag-item { padding: 4px 8px; background-color: #777; color: #000; }
    .tag-item:hover { background-color: #262626; color: #fff; }
    ul li.tag-item a:link { color:black; text-decoration: none;}
	ul li.tag-item a:visited { color: black; text-decoration: none;}
	ul li.tag-item a:hover { text-decoration: none;}
</style>
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
								<% for(NoticeBoard b : noticelist) { %>
							<% 
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=b.getNo()%>"><%= b.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getWriter() %></td>
								   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>noticeBoard?bo_table=gnsetting&sca=&sop=and&sfl=notice_title%7C%7Cnotice_contents&stx=<%=stx %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="자유 게시판">자유 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>자유 게시판</caption>
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
								<% for(Board b : freelist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/freeContentView?freeNo=<%=b.getNo()%>"><%= b.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getWriter() %></td>
								   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/freeBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_title&stx=<%=stx %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="익명 게시판">익명 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>익명 게시판</caption>
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
								<% for(Board b : anonymouslist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/anonymousContentView?anonymousNo=<%=b.getNo()%>"><%= b.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;">익명</td>
								   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/anonymousBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_title&stx=<%=stx %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="반별 게시판">반별 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>반별 게시판</caption>
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
								<% for(Board b : gradelist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getNo() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/gradeContentView?gradeNo=<%=b.getNo()%>"><%= b.getTitle() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getWriter() %></td>
								   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/gradeBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_title&stx=<%=stx %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
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
								<% for(Inquery inquery : inquerylist) { %>
								<%if(count<3) {%>
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
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/inqueryBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_title&stx=<%=stx %>"
								class="btn_b02 btn">더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="맛집 게시판">맛집 게시판</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">	
				<table id ="big-tbl">
				<% for(Food f : foodlist) {%>
				<%if(count<8){ %>
					<% if(count==0 || count==4)  {%><tr> <% }%>
						<td>
						<table id="sml-tbl">
							<tr>
								<td colspan="2">
								<a href='<%=request.getContextPath()%>/food/foodView?board_no=<%=f.getBoard_No()%>'>
									<img class="foodimg" alt="img" src="<%=request.getContextPath() %>/upload/food/thumnail/<%= f.getBoard_Thumbnail() %>" >
								</a>
								
								</td>
							</tr>
							<tr>
								<td colspan="2"><%= f.getBoard_Title() %></td>		
							</tr>
							<tr>
								<td><%= f.getBoard_tel()%></td>
							</tr>
							<tr>
								<td><%= f.getBoard_MAP()%></td>
							</tr>
							
						</table>  
						
							<div class="content">							
						        <ul id="tag-list">
						        	<% 
						        	if(f.getBoard_tag()!=null) {
						        		for(String str : f.getBoard_tag().split(",")) { %>
						        		<li class="tag-item"><a href='<%=request.getContextPath()%>/food/foodTagSearch?tag=<%=str%>'>#<%= str %></a></li>
						        	<% } 
						        	} else { %>
						        	<% } %>
						        </ul>
						    </div>
				
							<p class="viewCount">조회:<%=f.getBoard_Count() %></p>
						</td>
					<% count ++; %>
					<% if(count==4 || count==8) {%> </tr> <% } %>
				<% } } %>
				</table>
				<div class="bo_fx">
					<ul class="btn_bo_user">
						<li><a href="<%= request.getContextPath() %>/food/foodList?bo_table=gnsetting&sca=&sop=and&sfl=board_title&stx=<%=stx %>"
							class="btn_b02 btn">더보기</a></li>
					</ul>
				</div>
	
			</div>
		</div>
	</div>
</div>    
<!-- } 콘텐츠 끝 -->

<%@ include file="/views/common/footer.jsp"%>