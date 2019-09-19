<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="java.util.List,com.umo.model.vo.Food"%>
<%
		List<Food> list = (List<Food>)request.getAttribute("list");
		int count = 0;
%>

<style>
section#food-container{ margin-top:9%; width:100%; margin-bottom:20px; }
h2{ color:gold }
table#big-tbl{ margin-left: auto; margin-right: auto; border-spacing: 50px 20px; }
table#sml-tbl{ border: 1px solid red;}
img.foodimg{ width: 300px; height: 200px; }
p.viewCount{ text-align: right; margin-top: -2px; }
span.foodTag{ font-style:italic; }
button#btn-add{margin-left:85%;}
</style>
	<section id="food-container">
	<!-- <MARQUEE behavior=alternate><h2 style="width:100; height:50;">FOOD ZONE</h2></MARQUEE> -->
	<button id="btn-add">신청서</button>
	


<%-- 	<% if(loginMember != null) { %> --%>
	<%-- <% } %> --%>
	
	<table id ="big-tbl">
	<% for(Food f : list) {%>
		<% if(count==0 || count==4)  {%><tr> <% }%>
			<td>
			<table id="sml-tbl">
			
				<tr>
					<td><img class="foodimg" alt="img" src="<%=request.getContextPath() %>/images/food/<%= f.getBoard_Thumbnail()%>"></td>
				</tr>
				<tr>
					<td><%= f.getBoard_Title() %></td>		
				</tr>
				<tr>
					<td><%= f.getBoard_Grade() %></td>
				</tr>
				<tr>
					<td><%= f.getBoard_No()%></td><!-- 각 게시판 번호 -->
				</tr>
				
			</table> 
			<span class="foodTag">#육회비빕밥 #역삼역 맛집 #회</span>
			<p class="viewCount">조회:<%=f.getBoard_Count() %></p>
			</td>
		<% count ++; %>
		<% if(count==4 || count==8) {%> </tr> <% } %>
	<% } %>
	</table>
	
	<!--pageBar도 있어야함-->
		<div id="pageBar" style="text-align: center; margin-botton: 10px;">
			<%=request.getAttribute("pageBar") %> 
		</div>
		
		<script>
		$("#btn-add").click(function(){
			location.href="<%=request.getContextPath()%>/food/foodForm";
		});
	
		</script>

	</section>
	
	
	
<%@ include file="/views/common/footer.jsp"%>	

