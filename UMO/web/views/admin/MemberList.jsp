<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.umo.model.vo.Board"%>
<%
	List<Board> list=(List<Board>)request.getAttribute("list");
	String type=(String)request.getAttribute("type");
	String keyword=(String)request.getAttribute("keyword");
	String numPerPage=request.getAttribute("numPerPage").toString();
%>
<%@ include file="/views/common/header.jsp"%>

<style type="text/css">
	 section#memberList-container {text-align:center;}
	 section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
	 section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
    
    div#search-container {margin:0 0 10px 0; padding:3px; background-color: rgba(0, 188, 212, 0.3);}
    div#search-userName{display:none;}
    div#search-gender{display:none;}
    div#search-userId{display:inline-block;}
	  
  
  	section#memberList-container div#neck-container{padding:0px; height: 50px; background-color:rgba(0, 188, 212, 0.3);}

	section#memberList-container div#search-container {margin:0 0 10px 0; padding:3px; float:left;}

	section#memberList-container div#numPerPage-container{float:right;}
	section#memberList-container form#numPerPageFrm{display:inline;}
 
 
 </style>

<script>
	$(function(){
	//검색타입을 고르는 부분
		$("#searchType").change(function(){
		$("#search-memberId").css("display","none");
	 	$("#search-membername").css("display","none");
	 	$("#search-"+$(this).val()).css("display","inline-block");
		});
	//검색타입을 동작시키기
		$("#searchType").trigger("Change");
	});
</script>
	<section id="memberList-container">
	<h4>회원관리</h4>
	<!--검색기능 추가 -->
		<div id="neck-container">
			<div id="search-container">
				검색타입:
				<select id="searchType">
					<option value="memberId" <%="memberId".equals(type)?"selected" :"" %>>아이디</option>
					<option value="memberName" <%="memberName".equals(type)?"selected" :"" %>>이름</option>
				</select>
				<div id="search-memberId">
					<form action="<%=request.getContextPath()%>/search/searchFinder">
					 <input type="hidden" name="searchType" value="userId"/>
					 <input type="text" name="searchKeyword" size="25" placeholder="아이디입력"
					 value='<%=type!=null&&type.equals("memberId")?keyword:"" %>'/>
					 <button type="submit">검색</button>
					</form>
				</div>
				<div id="search-memberName">
					<form action="<%=request.getContextPath()%>/search/searchFinder">
					 <input type="hidden" name="searchType" value="userName"/>
					 <input type="text" name="searchKeyword" size="25" placeholder="회원이름입력" >
					 value='<%=type!=null&&type.equals("memberName")?keyword:"" %>'/>
					 <button type="submit">검색</button>
					</form>
				</div>
			</div>
	 	<%if(type!=null||keyword!=null) { %>
			<div id="numPerPage-container">
				페이지 회원수:
				<form action="<%=request.getContextPath() %>/search/searchFinder"
				 id="numPerPageFrm">
					<select name="numPerPage" id="numPerPage" onchange="this.form.submit();">
						<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
						<option value="5"  <%=numPerPage.equals("5")?"selected":"" %>>5</option>
						<option value="3"  <%=numPerPage.equals("3")?"selected":"" %>>3</option>						
					</select>
					<input type="hidden" name="searchType" value="<%= type %>">
					<input type="hidden" name="searchKeyword" value="<%= keyword %>">
				</form>
			</div>
			<% } else { %>
			<div id="numPerPage-container">
				페이지 회원수:
				<form action="<%=request.getContextPath() %>/admin/memberList"
				 id="numPerPageFrm">
					<select name="numPerPage" id="numPerPage" onchange="this.form.submit();">
						<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
						<option value="5"  <%=numPerPage.equals("5")?"selected":"" %>>5</option>
						<option value="3"  <%=numPerPage.equals("3")?"selected":"" %>>3</option>
					</select>
				</form>
			</div>
			<% } %> --%>
		</div>
		<table id="tbl-member">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			
		
		<% for(Board b:list){%>
			<tr>
				<td><%=b.getNo()%></td>
				<td><%=b.getTitle()%></td>
				<td><%=b.getWriter()%></td>
				<td><%=b.getDate()%></td>
				<td><%=b.getCount()%>
				</td>
		
			</tr>
		<%} %>
		</table>
		<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>
	
	</section>
	


<!--

<style>
div#search-container{margin:0 50px 10px 100px;   background-color:gold;  float:left;}
input#search-title{margin-left:200px; width:30%; heigh:1000%; text-align:center; display:inline;}
button#search-btn{margin-left:500px;width:10%; heigh:1000%;}
</style>

	<div id="search-container">
		검색타입:
		<select id="searchType">
			<option value="memberId" <%="memberId".equals(type)?"selected":"" %>아이디</option>
		</select>
		<form>
			<input type="text" id="search-title" name="search" placeholder="제목을 입력하세요">
			<button type="submit" id="search-btn" >검색</button>
		</form>
	</div>






  -->




<%@ include file = "/views/common/footer.jsp" %>   