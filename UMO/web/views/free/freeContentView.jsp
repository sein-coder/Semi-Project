<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Board" %>
<%@ page import="com.umo.model.vo.BoardComment,java.util.List" %>

<% 
    Board fb=(Board)request.getAttribute("fb");
	List<BoardComment> list=(List)request.getAttribute("comments");
%>


<style>
    section#notice-container h2{text-align: center; margin-top: 10px;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style> 
<style>
	table#tbl-comment{text-align:center; width:580px; margin:0 auto; border-collapse:collapse; clear:both;} 
	table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:100%;}
	table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
	table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
	table#tbl-comment button.btn-reply{display:none;}
	table#tbl-comment tr:hover {background:lightgray;}
	table#tbl-comment tr:hover button.btn-reply{display:inline;}
	table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
	table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
	table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
	table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
	table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
	table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
</style>

<%@ include file="/views/common/header.jsp" %>

   <section id="notice-container">
   <div>
   <h2>자유게시판</h2>
        <table id="tbl-notice" class="table table-striped table-bordered table-hover">
        <tr>
            <th>제 목</th>
            <td><%=fb.getTitle()%></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=fb.getWriter()%></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           <%if(fb.getRenamed_filename()!=null) {%>
                         <a href="<%=request.getContextPath()%>/free/fileDown?fileName=<%=fb.getRenamed_filename() %>">
						<img src="<%=request.getContextPath()%>/images/file.png"
						width="16px"/></a>
					<%}else if(fb.getOriginal_filename()!=null){ %>
					<a href="<%=request.getContextPath()%>/free/fileDown?fileName=<%=fb.getOriginal_filename() %>">
						<img src="<%=request.getContextPath()%>/images/file.png"
						width="16px"/></a>
					<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=fb.getContent()%></td>
        </tr>
        <%if(loginMember!=null){ %>
        <tr>
            <th colspan="2">
                <input type="button" class="btn btn-default" value="수정하기" onclick="location.href='<%=request.getContextPath()%>/freeUpdate?freeNo=<%=fb.getNo()%>'"/>
                <input type="button" class="btn btn-default" value="삭제하기" onclick="location.href='<%=request.getContextPath()%>/freeDelete?freeNo=<%=fb.getNo() %>'"/>
	        	<input type="button" class="btn btn-list" value="목록" onclick="location.href='<%=request.getContextPath()%>/freeBoard?notice?cPage=1 %>'"/>
            </th>
        </tr>
        <%} %>
       
    </table>
    <div id="comment-container" style="text-align: center;">
			<div class="comment-editor">
				<form action="<%=request.getContextPath()%>/free/insertComment"
				method="post" onsubmit="return fn_commentValidate();">
					 <input type="hidden" name="boardRef" value="<%=fb.getNo()%>"/>
					 <input type="hidden" name="boardCommentRef" value="0"/>
					 <input type="hidden" name="boardCommentLevel" value="1"/>
					 <input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>
					<textarea name="content" cols="60" rows="3"></textarea>
					<input type="submit" value="등록">
				</form>
			</div>
		</div>
		<table id="tbl-comment">
		<%if(!list.isEmpty()) {
			for(BoardComment bc : list){
			if(bc.getBoardCommentLevel()==1){
		%>
			<tr class='level1'>
				<td>
					<sub class="comment-writer"><%=bc.getBoardCommentWriter() %></sub>
					<sub class="comment-date"><%=bc.getBoardCommentDate() %></sub>
					<br/>
					<%=bc.getBoardCommentContent() %>
				</td>
				<td>
					<button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button>
					<button class="btn-delete" value="<%=bc.getBoardCommentNo()%>" onclick="location.href='<%=request.getContextPath()%>/free/deleteComment?freeNo=<%=bc.getBoardCommentNo()%>'">삭제</button>
					
				</td>
			</tr>
			<%}else{
				%>
				<tr class='level2'>
				<td>
					<sub><%=bc.getBoardCommentWriter() %></sub>
					<sub><%=bc.getBoardCommentDate() %></sub>
					<br/>
					<%=bc.getBoardCommentContent() %>
				</td>
				<td>
					<%-- <button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button> --%>
				</td>
			</tr>
		<% }
		  }
		} %>
		
		</table>
	</div>
    </section>
    <script>
    $(function(){
    	$("[name=content]").focus(function(){
    		if(<%=loginMember==null%>){
    			fn_loginAlert();
    		}
    	})
    	
    	$(".btn-reply").click(function(){
    		if(<%=loginMember==null%>){
    			fn_loginAlert();
    			return;
    		}
    		var tr=$("<tr>");
    		var html="<td style='display:none;text-align:left;' colpsan='2'>";
    		html+="<form action='<%=request.getContextPath()%>/free/insertComment' method='post'>";
       		html+='<input type="hidden" name="boardRef" value="<%=fb.getNo()%>"/>';
			html+='<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'"/>';
			html+='<input type="hidden" name="boardCommentLevel" value="2"/>';
			html+='<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>';					
			html+='<textarea name="content" cols="60" rows="3"></textarea>';
			html+='<input type="submit" value="등록">';
			html+='</form></td>';
			tr.html(html);
			tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			$(this).off('click');
    	});
    });
    
    function fn_commentValidate(){
    	if(<%=loginMember==null%>){
    		fn_loginAlert();
    		return false;
    	}
    	var len=$("[name==comment]").val().trim().length;
    	if(len<1){
    		alert("내용을 입력하세요!");
    		return false;
    	}
    	return true;
    }
    
    
    function fn_loginAlert(){
    	alert("로그인 후 이용하세요!");
    	$("[name=content]").blur();
    }
</script>
    
<%@ include file="/views/common/footer.jsp" %>