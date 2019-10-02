<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 상단 시작-->    
<%@ include file="/views/common/header.jsp"%>
<!-- 상단 끝 -->

<!-- 컨텐츠  -->
<div id="wrapper">
    <div id="container_wr">
        <div id="container">     
        <!-- 최신글 시작 { -->       
            <div class="latest_wr"> 
                <div style="float:left;" class="lt_wr">
            
                    <div class="lat">
                        <h2 class="lat_title"><a href="<%=request.getContextPath()%>/anonymousBoard">익명게시판</a></h2>
                        
                        <ul id="anonymousBoard">
                        </ul>
                        <a href="<%=request.getContextPath()%>/anonymousBoard" class="lt_more"><i class="fa fa-plus"
                                aria-hidden="true"></i></a>
                    </div>
                </div>
                <div style="float:left; margin-left: 15px; margin-right: 0%;" class="lt_wr">
                    <div class="lat">
                        <h2 class=
                        "lat_title"><a href="<%=request.getContextPath()%>/gradeBoard">반별게시판</a></h2>
                        <ul id="gradeBoard">						
						</ul>
                        <a href="<%=request.getContextPath()%>/gradeBoard" class="lt_more"><i class="fa fa-plus"
                                aria-hidden="true"></i></a>
            
                    </div>
                </div>
                <div style="float:left;" class="lt_wr">
            
                    <div class="lat">
                        <h2 class="lat_title"><a href="<%=request.getContextPath()%>/inquery/inqueryBoard">코딩게시판</a></h2>
                        <ul id="inqueryBoard">
                        </ul>
                        <a href="<%=request.getContextPath()%>/inquery/inqueryBoard" class="lt_more"><i class="fa fa-plus"
                                aria-hidden="true"></i></a>
            
                    </div>
                </div>
                <div style="float:left; margin-left: 15px; margin-right: 0%;" class="lt_wr">
                    <div class="lat">
                        <h2 class="lat_title"><a href="<%=request.getContextPath()%>/freeBoard">자유게시판</a></h2>
                        <ul id="freeBoard">
                        </ul>
                        <a href="<%=request.getContextPath()%>/freeBoard" class="lt_more"><i class="fa fa-plus"
                                aria-hidden="true"></i></a>
            
                    </div>
                </div>
              
                <!-- } 최신글 끝 -->

            </div>

            <div class="latest_wr">
                <!--  사진 최신글1 { -->
                <div class="pic_lt">
                    <h2 class="lat_title"><a href="<%=request.getContextPath()%>/food/foodList">맛집게시판</a></h2>
                    <ul id="foodBoard">
                    </ul>

                    <a href="<%=request.getContextPath()%>/food/foodList" class="lt_more"><i class="fa fa-plus" aria-hidden="true"></i></a>

                </div>
                <!-- } 사진 최신글2 끝 -->
            </div>


        </div>
        <div id="aside">

            <div class="notice">
                <h2><a href="<%= request.getContextPath() %>/noticeBoard"><i class="fa fa-bullhorn" aria-hidden="true"></i></a>
                </h2>
                <ul id="noticeboard">
                </ul>
            </div>

         <!-- 로그인 전 뷰-->
         <% if(loginMember==null) { %>
          <section id="ol_before" class="ol">
                <h2>회원로그인</h2>
                <form name="foutlogin" action="<%= request.getContextPath() %>/loginCheck"
                    onsubmit="return fhead_submit(this);" method="post" autocomplete="off">
                    <fieldset>
                        <div class="ol_wr">
                            <label for="ol_id" id="ol_idlabel"></label>
                            <input type="text" id="ol_id" name="mb_id" required maxlength="20" placeholder="아이디">
                            <label for="ol_pw" id="ol_pwlabel"></label>
                            <input type="password" name="mb_password" id="ol_pw" required maxlength="20"
                                placeholder="비밀번호">
                            <input type="submit" id="ol_submit" value="로그인" class="btn_b02">
                        </div>
                        <div class="ol_auto_wr">
                            <div id="ol_auto">
<!--                                 <input type="checkbox" name="autoCom_login" value="1" id="autoCom_login">
                                <label for="autoCom_login" id="autoCom_login_label">아이디기억</label> -->
                            </div>
                            <div id="ol_svc">
                                <a href="<%=request.getContextPath() %>/memberJoin"><b>회원가입</b></a> /
                                <a href="<%=request.getContextPath() %>/infoFindServlet" id="ol_password_lost">정보찾기</a>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </section>
            <% } else { %>
             <!-- 로그인  후 뷰 처리해야함 -->
             <section id="ol_after" class="ol">
                <header id="ol_after_hd">
                    <h2>나의 회원정보</h2>
					<span class="profile_img"> <img
						src="<%=request.getContextPath()%>/images/icon/icon1.png"
						alt="profile_img"> <a href="" id="ol_after_info"
						title="정보수정"><i class="fa fa-cog" aria-hidden="true"></i></a>
					</span> 
					<strong><%=loginMember.getMemberId()%></strong>
                    <a href="<%=request.getContextPath()%>/myPage?userId=<%= loginMember.getMemberId() %>" id="ol_after_logout" class="btn_b04">마이페이지</a>
                    <a href="<%= request.getContextPath() %>/logout" id="ol_after_logout" class="btn_b04">로그아웃</a>
                </header>
                <ul id="ol_after_private">
                
                    <li>

                        <a href="<%=request.getContextPath()%>/memoListServlet?userId=<%= loginMember.getMemberId() %>"
                         id="ol_after_memo" class="win_memo" 
                         onclick="window.open(this.href,'_blank','width=400px, height=400px, top=5, left=20, scrollbars=no'); return false">쪽지<br>
                            <strong><i class="fa fa-envelope-o" aria-hidden="true"></i> </strong>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/views/point/pointView.jsp?userId=<%= loginMember.getMemberId() %>" 
                        target="_blank" id="ol_after_pt" class="win_point"
                        onclick="window.open(this.href,'_blank','width=400px, height=400px, top=5, left=20, scrollbars=no'); return false">포인트<br>
                            <strong><i class="fa fa-database" aria-hidden="true"></i> </strong>
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/scrap/scrapViewServlet" id="ol_after_scrap" class="win_scrap">스크랩<br>
                            <strong class="scrap"><i class="fa fa-thumb-tack" aria-hidden="true"></i></strong>
                        </a>

                    </li>
                </ul> 
                

            </section>
			<% } %>

            <!-- 접속자집계 시작 { -->
            <section id="visit">
            	<div id="login-visit">
	                <h2><i class="fa fa-users" aria-hidden="true"></i> 접속자집계</h2>
	                <dl>
	                    <dt><span class="color_1"></span> 현재</dt>
	                    <dd><strong id="loginCount" class="color_1"><%= loginCount %></strong></dd>
	                    <dt><span class="color_2"></span> 오늘</dt>
	                    <dd><strong id="todayLogin" class="color_2"><%= todayLogin %></strong></dd>
	                    <dt><span class="color_3"></span> 최대</dt>
	                    <dd><strong id="maxLogin" class="color_3"><%= maxLogin %></strong></dd>
	                    <dt><span class="color_4"></span> 누적</dt>
	                    <dd><strong id="allLogin" class="color_4"><%= allLogin %></strong></dd>
	                </dl>
                </div>
            </section>
            <!-- } 접속자집계 끝 -->
        </div>
    </div>
</div>
<!-- 콘텐츠 끝 -->

<script type="text/javascript" src="./js/index.js"></script>

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->