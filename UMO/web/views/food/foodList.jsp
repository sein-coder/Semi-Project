<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="java.util.List,com.umo.model.vo.Food"%>
<%
		List<Food> list = (List<Food>)request.getAttribute("list");
		String cPage = request.getAttribute("cPage").toString();
		String tag;
		try{
			tag = request.getAttribute("tag").toString();
		}catch(NullPointerException e){
			tag = "";
		}
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
button#btn-all{margin-left:85%;}
</style>
<style>
	* { margin: 0; padding: 0; list-style: none; }
    ul { padding: 16px 0; }
    ul li { display: inline-block; margin: 0 1px; font-size: 14px; letter-spacing: -.5px; }
    form { padding-top: 16px; }
    ul li.tag-item { padding: 4px 8px; background-color: #777; color: #000; }
    .tag-item:hover { background-color: #262626; color: #fff; }
    ul li.tag-item a:link { color:black; text-decoration: none;}
	ul li.tag-item a:visited { color: black; text-decoration: none;}
	ul li.tag-item a:hover { text-decoration: none;}
</style>
	<section id="food-container"  style="padding: 0% 0 5% 0;margin-top:6.3%; ">
	<!-- <MARQUEE behavior=alternate><h2 style="width:100; height:50;">FOOD ZONE</h2></MARQUEE> -->
	<% if(loginMember!=null && loginMember.getMemberId().equals("sein0728")) {%>
		<button id="btn-add">등록</button>
	<% } %>
	<% if(request.getParameter("tag")!=null) { %>
		<button id="btn-all" onclick="location.href='<%=request.getContextPath()%>/food/foodList'">전체보기</button>
	<% } %>

<%-- 	<% if(loginMember != null) { %> --%>
	<%-- <% } %> --%>
	
	<table id ="big-tbl">
	<% for(Food f : list) {%>
		<% if(count==0 || count==4)  {%><tr> <% }%>
			<td>
			<table id="sml-tbl">
				<tr>
					<td colspan="2">
					<a href='<%=request.getContextPath()%>/food/foodView?board_no=<%=f.getBoard_No()%>&cPage=<%=cPage%>&tag=<%=tag.equals("")?"":tag%>'>
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
			        	if(f.getBoard_menu()!=null) {
			        	for(String str : f.getBoard_menu().split(",")) { %>
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

