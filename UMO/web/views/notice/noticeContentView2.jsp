<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
		<h2 id="container_title">
			<span title="공지사항">공지사항</span>
		</h2>
		<!-- 게시물 읽기 시작 { -->

		<article id="bo_v" style="width: 100%; height: auto !important;">
			<header>
				<h2 id="bo_v_title">
					<span class="bo_v_tit"> 공지사항 타이틀</span>
				</h2>
			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>
				<strong><span
					class="sv_member">작성자</span></strong><strong><a
					href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i>
						0건(댓글)</a></strong>
					<strong>
					<i class="fa fa-eye" aria-hidden="true"></i> 567회(조회수)</strong>
					<strong class="if_date">
					<i class="fa fa-clock-o" aria-hidden="true"></i> 19-05-22 18:10</strong>

			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>

					<!-- 본문 내용 시작 { -->
					<div id="bo_v_con">
				
					</div>
					<!-- } 본문 내용 끝 -->

			</section>

			<div id="bo_v_share"></div>



			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">

				<ul class="bo_v_left">
				</ul>

				<ul class="bo_v_com">
					<li><a href=""
						class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>
							목록</a></li>
					<li><a href="" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</a></li>
				</ul>

				<ul class="bo_v_nb">
					<li class="btn_prv"><span class="nb_tit"><i
							class="fa fa-caret-up" aria-hidden="true"></i> 이전글</span><a
						href="">이전글이닷</a> <span
						class="nb_date">19.05.27</span></li>
					<li class="btn_next"><span class="nb_tit"><i
							class="fa fa-caret-down" aria-hidden="true"></i> 다음글</span><a
						href="">다음 글이다</a> <span class="nb_date">19.05.01</span></li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->


			<button type="button" class="cmt_btn">
				<i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록
			</button>
			<!-- 댓글 시작 { -->
			<section id="bo_vc">
				<h2>댓글목록</h2>

				<article>
					<header style="z-index: 2">
						<h2>(memberId)님의 댓글</h2>
						<span class="sv_member">123</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00">19-09-29 16:47</time></span>
					</header>

					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p>123</p>
						<ul class="bo_vc_act">
							<li><a
								href=""
								onclick="" class="btn_b03">답변</a></li>
							<li><a
								href=""
								onclick="return comment_delete();" class="btn_b03">삭제</a></li>
						</ul>
					</div>
					

					<input type="hidden" value="" id="">
					<textarea id="save_comment" style="display: none">123</textarea>

				</article>

			</section>
			<!-- } 댓글 끝 -->

			<!-- 댓글 쓰기 시작 { -->
			<aside id="bo_vc_w" class="bo_vc_w">
				<h2>댓글쓰기</h2>
				<form name="fviewcomment" id="fviewcomment"
					action=""
					onsubmit="" method="post"
					autocomplete="off">

					<textarea id="wr_content" name="wr_content" maxlength="10000"
						required class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>

					<div class="bo_vc_w_wr">
						<div class="bo_vc_w_info">
							 <input type="text" name="wr_name" value="" id="wr_name"
								required class="frm_input required" size="25"
								placeholder="이름">  
							 <input
								type="password" name="wr_password" id="wr_password" required
								class="frm_input required" size="25" placeholder="비밀번호">
					
						</div>
						<div class="btn_confirm">
							 <input type="submit"
								id="btn_submit" class="btn_submit" value="댓글등록">
						</div>
					</div>
				</form>
			</aside>
          </article>

     </div>

		<!-- } 게시글 읽기 끝 -->
	</div>
	</div>



<!-- } 콘텐츠 끝 -->

<%@ include file="/views/common/footer.jsp"%>