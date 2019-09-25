<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Board" %>

<% 
     Board ab=(Board)request.getAttribute("ab");
%>


   <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center; margin-top:150px; }
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style> 
   <section id="notice-container">
   <%@ include file="/views/common/header.jsp" %>
   <h2>공지사항</h2>
        <table id="tbl-notice" class="table table-striped table-bordered table-hover">
        <tr>
            <th>제 목</th>
            <td><%=ab.getTitle()%></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
            <%if(ab.getRenamed_filename()!=null) {%>
                         <a href="<%=request.getContextPath()%>/free/fileDown?fileName=<%=ab.getRenamed_filename() %>">
						<img src="<%=request.getContextPath()%>/images/file.png"
						width="16px"/></a>
					<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=ab.getContent()%></td>
        </tr>
        <%if(loginMember!=null){ %>
        <tr>
            <th colspan="2">
                <input type="button" class="btn btn-default" value="수정하기" onclick="location.href='<%=request.getContextPath()%>/freeUpdate?noticeNo=<%=ab.getNo()%>'"/>
                <input type="button" class="btn btn-default" value="삭제하기" onclick="location.href='<%=request.getContextPath()%>/freeDelete?noticeNo=<%=ab.getNo() %>'"/>
            </th>
        </tr>
        <%} %>
       
    </table>
    </section>
<%@ include file="/views/common/footer.jsp" %>