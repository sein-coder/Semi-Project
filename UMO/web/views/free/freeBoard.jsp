<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, com.umo.model.vo.Board" %>
<%
  List<Board> list=(List)(request.getAttribute("list"));
%>
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container" style="margin-top:6.3%;padding:5% 0 5% 0;width:60%;">
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
			for (Board b : list) {
		%>
		<tbody>
		<tr>
			<td><%=b.getNo()%></td>
			<td><a
				href="<%=request.getContextPath()%>/freeContentViewfreeeNo=<%=b.getNo()%>"><%=b.getTitle()%></a></td>
			<td><%=b.getWriter()%></td>
			<td>
				<%
					if (b.getRenamed_filename() != null) {
				%> <img
				src="<%=request.getContextPath()%>/images/file/png" width="16px" />
				<%
					}
				%>
			</td>
			<td><%=b.getDate()%></td>
		</tr>
		</tbody>
		<%
			}
		%>
	</table>
	<div id="pageBar"><%=request.getAttribute("pageBar")%></div>
</section>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="/views/common/footer.jsp" %>