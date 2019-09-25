<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member" %>
 <% Member loginMember=(Member)session.getAttribute("loginMember");
Cookie[] cookies=request.getCookies();
String saveId=null;
/* System.out.println(m.getMemberId()); */
%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css"/>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/header.js"></script>

<body>
  <!-- Header -->
    <div class="menuview">
        <br><br><br>
        <br><br><br>
        <%if(loginMember==null) {%>
            <a href="<%=request.getContextPath()%>/memberJoin">회원가입</a>&nbsp;&nbsp;
            <a href="<%=request.getContextPath()%>/memberLogin">로그인</a>
            <%}else{ %>
            <a href="<%=request.getContextPath() %>/myPage?userId=<%=loginMember.getMemberId()%>">마이페이지</a>
            <a href="<%=request.getContextPath() %>/logout">로그아웃</a>
            <%} %>
        <br>
        <p>출석일은 ~일</p>
        <button class="calendarbutton" onclick="calendarbutton();">달력</button>
        <div class="calendarview" style="display:none;">
            <table id="calendar" border="3" align="center" style="border-color:rgb(48, 84, 202) ">
                <tr>
                    <td><label onclick="prevCalendar()" style="cursor: pointer">
                            <</label> </td> <td align="center" id="tbCalendarYM" colspan="5">
                                yyyy년 m월</td>
                    <td><label onclick="nextCalendar()" style="cursor: pointer">>
    
                        </label></td>
                </tr>
                <tr>
                    <td align="center">
                        <font color="red">일
                    </td>
                    <td align="center">월</td>
                    <td align="center">화</td>
                    <td align="center">수</td>
                    <td align="center">목</td>
                    <td align="center">금</td>
                    <td align="center">
                        <font color="skyblue">토
                    </td>
                </tr>
            </table>
        </div>
        <br><br>
        <ul>
            <li class="menu" type="none">
                <a class="menuLink"><img src="" alt="즐겨찾기" /></a>
                <ul class="hide">
                    <li><a href="" class="submenuLink">반별게시판</a></li>
                    <li><a href="" class="submenuLink">익명게시판</a></li>
                    <li><a href="" class="submenuLink">코드게시판</a></li>
                    <li><a href="" class="submenuLink">강사게시판</a></li>
                    <li><a href="" class="submenuLink">칭찬게시판</a></li>
                </ul>
            </li><br>
    </div>
    <div>
        <header id="header">
            <h2><a href="<%=request.getContextPath() %>/index.jsp" style="color:inherit;text-decoration: none;">kh</a></h2>
            <div class="menu2">
                <div class="left-menu">
                    <a href="javascript:doDisplay();"><img id="guidebutton"
                            src="https://www.iei.or.kr/resources/images/common/menu_open.png"></a>
                </div>
                <div class="center-menu">
                    <a href="#"><button id="dropdown-btn" class="dropdown gecipan1"
                            style="color: black">공지</button></a>
                    <a href="index.html"><button id="dropdown-btn" class="dropdown gecipan2"
                            style="color: black">게시판</button></a>
                    <a href="index.html"><button id="dropdown-btn" class="dropdown gecipan3"
                            style="color: black">자극방</button></a>
                    <a href="index.html"><button id="dropdown-btn" class="dropdown gecipan4"
                            style="color: black">게임방</button></a>
                    <a href="<%=request.getContextPath()%>/food/foodList"><button id="dropdown-btn" class="dropdown gecipan6"
                            style="color: black">맛집추천</button></a>
                    <a href="<%=request.getContextPath()%>/webCopiler/webCopilerView"><button id="dropdown-btn" class="dropdown gecipan7"
                            style="color: black">코드방</button></a>
                </div>
                  <% if(loginMember==null){ %>
                            <div class="right-menu">
                                <a href="<%=request.getContextPath() %>/memberJoin" style="color:inherit;text-decoration: none;">회원가입</a>
                                <a href="<%=request.getContextPath() %>/memberLogin" style="color:inherit;text-decoration: none;">로그인</a>
                            </div>	
                            <%}else{ %>
                            <div class="right-menu">
                            
                            <a href="<%=request.getContextPath() %>/myPage?userId=<%=loginMember.getMemberId()%>" style="color:inherit; text-decoration: none;">마이페이지</a>
                            <a href="<%=request.getContextPath() %>/logout">로그아웃</a>
                            </div>
                            <%} %>
                            </div>
        </header>
        <div class="subcenter-menu">
            <div id="subcenter-menu1">
                <a href="<%=request.getContextPath() %>/noticeBoard"><button id="dropdown-btn" class="dropdown" style="color: black">새로운소식</button></a>
                <a href="오시는길.html"><button id="dropdown-btn" class="dropdown" style="color: black">오시는길</button></a>
            </div>
            <div id="subcenter-menu2">
                <a href="<%=request.getContextPath()%>/freeBoard"><button id="dropdown-btn" class="dropdown" style="color: black">자유게시판</button></a>
                <a href="<%=request.getContextPath()%>/anonymousBoard"><button id="dropdown-btn" class="dropdown" style="color: black">익명게시판</button></a>
                <a href="index.html"><button id="dropdown-btn" class="dropdown" style="color: black">게시판3</button></a>
                <a href="<%= request.getContextPath()%>/inquery/inqueryBoard"><button id="dropdown-btn" class="dropdown" style="color: black">코드 질의게시판</button></a>
            </div>
        </div>
    </div>
    <!-- Header -->  
	
	
	
	
	
	
	
	