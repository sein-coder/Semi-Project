<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 상단 시작-->    
<%@ include file="/views/common/header.jsp"%>
<!-- 상단 끝 -->

<!-- 컨텐츠  -->
<div id="wrapper">
    <div id="container_wr">
        <div id="container">    
            			<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="FAQ 게시판">자주 하는 질문</span>
			</h2>
			<!-- 게시판 목록 시작 { -->
			<div id="bo_list" style="width: 100%">

				<form name="fboardlist" id="fboardlist" action=""
					onsubmit="return fboardlist_submit(this);" method="post">

					<div class="tbl_head01 tbl_wrap">

						<table>
							<caption>자주 하는 질문</caption>
							<thead>
								<tr>
									<th width="10%" style="text-align: center;">번호</th>
									<th width="90%" style="text-align: center;">질문</th>
								</tr>
							</thead>
							<tbody>
							<tr class="tr_question">
							   <td class="td_num2">질문</td>
							   <td class="td_subject" style="padding-left:0px">
                                  <div class="bo_tit">
                                     <a class="qs_1" href="#">회원가입에서의 KH회원번호란?</a>
                                  </div>
                               </td>
							</tr>
							<tr id="tr_answer" style="display: none;">
								<td class="td_num2">답변</td>
							    <td class="td_subject" style="padding-left: 3%">
                                   <div class="bo_tit">
                                      <p>학원생이 된 후에 학원 홈페이지 www.iei.or.kr 회원가입시 부여받는 고유번호입니다.</p>
                                   </div>
                                </td>
							</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
        </div>
    </div>
</div>
<!-- 콘텐츠 끝 -->

<script type="text/javascript" src="./js/index.js"></script>

<script>
	$(".qs_1").click(function(){
		var answertag = $(this).closest("tr").next();
		answertag.show('slow');
		$("html").animate({scrollTop : (answertag.offset().top)}, 1500);
		$(this).off();
	});
	
</script>

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->