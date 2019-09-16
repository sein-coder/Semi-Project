<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" type="text/css"/>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/header.js"></script>
</head>
<body>
  <!-- Header -->
    <div class="menuview" style="background:url('<%=request.getContextPath()%>/images/06.jpg');color:white;">
            <br><br><br>
            <br><br><br>
            <a href="#">회원가입</a>&nbsp;&nbsp;
            <a href="#">로그인</a>
            <br>
            <p>출석일은 ~일</p>
            <a href="">달력</a>
            <br><br>
            <ul>
                <li class="menu" type="none" style="display: block;">
                    <a class="menuLink"><img src="" alt="즐겨찾기"/></a>
                    <ul class="hide">
                        <li><a href="#" class="submenuLink">반별게시판</a></li>
                        <li><a href="#" class="submenuLink">익명게시판</a></li>
                        <li><a href="#" class="submenuLink">코드게시판</a></li>
                        <li><a href="#" class="submenuLink">강사게시판</a></li>
                        <li><a href="#" class="submenuLink">칭찬게시판</a></li>
                    </ul>
                </li><br>
        </div>
                <header id="header" class="header">
                    <h2><a href="<%=request.getContextPath() %>/index.jsp" style="color:inherit;text-decoration: none;">kh</a></h2>
                    <div style="display: flex;">
                        <div class="left-menu">
                            <a href="javascript:doDisplay();"><img id="guidebutton" src="https://www.iei.or.kr/resources/images/common/menu_open.png"></a>
                        </div>
                            <div class="center-menu">
                              <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown gecipan1"   style="color: black">공지</button></a>
                                <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown gecipan2"   style="color: black">게시판</button></a>
                                <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown gecipan3"   style="color: black">자극방</button></a>
                                <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown gecipan4"   style="color: black">게임방</button></a>
                                <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown gecipan5"   style="color: black">랭킹방</button></a>
                                <a href="<%=request.getContextPath() %>/food/foodList"><button id="dropdown-btn" class="dropdown gecipan6"   style="color: black">맛집추천</button></a>
                                <a href="<%=request.getContextPath() %>/webCopiler/webCopilerView"><button id="dropdown-btn" class="dropdown gecipan7"   style="color: black">코드방</button></a>
                            </div>
                            <div class="right-menu">
                                <a href="<%=request.getContextPath() %>/index.jsp" style="color:inherit;text-decoration: none;">회원가입</a>&nbsp;&nbsp;
                                <a href="<%=request.getContextPath() %>/index.jsp" style="color:inherit;text-decoration: none;">로그인</a>&nbsp;&nbsp;
                            </div>		
                        </div>
                    </header>
                    <header id="header">
                    <div class="subcenter-menu">
                        <div id="subcenter-menu1">
                            <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">새로운소식</button></a>
                            <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">오시는길</button></a>
                        </div>
                                <div id="subcenter-menu2">
                                    <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">게시판1</button></a>
                                    <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">게시판2</button></a>
                                    <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">게시판3</button></a>
                                    <a href="<%=request.getContextPath() %>/index.jsp"><button id="dropdown-btn" class="dropdown"   style="color: black">게시판4</button></a>
                                </div>
                            </div>
                    </header>                        
         <!-- Header -->      
	
	
	
	
	
	
	
	