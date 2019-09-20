<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.*" %>
<%
List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
List<Comment> NoticeCommentlist = (List<Comment>)request.getAttribute("NoticeCommentlist");
List<Comment> FoodCommentlist = (List<Comment>)request.getAttribute("FoodCommentlist");
List<Comment> inqueryCommentlist = (List<Comment>)request.getAttribute("inqueryCommentlist");
int count = 0;
%> 
<%@ include file="/views/common/header.jsp"%>
<section id="intro" class="main style12">
        <div>
            <div class="content" style="margin-left:10%;">
                <button onclick="click1();">전체보기</button>
                <button onclick="click2();">게시글</button>
                <button onclick="click3();">댓글</button>
                <button onclick="click4();">쪽지</button>
                <div style="margin-left:0 auto; ">
                    <p>출석은~일</p>
                    <button onclick="click6();">정보수정</button>
                </div>
        <br>

        </div>
        <div class="mypagediv" id="mypost">
                <select id="board" name="board" style="width:5%">
				  <option value="음식" selected="selected">음식</option>
				  <option value="질의">질의</option>
				</select>
				
            <fieldset>
                <legend>내 게시글</legend> <br>
                
                <table id="foodboard">
                <% if(count<3){
                 for(Food f : foodlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath() %>/images/food/"><%=f.getBoard_Thumbnail()%>">food <%=f.getBoard_Title()+" "+f.getBoard_Contents()+" "+f.getBoard_Writer() %></a></td>
                    </tr>
          		<%count++;} } %>
                </table>
                <table id="inqueryboard" style="display:none">
                    <tr>
                    <td>안녕</td>
                    </tr>
                </table>
                
            </fieldset>
            <br>
        </div>
        <div class="mypagediv" id="mycomment">
         <select id="comment" name="comment" style="width:5%">
				  <option value="공지댓글" selected="selected">공지댓글</option>
				  <option value="음식댓글">음식댓글</option>
				   <option value="질의댓글">질의댓글</option>
				</select>
            <fieldset>
                <legend>내 댓글</legend> <br>
                 <table id="noticecomment">
                <% if(count<3){
                 for(Comment c : NoticeCommentlist) {%>
                    <tr>
                        <td><%=c.getComment_contents()+" "+c.getComment_writer()+" "+c.getComment_date() %></td>
                    </tr>
          		<%count++;} } %>
                </table>
                <table id="foodcomment" style="display:none">
                   <% count=0;
                   if(count<3){
                 for(Comment c : FoodCommentlist) {%>
                    <tr>
                        <td><%=c.getComment_contents()+" "+c.getComment_writer()+" "+c.getComment_date() %></td>
                    </tr>
          		<%count++;} } %>
                </table>
                <table id="inquerycomment" style="display:none">
                     <% count=0;	
                   if(count<3){
                 for(Comment c : inqueryCommentlist) {%>
                    <tr>
                        <td><%=c.getComment_contents()+" "+c.getComment_writer()+" "+c.getComment_date() %></td>
                    </tr>
          		<%count++;} } %>
                </table>
            </fieldset>
            <br>
        </div>
        <div class="mypagediv" id="note">
            <fieldset>
                <legend>내 쪽지</legend> <br>
                <table>
                    <tr>
                        <td>ㅇㅇㅇ</td>
                    </tr>
                </table>
            </fieldset>
        </div>

        <script>
        
        $(document).ready(function(){
        	$('#board').on('change',function(){
        if($('#board').val()=='음식'){
        	 $('#foodboard').css({ display: 'flex'});
        	 $('#inqueryboard').css({ display: 'none'});
        }else if($('#board').val()=='질의'){
        	$('#inqueryboard').css({ display: 'flex'});
        	$('#foodboard').css({ display: 'none'});
        }
        	})
        })
        
        $(document).ready(function(){
        	$('#comment').on('change',function(){
        if($('#comment').val()=='공지댓글'){
        	 $('#noticecomment').css({ display: 'flex'});
        	 $('#foodcomment').css({ display: 'none'});
        	 $('#inquerycomment').css({ display: 'none'});
        }else if($('#comment').val()=='음식댓글'){
        	$('#foodcomment').css({ display: 'flex'});
        	$('#noticecomment').css({ display: 'none'});
        	$('#inquerycomment').css({ display: 'none'});
        }else if($('#comment').val()=='질의댓글'){
        	$('#inquerycomment').css({ display: 'flex'});
        	$('#foodcomment').css({ display: 'none'});
        	$('#noticecomment').css({ display: 'none'});
        }
        
        	})
        })
	    
	    
            function click1() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#mycomment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }
            function click2() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#mycomment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click3() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#mycomment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click4() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#mycomment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }

        </script>


    </section>

<%@ include file="/views/common/footer.jsp"%>