<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.*" %>
<%
List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
List<Inquery> inquerylist = (List<Inquery>)request.getAttribute("inquerylist"); 
List<Comment> NoticeCommentlist = (List<Comment>)request.getAttribute("NoticeCommentlist");
List<Comment> FoodCommentlist = (List<Comment>)request.getAttribute("FoodCommentlist");
List<Comment> inqueryCommentlist = (List<Comment>)request.getAttribute("inqueryCommentlist");
Member m=(Member)request.getAttribute("member");
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
                    <button onclick="infoUpdate();">정보수정</button>
                </div>
        <br>

        </div>
        <div class="mypagediv" id="mypost">
        	
        	<select id="board" name="board" style="width:5%">
				  <option value="음식" selected="selected">음식</option>
				   <option value="자유">자유</option>
			    	<option value="익명">익명</option>
				  <option value="질의">질의</option>
			</select>
        
            <fieldset>
                <legend>내 게시글</legend> <br>
                <table id="foodboard">
                <% if(count<3){
                 for(Food f : foodlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath() %>/images/food/<%= f.getBoard_Thumbnail()%>">food <%=f.getBoard_Title()+" "+f.getBoard_Contents()+" "+f.getBoard_Writer()%></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
	                <table id="inqueryboard" style="display:none">
	                
		               <% if(count<3){ 
		               for(Inquery i : inquerylist) { %>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=i.getBoard_No()%>"><%= i.getCode_Type()+i.getBoard_Title()+i.getBoard_Writer() %></a>
					</td>
				</tr>
			<% count++;} } count=0; %>
               	</table>
               	<table id="freeboard" style="display:none">
                <% if(count<3){
                 for(Food f : foodlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath() %>/images/food/<%= f.getBoard_Thumbnail()%>">food <%=f.getBoard_Title()+" "+f.getBoard_Contents()+" "+f.getBoard_Writer()%></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
                <table id="anonymousboard" style="display:none">
                <% if(count<3){
                 for(Food f : foodlist) {%>
                    <tr>
                        <td><a href="<%=request.getContextPath() %>/images/food/<%= f.getBoard_Thumbnail()%>">food <%=f.getBoard_Title()+" "+f.getBoard_Contents()+" "+f.getBoard_Writer()%></a></td>
                    </tr>
	          	<%count++;} } count=0;%>
                </table>
            </fieldset>
            <br>
        </div>
        <div class="mypagediv" id="comment">
            <fieldset>
                <legend>내 댓글</legend> <br>
                <table>
                    <tr>
                        <td>ㅇㅇㅇ</td>
                    </tr>
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
	        	 $('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        }else if($('#board').val()=='질의'){
	        	$('#inqueryboard').css({ display: 'flex'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        }else if($('#board').val()=='자유'){
	        	$('#inqueryboard').css({ display: 'none'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'flex'});
	        	 $('#anonymousboard').css({ display: 'none'});
	        }else if($('#board').val()=='익명'){
	        	$('#inqueryboard').css({ display: 'none'});
	        	$('#foodboard').css({ display: 'none'});
	        	$('#freeboard').css({ display: 'none'});
	        	 $('#anonymousboard').css({ display: 'flex'});
	        }
	        	})
	        })
        
            function click1() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#comment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }
            function click2() {
                $('#mypost').css({ display: 'grid', width: '75%' });
                $('#comment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click3() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#comment').css({ display: 'grid', width: '75%' });
                $('#note').css({ display: 'none', width: '75%' });
            }
            function click4() {
                $('#mypost').css({ display: 'none', width: '75%' });
                $('#comment').css({ display: 'none', width: '75%' });
                $('#note').css({ display: 'grid', width: '75%' });
            }
 			
            function infoUpdate() {
            	 location.href="<%=request.getContextPath()%>/infoUpdate?id=<%=m.getMemberId()%>";
            }
        </script>


    </section>

<%@ include file="/views/common/footer.jsp"%>