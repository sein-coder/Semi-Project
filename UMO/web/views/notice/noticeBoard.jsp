<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.NoticeBoard" %>
<%
  List<NoticeBoard> list=(List)(request.getAttribute("list"));
%>

<%@ include file="/views/common/header.jsp" %>
<style>
section#notice-container {
	width: 600px;
	height: 500px;
	margin: 0 auto;
	text-align: center;
	margin-top: 150px;
}

section#notice-container th {
	text-align: center;
}
section#notice-container h2{margin:10px 0;}
div#btn-add{float:right; margin: 0 0 15px;}
</style>
<section id="notice-container">
	<h2>공지사항</h2>
	
	<div class="btn-group btn-group-sm"  id="btn-add">
		<input type="button" class="btn btn-default" value="글쓰기"
			onclick="location.href='<%=request.getContextPath()%>/noticeWrite'"/>
	</div>
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>첨부파일</th>
				<th>작성일</th>
			</tr>
		</thead>

		<%
			for (NoticeBoard n : list) {
		%>
		<tbody>
			<tr>
				<td><%=n.getNo()%></td>
				<td><a
					href="<%=request.getContextPath()%>/noticeContentView?noticeNo=<%=n.getNo()%>"><%=n.getTitle()%></a></td>
				<td><%=n.getWriter()%></td>
				<td>
					<%
					if (n.getRenamed_filename() != null) {
				%> <img src="<%=request.getContextPath()%>/images/file/png"
					width="16px" /> <%
					}
				%>
				</td>
				<td><%=n.getDate()%></td>
			</tr>
		</tbody>
		<%
			}
		%>
	</table>
	<nav>
		<ul class="pagination">
			<%=request.getAttribute("pageBar")%>
		</ul>
	</nav>
</section>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="/views/common/footer.jsp" %>