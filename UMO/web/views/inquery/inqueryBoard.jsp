<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.umo.model.vo.Inquery,java.util.List"%>

<%
	List<Inquery> list = (List<Inquery>)request.getAttribute("list"); 
%>

<style>
	section#inquery-container{width:700px; margin:0 auto; text-align:center; margin-top: 150px; margin-bottom: 50px; }
    section#inquery-container h2{margin:10px 0;}
    table#tbl-inquery{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-inquery th, table#tbl-inquery td {border:1px solid; padding: 5px 0; text-align:center;} 
	div#pageBar { margin-top: 10px; }
</style>

<%@ include file = "/views/common/header.jsp" %>
	
	<section id="inquery-container">
		<h2>코드 질의 게시판</h2>
		<table id="tbl-inquery">
			<tr>
				<th style="width: 60px;">
					글번호
				</th>
				<th style="width: 90px;">
					코드 타입
				</th>
				<th style="width: 400px;">
					글제목
				</th>
				<th style="width: 100px;">
					작성자
				</th>
				<th style="width: 100px;">
					작성일
				</th>
			</tr>
			<% for(Inquery i : list) { %>
				<tr>
					<td>
						<%= i.getBoard_No() %>
					</td>
					<td>
						<%= i.getCode_Type() %>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=i.getBoard_No()%>"><%= i.getBoard_Title() %></a>
					</td>
					<td>
						<%= i.getBoard_Writer() %>
					</td>
					<td>
						<%= i.getBoard_Date() %>
					</td>
				</tr>
			<% } %>
		</table>
		<div id="pageBar">
        	<%=request.getAttribute("pageBar") %>
        </div>
	</section>

<%@ include file = "/views/common/footer.jsp" %>
