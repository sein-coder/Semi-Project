<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type=(String)request.getAttribute("type");
%>
<style>
table#list_bar{bold:1px; margin-left: auto; margin-right: auto;  border: 1px solid #444444; background: lightgray; 
}


</style>
<section>
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span>스크랩</span>
			</h2>
			<!-- 스크랩 목록 시작 { -->
			<div id="scrap_alllist" style="width: 100%">


					<!-- <div class="tbl_head01 tbl_wrap"> -->
					<!-- <div id="numPerPage-container"> -->
						<%-- 페이지 회원수 :
						<select name="numPerPage" id="numPerPage">
							<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
							<option value="5" <%=numPerPage.equals("5")?"selected":"" %>>5</option>
							<option value="3" <%=numPerPage.equals("3")?"selected":"" %>>3</option>
						</select>	 --%>
					<!-- </div> -->
						<table id="list_bar">
							<caption width="200px">스크랩모음</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: left;">번호</th>
									<th width="10%" style="text-align: left;">게시판종류</th>
									<th width="10%" style="text-align: left;">제목</th>
									<th width="10%" style="text-align: left;">글쓴이</th>
									<th width="10%" style="text-align: left;">날짜</th>
								</tr>
							</thead>
							<tr>
								<td><a href="<%=request.getContextPath() %>/scrap/ScrapViewServlet?board_no=<%=%>"></a></td>
								
							</tr>
						</table>
					
				</div>

		
			</div>
		</div>
</div>




</section>