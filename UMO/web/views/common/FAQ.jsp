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
							<tr class="tr_question">
							   <td class="td_num2">질문</td>
							   <td class="td_subject" style="padding-left:0px">
                                  <div class="bo_tit">
                                     <a class="qs_1" href="#">나이나 학력 및 전공이 취업과 관련이 있나요?</a>
                                  </div>
                               </td>
							</tr>
							<tr id="tr_answer" style="display: none;">
								<td class="td_num2">답변</td>
							    <td class="td_subject" style="padding-left: 3%">
                                   <div class="bo_tit">
                                      <p>나이나 학력은 채용 조건에 많이 반영하지 않았으나 최근 전문대졸 이상을 요구하는 경향입니다. 그러나 업체의 입장은 실력이 좋으면 나이나 학력에 상관없이 채용하겠다는 방침이 우세합니다. 전공 또한 채용조건에 그리 큰 비중을 차지하지 않습니다.</p>
                                   </div>
                                </td>
							</tr>
							<tr class="tr_question">
							   <td class="td_num2">질문</td>
							   <td class="td_subject" style="padding-left:0px">
                                  <div class="bo_tit">
                                     <a class="qs_1" href="#">취업 추천은 어떻게 이루어 지나요?</a>
                                  </div>
                               </td>
							</tr>
							<tr id="tr_answer" style="display: none;">
								<td class="td_num2">답변</td>
							    <td class="td_subject" style="padding-left: 3%">
                                   <div class="bo_tit">
                                      <p>
						KH정보교육원은 취업지원센터를 통해 기업체와 꾸준히 고용협력을 맺고 있으며, 업체 관리 및 새로운 업체 발굴을 통해 수료생을 추천하고 있습니다. 취업추천은 구인의뢰 업체의 요구에 적합하고, 동일과정 수료생이라 하더라도 담당 선생님과 상의하여 2배수로 추천합니다.</p>
                                   </div>
                                </td>
							</tr>
							<tr class="tr_question">
							   <td class="td_num2">질문</td>
							   <td class="td_subject" style="padding-left:0px">
                                  <div class="bo_tit">
                                     <a class="qs_1" href="#">취업 시 자격증을 꼭 따야하나요?</a>
                                  </div>
                               </td>
							</tr>
							<tr id="tr_answer" style="display: none;">
								<td class="td_num2">답변</td>
							    <td class="td_subject" style="padding-left: 3%">
                                   <div class="bo_tit">
                                      <p>자격증은 취업을 위한 필수조건은 아니지만 권장사항 입니다. 그 이유는 IT업계의 업무 특성상 실무능력이 주요시 되지만 자격증 취득 여부는 1차 서류전형 시 가산점이 있기 때문입니다.</p>
                                   </div>
                                </td>
							</tr>
							<tr class="tr_question">
							   <td class="td_num2">질문</td>
							   <td class="td_subject" style="padding-left:0px">
                                  <div class="bo_tit">
                                     <a class="qs_1" href="#">취업을 위한 필수조건은 무엇인가요?</a>
                                  </div>
                               </td>
							</tr>
							<tr id="tr_answer" style="display: none;">
								<td class="td_num2">답변</td>
							    <td class="td_subject" style="padding-left: 3%">
                                   <div class="bo_tit">
                                      <p>가장 중요한 것은 본인의 노력이며, 포트폴리오(개인프로젝트 및 팀프로젝트 결과물), 기술구사능력과 적응력, 원만한 대인관계, 적극적인 훈련과정 참여 등 입니다.</p>
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