<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.NoticeBoard" %>

<% 
     NoticeBoard nb=(NoticeBoard)request.getAttribute("nb");
     String content=nb.getContent();
     content=content.replace("<br>", "\r\n");
%>

<%@ include file="/views/common/header.jsp" %>
    <div class="row body" style="margin-top: 150px">
        <div class="col-lg-2"></div>
	<div class="col-lg-8">
		<section id="notice-container">
			<h2 style="text-align: center;">공지사항</h2>
			<form action="<%=request.getContextPath()%>/noticeUpdateEnd
				method="post" enctype="multipart/form-data">
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
						<td><input type="file" name="up_file" value="<%=nb.getOriginal_filename()%>" /></td>
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
		</section>
	</div>
	<div class="col-lg-2"></div>
    </div>
<%@ include file="/views/common/footer.jsp" %>