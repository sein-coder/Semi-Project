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
          <form action="<%=request.getContextPath()%>/noticeWriteEnd?writer=<%=loginMember.getMemberId() %>" method="post" enctype="multipart/form-data">  
			<article id="bo_v" style="width: 100%; height: auto !important;">
		
				<header>
					<h2 id="bo_v_title">
						<input type="text" name="title" class="frm_input full_input_title required" size="50" maxlength="200" required="required" placeholder="제목" autocomplete="off">
					</h2>
				</header>

				<section id="bo_v_info">
					<h2>페이지 정보</h2>
					<strong><span class="sv_member">작성자 : <%=loginMember.getMemberId()%></span></strong>
				</section>

				<section id="bo_v_atc">
					<h2 id="bo_v_atc_title">본문</h2>

					<!-- 본문 내용 시작 { -->
					<div id="bo_v_con">
						<textarea rows="10" cols="89" id="content" name="content"></textarea>
					</div>
					<!-- } 본문 내용 끝 -->

				</section>
                
                <!-- 첨부파일 시작 { -->
				<div class="bo_w_flie write_div">
					<div class="file_wr write_div">
						<label for="bf_file_1" class="lb_icon"><i
							class="fa fa-download" aria-hidden="true"></i></label>
							<input type="file"
							name="up_file" id="up_file"
							title="파일첨부  : 용량  10mb 이하만 업로드 가능" class="frm_file ">
					</div>
				</div>
				<!-- 첨부파일 시작 { -->

				<!-- 게시물 하단 버튼 시작 { -->
				<div class="btn_confirm write_div">
					<a href="" class="btn_cancel btn">취소</a> <input
						type="submit" value="작성완료" id="btn_submit"
						class="btn_submit btn">
				</div>
				<!-- } 게시물 하단 버튼 끝 -->
			</article>
			</form>
		</div>
  
		<!-- } 게시글 읽기 끝 -->
	</div>
</div>



<!-- } 콘텐츠 끝 -->

<script>
//에디터 설정부분
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "content",
 sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/upload/notice/contentimg/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
$(this).submit(function(){
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
});

</script>

<%@ include file="/views/common/footer.jsp"%>