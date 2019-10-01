<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member,java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<% List<Member> list=(List)request.getAttribute("list");
String type=(String)request.getAttribute("searchType");
String keyword=(String)request.getAttribute("searchKeyword");

%>
<style>
#tbl-member,tr>td,th,h2{
border:1px solid black;
text-align:center;
width:55%;
height:50%;
margin:0 auto;
}
memberList-container{

position:absolute;

display:flex;
margin-top:10%;
}
#pageBar{
margin:0 auto;
text-align:center;
margin-bottom:5%;
}
#tbl-member{
border-collapse:collapse;
margin-top:-6%;
}
#member-include{
width:22%;
}
</style>




<section id="memberList-container">
		<h2 style="margin-top:10%; ">회원관리</h2>
		<!-- 검색기능 추가하기! -->
		<div id="member-include">
			 <div id="search-member">
				검색타입 : 
				<select id="searchType">
					<option value="memberId" <%="memberId".equals(type)?"selected":"" %>>아이디</option>
					<option value="memberName" <%="memberName".equals(type)?"selected":"" %> >이름</option>
					
				</select>
				<div id="search-memberId">
					<form action="<%=request.getContextPath() %>/mef">
						<input type="hidden" name="searchType" value="memberId"/>
						<input type="text" name="searchKeyword" size="25"
						placeholder="아이디입력" value='<%=type!=null&&type.equals("memberId")?keyword:"" %>'
						/>
						<button type="submit">검색</button>
					</form>
				</div>
				<div id="search-memberName">
					<form action="<%=request.getContextPath() %>/mef">
						<input type="hidden" name="searchType" value="memberName"/>
						<input type="text" name="searchKeyword" size="25"
						placeholder="회원이름입력" value='<%=type!=null&&type.equals("memberName")?keyword:"" %>'
						/>
						<button type="submit">검색</button>
					</form>
				</div>
				
			</div> 
		
		
		</div>
		
		
		
		
		<table id="tbl-member">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>반</th>
				<th>이메일</th>
				<th>회원번호</th>
				<th>가입일자</th>
			</tr>
			
			<% for(Member m : list){ %>
				<tr>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberName() %></td>
					
					<td><%=m.getClass1() %></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getKhno() %></td>
					<td><%=m.getJoin_date() %></td>
				</tr>
			<%} %>
		</table>
		<div id="pageBar">
		<%=request.getAttribute("pageBar") %></div>
		
		
	</section>
<%@ include file="/views/common/footer.jsp"%>