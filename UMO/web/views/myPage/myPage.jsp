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
List<Comment> inqueryCommentlist = (List<Comment>)request.getAttribute("inqueryCommentlist");
List<Comment> gradeCommentlist = (List<Comment>)request.getAttribute("gradeCommentlist");
List<Comment> freeCommentlist = (List<Comment>)request.getAttribute("freeCommentlist");
List<Comment> anonymousCommentlist = (List<Comment>)request.getAttribute("anonymousCommentlist");


Member m=(Member)request.getAttribute("member");
int count = 0;
%> 
<%@ include file="/views/common/header.jsp"%>
<section id="intro" class="main style12">
        <div>
            <div class="content" >
                <button onclick="click1();">전체보기</button>
                <button onclick="click2();">게시글</button>
                <button onclick="click3();">댓글</button>
                <button onclick="click4();">쪽지</button>
                <div style="margin-left:0 auto; ">
                    <p>가입일로부터 <%=attendance %>일 </p>
                    <button onclick="infoUpdate();">정보수정</button>
                </div>
        <br>

        </div>
        <div class="mypagediv" id="mypost">
        	
        	<select id="board" name="board" style="width:5%">
				  <option value="음식" selected="selected">음식</option>
				   <option value="자유">자유</option>
			    	<option value="익명">익명</option>
				  <option value="질의">질의</option>
				  <option value="반별">반별</option>
			</select>
        <div id="wrapper">
	<div id="container_wr">
		<div id="container freeboard" style="display:none">
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
							<li><a href="<%= request.getContextPath() %>/freeBoard"
								class="btn_b02 btn"> 더보기</a></li>
						</ul>
					</div>

				</form>
				
			</div>
		</div>
	</div>
