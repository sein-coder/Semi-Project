<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member"%>

<%@ include file="/views/common/header.jsp"%>

<%
	Member m = (Member)request.getAttribute("member");
%>

<style>
/* 회원가입 입력 */
#register_form{background:#fff;padding:20px;margin-bottom:20px}
#fregisterform #msg_certify {margin:5px 0 0;padding:5px;border:1px solid #dbecff;background:#eaf4ff;text-align:center}
#fregisterform .frm_address {margin:5px 0 0}
#fregisterform #mb_addr3 {display:inline-block;margin:5px 0 0;vertical-align:middle}
#fregisterform #mb_addr_jibeon {display:block;margin:5px 0 0}
#fregisterform .btn_confirm{text-align:center}
#fregisterform .btn_confirm .btn_submit{height:45px;;padding:0 30px;font-weight:bold;font-size:1.083em}
#fregisterform .btn_confirm .btn_cancel{line-height:45px;height:45px;padding:0 30px;font-weight:bold;font-size:1.083em}
#fregisterform .frm_info{display:block;color:#3497d9;font-size:0.92em}
#fregisterform .form_01 div{margin: 0 0 50px}
</style>

<!-- 컨텐츠  -->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="정보 찾기">정보 찾기</span>
			</h2>
			<!-- 정보 찾기 시작  -->
			<div id="register_form" class="form_01">
				<form id="fregisterform" name="fregisterform" action="" onsubmit="return fregisterform_submit(this);"
				method="post" autocomplete="off">
				<div>
					<h2>아이디 찾기</h2>
					<ul>
						<li><input type="text" name="findId_khNum" value=""
							id="findId_khNum" 
							class="frm_input half_input required" size="5"
							maxlength="5" placeholder="KH학생번호" required="required"><span class="frm_info">5자리 학생번호 입력</span>
						</li>
					</ul>
					<div class="btn_confirm">
						<input type="button" value="아이디 찾기" id="btn_findId" class="btn_submit"> 
					</div>
				</div>
				</form>
			</div>
			<div id="register_form" class="form_01">
				<form id="fregisterform" name="fregisterform" action="<%=request.getContextPath()%>/infoFindPwEnd" onsubmit="return fregisterform_submit(this);"
				method="post" autocomplete="off">
				<div class="tbl_frm01 tbl_wrap">
					<h2>비밀번호 찾기</h2>
					<ul>
						<li>
						    <input type="text" name="mb_id" value="" id="reg_mb_id"
							 class="frm_input half_input required" minlength="3"
							maxlength="20" placeholder="아이디" required="required"><span id="msg_mb_id"></span>
							<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
						</li>

						<li><input type="text" name="mb_khNum" value=""
							id="reg_mb_khNum" 
							class="frm_input half_input required" size="5"
							maxlength="5" placeholder="KH학생번호" required="required"><span class="frm_info">5자리 학생번호 입력</span>
						</li>
					</ul>
					<div class="btn_confirm">
						<input type="button" value="비밀번호 찾기" id="btn_submit" class="btn_submit"> 
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>

$("#btn_findId").click(function(){
	console.log($("#findId_khNum").val());
	$.ajax({
		url:'<%=request.getContextPath()%>/infoFindIdEnd',
		dataType:"json",
		data:{"Id":$("#findId_khNum").val()},
		type : "post",
		success : function(data){
			var setting = 'width=400px, height=400px, top=5, left=20, scrollbars=no';
			if(data==null){
				window.open("<%=request.getContextPath()%>/views/member/popup/findPopup.jsp?id=찾은아이디가 없습니다.","",setting);
			}else{
				window.open("<%=request.getContextPath()%>/views/member/popup/findPopup.jsp?id="+data['memberId'],"",setting);							
			}
		}
	});
});

</script>


<!-- 콘텐츠 끝 -->

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->