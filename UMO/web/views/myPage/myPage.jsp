<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.*" %>
<%
List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
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
	        }else if($('#board').val()=='질의'){
	        	$('#inqueryboard').css({ display: 'flex'});
	        	$('#foodboard').css({ display: 'none'});
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