</div>
            <fieldset>
                <legend>내 게시글</legend> <br>
                <table id="foodboard">
                <% if(count<3){
                 for(Food f : foodlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/food/foodView?board_no=<%=f.getBoard_No()%>"> <%=f.getBoard_Title()+" "+f.getBoard_Contents()%></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
	                <table id="inqueryboard" style="display:none">
	                
		               <% if(count<3){ 
		               for(Inquery i : inquerylist) { %>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=i.getBoard_No()%>"><%= i.getCode_Type()+i.getBoard_Title()+i.getBoard_Writer() %></a>
					</td>
				</tr>
			<% count++;} } count=0; %>
               	</table>
               	<table id="freeboard" style="display:none">
                <% if(count<3){
                 for(Board f : freelist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/freeContentView?freeNo=<%=f.getNo()%>"><%=f.getTitle()+f.getWriter() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
                <table id="anonymousboard" style="display:none">
                <% if(count<3){
                	for (Board a : anonymouslist){%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/anonymousContentView?anonymousNo=<%=a.getNo()%>"><%=a.getTitle()%></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
                <table id="gradeboard" style="display:none">
                <% if(count<3){
                	for (Board g : gradelist){%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/gradeContentView?gradeNo=<%=g.getNo()%>"><%=g.getTitle()+g.getWriter() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
            </fieldset>
            <br>
        </div>
        <div class="mypagediv" id="mycomment">
        <select id="comment" name="comment" style="width:5%">
				  <option value="공지" selected="selected">공지</option>
				   <option value="음식">음식</option>
				   <option value="자유">자유</option>
			    	<option value="익명">익명</option>
				  <option value="질의">질의</option>
				  <option value="반별">반별</option>
			</select>
            <fieldset>
                <legend>내 댓글</legend> <br>
                <table id="noticecomment" name="noticecomment">
                   <% if(count<3){
                 for(Comment n : NoticeCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=n.getBoard_no_ref()%>"><%=n.getComment_contents() %></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
                <table id="foodcomment" name="foodcomment" style="display:none">
                   <% if(count<3){
                 for(Comment f : FoodCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/food/foodView?board_no=<%=f.getBoard_no_ref()%>"><%=f.getComment_contents() %></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
                <table id="inquerycomment" name="inquerycomment" style="display:none">
                   <% if(count<3){
                 for(Comment i : inqueryCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=i.getBoard_no_ref()%>"><%=i.getComment_contents() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
	          	<table id="freecomment" name="freecomment" style="display:none">
                   <% if(count<3){
                 for(Comment f : freeCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/freeContentView?freeNo=<%=f.getBoard_no_ref()%>"><%=f.getComment_contents() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
	          	<table id="gradecomment" name="gradecomment" style="display:none">
                   <% if(count<3){
                 for(Comment g : gradeCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/gradeContentView?gradeNo=<%=g.getBoard_no_ref()%>"><%=g.getComment_contents() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
	          	<table id="anonymouscomment" name="anonymouscomment" style="display:none">
                   <% if(count<3){
                 for(Comment a : anonymousCommentlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath()%>/anonymousContentView?anonymousNo=<%=a.getBoard_no_ref()%>"><%=a.getComment_contents() %></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
            </fieldset>
            <br>
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
	        	 $('#foodboard').css({ display: 'flex'});
	        	 $('#inqueryboard').css({ display: 'none'});
	        	 $('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        	 $('#gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='질의'){
	        	$('#inqueryboard').css({ display: 'flex'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        	 $('#gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='자유'){
	        	$('#inqueryboard').css({ display: 'none'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'flex'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        	 $('#gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='익명'){
	        	$('#inqueryboard').css({ display: 'none'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'flex'});
	        	 $('#gradeboard').css({ display: 'none'});
	        }else if($('#board').val()=='반별'){
	        	$('#inqueryboard').css({ display: 'none'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        	 $('#gradeboard').css({ display: 'flex'});
	        }
	        	})
	        })
	        	  $(document).ready(function(){
	        		$('#comment').on('change',function(){
	        if($('#comment').val()=='음식'){
	        	 $('#foodcomment').css({ display: 'flex'});
	        	 $('#inquerycomment').css({ display: 'none'});
	        	 $('#freecomment').css({ display: 'none'});
	        	 $('#anonymouscomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'none'});
	        	 $('#noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='공지'){
	        	$('#noticecomment').css({ display: 'flex'});
	        	$('#inquerycomment').css({ display: 'none'});
	        	$('#foodcomment').css({ display: 'none'});
	        	$('#freecomment').css({ display: 'none'});
	        	 $('#anonymouscomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='질의'){
	        	$('#inquerycomment').css({ display: 'flex'});
	        	$('#foodcomment').css({ display: 'none'});
	        	$('#freecomment').css({ display: 'none'});
	        	 $('#anonymouscomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'none'});
	        	 $('#noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='자유'){
	        	$('#inquerycomment').css({ display: 'none'});
	        	$('#foodcomment').css({ display: 'none'});
	        	$('#freecomment').css({ display: 'flex'});
	        	 $('#anonymouscomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'none'});
	        	 $('#noticecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='익명'){
	        	$('#inquerycomment').css({ display: 'none'});
	        	$('#foodcomment').css({ display: 'none'});
	        	$('#freecomment').css({ display: 'none'});
	        	 $('#anonymouscomment').css({ display: 'flex'});
	        	 $('#noticecomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'none'});
	        }else if($('#comment').val()=='반별'){
	        	$('#inquerycomment').css({ display: 'none'});
	        	$('#foodcomment').css({ display: 'none'});
	        	$('#freecomment').css({ display: 'none'});
	        	 $('#noticecomment').css({ display: 'none'});
	        	 $('#anonymouscomment').css({ display: 'none'});
	        	 $('#gradecomment').css({ display: 'flex'});
	        }
	        	});
	        })
        
            function click1() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#comment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }
            function click2() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#comment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click3() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#comment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click4() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#comment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }
 			
            function infoUpdate() {
            	 location.href="<%=request.getContextPath()%>/infoUpdate?id=<%=m.getMemberId()%>";
            }
        </script>


    </section>

<%@ include file="/views/common/footer.jsp"%>