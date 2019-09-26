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
div#search-container{margin:0 50px 10px 100px; background-color:gold;width:1000px; }

select#searchType{width:40%;height:40%;display:inline;}
div#search-free_writer,#search-free_contents,#search-free_title{margin-left:30px;width:20%;height:500%;display:inline;}
btn#search_btn{width:20%;height:50%;margin-left:1000px;}

</style>


<section id="notice-container" style="margin-top:6.3%;padding:5% 0 5% 0;width:60%;">
<h2>자유게시판</h2>
<%if(loginMember!=null){ %>
<div class="btn-group btn-group-sm"  id="btn-add">
      <input type="button" class="btn btn-default" value="글쓰기"
         onclick="location.href='<%=request.getContextPath()%>/freeWrite'"/>
</div>
<%} %>
<div class="searchType">
		<%if(type!=null||keyword!=null) { %>
		<select id="numPerPage" name="numPerPage">
			<option value="3" <%=numPerPage.equals("3")?"selected":"" %>>3</option>	
			<option value="5" <%=numPerPage.equals("5")?"selected":"" %>>5</option>
			<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
		</select>
		<% }else {%>
		<select id="numPerPage" name="numPerPage">
			<option value="3" <%=numPerPage.equals("3")?"selected":"" %>>3</option>	
			<option value="5" <%=numPerPage.equals("5")?"selected":"" %>>5</option>
			<option value="10" <%=numPerPage.equals("10")?"selected":"" %>>10</option>
		</select>
		<% } %>
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
			<option value="free_writer" <%="free_writer".equals(type)?"selected":"" %>>작성자</option>
			<option value="free_contents" <%="free_contents".equals(type)?"selected" :"" %>>내용</option>
			<option value="free_title" <%="free_title".equals(type)?"selected" :"" %>>제목</option>
		</select>
		<div id="search-free_writer">
			<form action="<%=request.getContextPath()%>/freeBoard">
			 <input type="hidden" name="searchType" value="free_writer"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성자아이디입력"
			 value='<%=type!=null&&type.equals("free_writer")?keyword:"" %>'/>
			 <button type="submit"  id="search_btn">검색</button>	
			</form>
		</div>
		<div id="search-free_contents">
			<form action="<%=request.getContextPath()%>/freeBoard">
			 <input type="hidden" name="searchType" value="free_contents"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성내용입력">
			 value='<%=type!=null&&type.equals("free_contents")?keyword:"" %>'/>
			 <button type="submit" id="search_btn">검색</button>
			</form>
		</div>	
		<div id="search-free_title">
			<form action="<%=request.getContextPath()%>/freeBoard">
			 <input type="hidden" name="searchType" value="free_title"/>
			 <input type="text" name="searchKeyword" size="30" placeholder="작성제목입력" >
			 value='<%=type!=null&&type.equals("free_title")?keyword:"" %>'/>
			 <button type="submit"  id="search_btn">검색</button>
			</form>
		</div>	
	</div>
	
	 <!--검색내용  -->
	   <script>
	   $(function(){
		  $("#searchType").change(function(){
		  $("#search-free_writer").css("display","none");
		  $("#search-free_contents").css("display","none");
		  $("#search-free_title").css("display","none");
		  $("#search-"+$(this).val()).css("display","inline-block");//아이디,이름,성병 중 나온 값 중 inline으로 바꾸면 내가 이제 변경할때마다 바뀜
		  });
	   //동작시키기
		  	$("#searchType").trigger("change");
	   });
	   </script>

	   <script>
	   //페이지갯수로직
	   ///else면 free/boardSearchList로 넘어가게 만들기
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