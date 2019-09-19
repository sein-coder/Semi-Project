<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.umo.model.vo.*" %>
<%
List<Food> foodlist = (List<Food>)request.getAttribute("foodlist");
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
            <fieldset>
                <legend>내 게시글</legend> <br>
                <table>
                    <tr>
                        <td>ㅇㅇㅇ</td>
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
 
        </script>


    </section>

<%@ include file="/views/common/footer.jsp"%>