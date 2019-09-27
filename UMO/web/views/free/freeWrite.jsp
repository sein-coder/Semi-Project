<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>
<style>
    section#notice-container{margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
   <section id="notice-container">
   <h2>자유게시판</h2>
      <form action="<%=request.getContextPath()%>/freeWriteEnd" method="post" enctype="multipart/form-data">  
      <table id="tbl-notice" class="table table-striped table-bordered table-hover">
       <tr>
         <th>제목</th>
         <td><input type="text" name="title" required/></td>
       </tr>
       <tr>
         <th>작성자</th>
         <td><input type="text" name="writer" value="<%=loginMember.getMemberId()%>" readonly="readonly"/></td>
       </tr>
       <tr>
         <th>첨부파일</th>
         <td><input type="file" name="up_file" /></td>
       </tr>
       <tr>
         <th>내용</th>
         <td><textarea rows="5" cols="50" name="content"></textarea></td>
       </tr>
       <tr>
         <td colspan="2" style="text-align:center;"><input type="submit" value="등록"/></td>
       </tr>  
      </table>
      </form>
   
   
   
   </section>

<%@ include file="/views/common/footer.jsp" %>