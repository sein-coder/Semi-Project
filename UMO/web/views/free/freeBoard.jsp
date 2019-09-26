<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, com.umo.model.vo.Board" %>
<%
  	List<Board> list=(List)(request.getAttribute("list"));
	String type=(String)request.getAttribute("type");
	String keyword=(String)request.getAttribute("keyword");
	String numPerPage = request.getAttribute("numPerPage").toString();
%>
<%@ include file="/views/common/header.jsp" %>
<style>
section{margin-bottom: 500px;}
div#search-container{margin:0 50px 10px 100px; background-color:gold;  float:center;}
input#search-title{margin-left:200px; width:30%; heigh:500%; text-align:center; display:inline;}
button#search-btn{margin-left:200px;width:10%; heigh:800%;display:inline}
select#searchType,#search-btn{margin-left:50px;width:20%;height:800%;display:inline}
</style>


<section id="notice-container" style="margin-top:6.3%;padding:5% 0 5% 0;width:60%;">
<h2>자유게시판</h2>
<%if(loginMember!=null){ %>
<div class="btn-group btn-group-sm"  id="btn-add">
      <input type="button" class="btn btn-default" value="글쓰기"
         onclick="location.href='<%=request.getContextPath()%>/freeWrite'"/>
   </div>
<%} %>
		<%if(type!=null||keyword!=null) { %>
		<select id="numPerPage" name="numPerPage">
			<option value="3개" <%=numPerPage.equals("3개")?"selected":"" %>>3개</option>	
			<option value="5개" <%=numPerPage.equals("5개")?"selected":"" %>>5개</option>
			<option value="10개" <%=numPerPage.equals("10개")?"selected":"" %>>10개</option>
		</select>
		<% }else {%>
		<select id="numPerPage" name="numPerPage">
			<option value="3개" <%=numPerPage.equals("3개")?"selected":"" %>>3개</option>	
			<option value="5개" <%=numPerPage.equals("5개")?"selected":"" %>>5개</option>
			<option value="10개" <%=numPerPage.equals("10개")?"selected":"" %>>10개</option>
		</select>
		<% } %>
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
         <td><a href="<%=request.getContextPath()%>/freeContentView?freeNo=<%=b.getNo()%>"><%=b.getTitle() %></a></td>
         <td><%=b.getWriter()%></td>
         <td>
            <%if(b.getRenamed_filename()!=null) {%>
             <img src="<%=request.getContextPath()%>/images/file.png"
               width="16px" />
               <%
            }else if (b.getOriginal_filename() != null) {
            %> <img src="<%=request.getContextPath()%>/images/file.png"
               width="16px" /> <%
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
    
    
    <!--검색기능  -->
	<div id="search-container">검색타입:
		<select id="searchType">
			<option value="free_writer" <%="free_writer".equals(type)?"selected":"" %>>아이디</option>
			<option value="free_contents" <%="free_contents".equals(type)?"selected" :"" %>>내용</option>
			<option value="free_title" <%="free_title".equals(type)?"selected" :"" %>>제목</option>
		</select>
		<div id="search-free_writer">
			<form action="<%=request.getContextPath()%>/search/searchFinder">
			 <input type="hidden" name="searchType" value="free_writer"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성자아이디입력"
			 value='<%=type!=null&&type.equals("free_writer")?keyword:"" %>'/>
			 <button type="submit">검색</button>	
			</form>
		</div>
		<div id="search-free_contents">
			<form action="<%=request.getContextPath()%>/search/searchFinder">
			 <input type="hidden" name="searchType" value="free_contents"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성내용입력" >
			 value='<%=type!=null&&type.equals("free_contents")?keyword:"" %>'/>
			 <button type="submit">검색</button>
			</form>
		</div>	
		<div id="search-free_title">
			<form action="<%=request.getContextPath()%>/search/searchFinder">
			 <input type="hidden" name="searchType" value="free_title"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성제목입력" >
			 value='<%=type!=null&&type.equals("free_title")?keyword:"" %>'/>
			 <button type="submit">검색</button>
			</form>
		</div>	
	</div>
	
	   <script>
	 <!--검색내용  -->
	   $(function(){
		  $("#searchType").change(function(){
		  $("#search-free_writer").css("display","none");
		  $("#search-free_contents").css("display","none");
		  $("#search-free_title").css("display","none");
		  $("#search-"+$(this).val()).css("display","inline-block");
		  });
	   //동작시키기
		  	$("#searchType").trigger("change");
	   });
	   </script>
	   
	   
	   
	   <!--data : "countPerPage="+10+"&pageNo="+pageNo,  -->
	   
	   
	   <script>
	   $(function(){
		  $("#numPerPage").change(function(){
			 location.href='<%=request.getContextPath()%>/freeBoard?numPerPage='+$("#numPerPage").val()+'&cPage=1';
			 
		  });
	   });
	   </script>
	   
  
</section>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%@ include file="/views/common/footer.jsp" %>