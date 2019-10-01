<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.*" %>
<%
int attendance=(Integer)(request.getAttribute("attendance"));
List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
List<Board> anonymouslist = (List<Board>)request.getAttribute("anonymousBoardList");
List<Inquery> inquerylist = (List<Inquery>)request.getAttribute("inquerylist"); 
List<Board> freelist=(List)(request.getAttribute("freelist"));
List<Board> gradelist=(List)(request.getAttribute("gradelist"));
List<Comment> NoticeCommentlist = (List<Comment>)request.getAttribute("NoticeCommentlist");
List<Comment> FoodCommentlist = (List<Comment>)request.getAttribute("FoodCommentlist");
List<Comment> freeCommentlist = (List<Comment>)request.getAttribute("freeCommentlist");
List<Comment> inqueryCommentlist = (List<Comment>)request.getAttribute("inqueryCommentlist");
List<Comment> gradeCommentlist = (List<Comment>)request.getAttribute("gradeCommentlist");
List<Comment> anonymousCommentlist = (List<Comment>)request.getAttribute("anonymousCommentlist");


Member m=(Member)request.getAttribute("member");
int count = 0;
%> 
<%@ include file="/views/common/header.jsp"%>
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
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
<section id="intro" class="main style12">
<br>
<div class="bo_fx" style="margin-right:1%;">
	<ul class="btn_bo_user">
		<li><button class="btn_b02 btn" onclick="infoUpdate();">정보수정</button></li>
		<li><button class="btn_b02 btn" onclick="">관리자</button></li>
	</ul>
</div>
            <div class="content" >
                <button class="btn_b02 btn" onclick="click1();">전체보기</button>
                <button class="btn_b02 btn" onclick="click2();">게시글</button>
                <button class="btn_b02 btn" onclick="click3();">댓글</button>
                <button class="btn_b02 btn" onclick="click4();">쪽지</button>
                <div style="margin-left:0 auto; ">
                <br>
                    <p>가입일로부터 <%=attendance %>일 지났습니다.</p>
                    <button onclick="infoUpdate();">정보수정</button>
                    <%if(loginMember.getMemberId().equals("admin")){ %>
                    <button onclick="memberManage();">멤버관리</button>
                    <%} %>
                </div>
        		<br>

        <div class="mypagediv" id="mypost" style="border-top: 2px solid rgb(67, 106, 233);border-bottom:2px solid rgb(67, 106, 233); height: 400px ">
        	<br>
        	<select id="board" name="board" style="width:8%">
				  <option value="음식" selected="selected">음식</option>
				   <option value="자유">자유</option>
			    	<option value="익명">익명</option>
				  <option value="질의">질의</option>
				  <option value="반별">반별</option>
			</select>
			<div id="wrapper" class="foodboard" >
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
						<li><a href="<%= request.getContextPath() %>/food/foodList?bo_table=gnsetting&sca=&sop=and&sfl=board_writer&stx=<%=m.getMemberId() %>"
							class="btn_b02 btn">더보기</a></li>
					</ul>
				</div>
	
			</div>
		</div>
	</div>
