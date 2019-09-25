<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.umo.model.vo.Member"%>
<%
	List<Member> list=(List<Member>)request.getAttribute("list");
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
		$("#search-Id").css("display","none");
	 	$("#search-name").css("display","none");
	 	$("#search-"+$(this).val()).css("display","inline-block");
		});
	//검색타입을 동작시키기
		$("#searchType").trigger("Change");
	});
</script>
	<section id="memberList-container">
	<!--검색기능 추가 -->
		<div id="neck-container">
			<div id="search-container">
				검색타입:
				<select id="searchType">
					<option value="userId" <%="Id".equals(type)?"selected" :"" %>>아이디</option>
					<option value="userName" <%="userName".equals(type)?"selected" :"" %>>이름</option>
					<option value="gender" <%="gender".equals(type)?"selected" :"" %>>성별</option>
				</select>
				<div id="search-userId">
					<form action="<%=request.getContextPath()%>/admin/memberFinder">
					 <input type="hidden" name="searchType" value="userId"/>
					 <input type="text" name="searchKeyword" size="25" placeholder="아이디입력"
					 value='<%=type!=null&&type.equals("userId")?keyword:"" %>'/>
					 <button type="submit">검색</button>
					</form>
				</div>
				<div id="search-userName">
					<form action="<%=request.getContextPath()%>/admin/memberFinder">
					 <input type="hidden" name="searchType" value="userName"/>
					 <input type="text" name="searchKeyword" size="25" placeholder="회원이름입력" >
					 value='<%=type!=null&&type.equals("userName")?keyword:"" %>'/>
					 <button type="submit">검색</button>
					</form>
				</div>
			</div>
		<%if(type!=null||keyword!=null) { %>
			<div id="numPerPage-container">
				페이지 회원수:
				<form action="<%=request.getContextPath() %>/admin/memberFinder"
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
				<form action="<%=request.getContextPath() %>/admin/memberFinder"
				 id="numPerPageFrm">
					<select name="numPerPage" id="numPerPage" onchange="this.form.submit();">
						<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
						<option value="5"  <%=numPerPage.equals("5")?"selected":"" %>>5</option>
						<option value="3"  <%=numPerPage.equals("3")?"selected":"" %>>3</option>
					</select>
				</form>
			</div>
			<% } %>
		</div>
		<table id="tbl-member">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
			</tr>
			
		
		<% for(Member m:list){%>
			<tr>
				<td><%=m.getMemberId()%></td>
				<td><%=m.getMemberName()%></td>
				<td><%=m.getEmail()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getAddress()%></td>
				<td><%=m.getJoin_Date()%></td>
		
			</tr>
		<%} %>
		</table>
		<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>
	
	</section>
	







<%@ include file = "/views/common/footer.jsp" %>   