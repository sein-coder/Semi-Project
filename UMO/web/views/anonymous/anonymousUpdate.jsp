<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Board" %>

<% 
     Board nb=(Board)request.getAttribute("nb");
     String content=nb.getContent();
     content=content.replace("<br>", "\r\n");
%>

<%@ include file="/views/common/header.jsp" %>
<style>
	section#notice-container { align: center; margin-top: 10px; }
	table#tbl-notice { margin-left: auto; margin-right: auto; }
</style>
		<section id="notice-container">
			<h2 style="text-align: center;">익명게시판</h2>
			<form action="<%=request.getContextPath()%>/anonymousUpdateEnd?no=<%=nb.getNo() %>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="<%=nb.getNo()%>">
				<table id="tbl-notice"
					class="table table-striped table-bordered table-hover">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="<%=nb.getTitle()%>" required /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer"
							value="<%=loginMember.getMemberId()%>" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><%if(nb.getOriginal_filename()!=null){ %>
					<input type="file" name="up_file"/>
					<input type="hidden" name="ori_file" value="<%=nb.getRenamed_filename()%>"/>
					<%if(nb.getRenamed_filename()==null){ %>
					<span id="fname"><%=nb.getOriginal_filename() %></span>
					<%} else{%>
					<span id="fname"><%=nb.getRenamed_filename() %></span>
					<%} %>
					<%}else{ %>
					<input type="file" name="up_file"/>
					<%} %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="5" cols="50" name="content"><%=content %></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="등록" /></td>
					</tr>
				</table>
			</form>
			<script>
			
			$(function(){
				$('[name=up_file]').change(function(){
					if($(this).val()!=""){
						$("#fname").hide();
					}else{
						$("#fname").show();
					}
				});
			});
			
			</script>
		</section>
<%@ include file="/views/common/footer.jsp" %>