</div>   
        <div id="wrapper"class="freeboard" style="display:none;">
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
							if(count<5) {%>
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
							<li><a href="<%= request.getContextPath() %>/freeBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_writer&stx=<%=m.getMemberId() %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
            <div id="wrapper"class="anonymousboard" style="display:none;">
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
							<li><a href="<%= request.getContextPath() %>/anonymousBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_writer&stx=<%=m.getMemberId() %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="gradeboard" style="display:none;">
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
							<li><a href="<%= request.getContextPath() %>/gradeBoard?bo_table=gnsetting&sca=&sop=and&sfl=board_writer&stx=<%=m.getMemberId() %>"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper" class="inqueryboard" style="display:none;">
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
									<th width="50%">댓글</th>
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
							<li><a href="<%= request.getContextPath() %>/"
								class="btn_b02 btn">더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
</div>
        <div class="mypagediv" id="mycomment" style="height: 400p;">
        <br>
        <select id="comment" name="comment" style="width:8%">
				  <option value="공지" selected="selected">공지</option>
				   <option value="음식">음식</option>
				   <option value="자유">자유</option>
			    	<option value="익명">익명</option>
				  <option value="질의">질의</option>
				  <option value="반별">반별</option>
			</select>
			<div id="wrapper"class="noticecomment">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="공지 댓글">공지 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>공지 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">댓글</th>
									<th width="10%">글쓴이</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : NoticeCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%= b.getBoard_no_ref() %>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/noticeBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="foodcomment"style="display:none;">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="음식 댓글">음식 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>음식 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">댓글</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : FoodCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/food/foodView?board_no=<%=b.getBoard_no_ref()%>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/food/foodList"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="freecomment"style="display:none;">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="자유 댓글">자유 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>자유 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">댓글</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : freeCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/freeContentView?freeNo=<%=b.getBoard_no_ref()%>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/freeBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="anonymouscomment"style="display:none;">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="익명 댓글">익명 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>익명 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">댓글</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : anonymousCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/anonymousContentView?anonymousNo=<%=b.getBoard_no_ref()%>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/anonymousBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="inquerycomment"style="display:none;">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="질의 댓글">질의 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>질의 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">댓글</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : inqueryCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=b.getBoard_no_ref()%>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/inquery/inqueryBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
<div id="wrapper"class="gradecomment"style="display:none;">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="반별 댓글">반별 댓글</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">
					
						<table>
							<caption>자유 댓글</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="60%">제목</th>
									<th width="10%">댓글</th>
									<!-- <th width="10%"><a href="">조회 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th>
									<th width="10%"><a href="">날짜 <i class="fa fa-sort"
											aria-hidden="true"></i></a></th> -->
								</tr>
							</thead>
							<tbody>
								<% for(Comment b : gradeCommentlist) { %>
							<%
							if(count<3) {%>
								<tr>
								   <td class="td_num2"><%= b.getBoard_no_ref() %></td>
								   <td class="td_subject" style="padding-left:0px">
                                     <div class="bo_tit">
                                        <a href="<%=request.getContextPath()%>/gradeContentView?gradeNo=<%=b.getBoard_no_ref()%>"><%= b.getComment_contents() %></a>
                                     </div>
                                   </td>
								   <td class="td_name sv_use" style="text-align: center;"><%= b.getComment_writer() %></td>
								 <%--   <td class="td_num"><%= b.getCount() %></td>
								   <td class="td_datetime"><%= b.getDate() %></td> --%>
								</tr>
								<%count++; } 
							}count=0;%>
							</tbody>
						</table>
					</div>

					<div class="bo_fx">
						<ul class="btn_bo_user">
							<li><a href="<%= request.getContextPath() %>/gradeBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
</div>
        </div>
        <div class="mypagediv" id="note">
            <fieldset>
                <legend>내 쪽지</legend> <br>
                <table>
                <tr>
                	<td></td>
                </tr>
                
                </table>
                
            </fieldset>
        </div>

        <script>
	        $(document).ready(function(){
	        	$('#board').on('change',function(){
	        if($('#board').val()=='음식'){
	        	 $('.foodboard').css({ display: 'flex'});
	        	 $('.inqueryboard').css({ display: 'none'});
	        	 $('.freeboard').css({ display: 'none'});
	        	 $('.anonymousboard').css({ display: 'none'});
	        	 $('.gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='질의'){
	        	$('.inqueryboard').css({ display: 'flex'});
	        	$('.foodboard').css({ display: 'none'});
	        	$('.freeboard').css({ display: 'none'});	
	        	 $('.anonymousboard').css({ display: 'none'});
	        	 $('.gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='자유'){
	        	$('.inqueryboard').css({ display: 'none'});
	        	$('.foodboard').css({ display: 'none'});
	        	$('.freeboard').css({ display: 'flex'});
	        	 $('.anonymousboard').css({ display: 'none'});
	        	 $('.gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='익명'){
	        	$('.inqueryboard').css({ display: 'none'});
	        	$('.foodboard').css({ display: 'none'});
	        	$('.freeboard').css({ display: 'none'});
	        	 $('.anonymousboard').css({ display: 'flex'});
	        	 $('.gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='반별'){
	        	$('.inqueryboard').css({ display: 'none'});
	        	$('.foodboard').css({ display: 'none'});
	        	$('.freeboard').css({ display: 'none'});
	        	 $('.anonymousboard').css({ display: 'none'});
	        	 $('.gradeboard').css({ display: 'flex'});
	        }
	        	})
	        })
	        	  $(document).ready(function(){
	        		$('#comment').on('change',function(){
	        if($('#comment').val()=='음식'){
	        	 $('.foodcomment').css({ display: 'flex'});
	        	 $('.inquerycomment').css({ display: 'none'});
	        	 $('.freecomment').css({ display: 'none'});
	        	 $('.anonymouscomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'none'});
	        	 $('.noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='공지'){
	        	$('.noticecomment').css({ display: 'flex'});
	        	$('.inquerycomment').css({ display: 'none'});
	        	$('.foodcomment').css({ display: 'none'});
	        	$('.freecomment').css({ display: 'none'});
	        	 $('.anonymouscomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='질의'){
	        	$('.inquerycomment').css({ display: 'flex'});
	        	$('.foodcomment').css({ display: 'none'});
	        	$('.freecomment').css({ display: 'none'});
	        	 $('.anonymouscomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'none'});
	        	 $('.noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='자유'){
	        	$('.inquerycomment').css({ display: 'none'});
	        	$('.foodcomment').css({ display: 'none'});
	        	$('.freecomment').css({ display: 'flex'});
	        	 $('.anonymouscomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'none'});
	        	 $('.noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='익명'){
	        	$('.inquerycomment').css({ display: 'none'});
	        	$('.foodcomment').css({ display: 'none'});
	        	$('.freecomment').css({ display: 'none'});
	        	 $('.anonymouscomment').css({ display: 'flex'});
	        	 $('.noticecomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='반별'){
	        	$('.inquerycomment').css({ display: 'none'});
	        	$('.foodcomment').css({ display: 'none'});
	        	$('.freecomment').css({ display: 'none'});
	        	 $('.noticecomment').css({ display: 'none'});
	        	 $('.anonymouscomment').css({ display: 'none'});
	        	 $('.gradecomment').css({ display: 'flex'});
	        }
	        	});
	        })
        
            function click1() {
                $('#mypost').css({ display: 'grid'});
                $('#mycomment').css({ display: 'grid' });
                $('#note').css({ display: 'grid'});
            }
            function click2() {
                $('#mypost').css({ display: 'grid' });
                $('#mycomment').css({ display: 'none' });
                $('#note').css({ display: 'none' });
            }
            function click3() {
                $('#mypost').css({ display: 'none' });
                $('#mycomment').css({ display: 'grid' });
                $('#note').css({ display: 'none' });
            }
            function click4() {
                $('#mypost').css({ display: 'none'});
                $('#mycomment').css({ display: 'none'});
                $('#note').css({ display: 'grid' });
            }
 			
            function infoUpdate() {
            	 location.href="<%=request.getContextPath()%>/infoUpdate?id=<%=loginMember.getMemberId()%>";
            	 
            }
            
            function memberManage()
            {
            	location.href="<%=request.getContextPath() %>/membermanage";
            }  
        </script>


    </section>
 </div>
 </div>
 </div>

<%@ include file="/views/common/footer.jsp"%>