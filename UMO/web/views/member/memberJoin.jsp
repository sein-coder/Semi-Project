<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>


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
				<span title="회원 가입">회원 가입</span>
			</h2>

			<!-- 회원정보 입력/수정 시작 { -->


			<form id="fregisterform" name="fregisterform" action="<%=request.getContextPath()%>/memberJoinEnd" onsubmit="return fregisterform_submit(this);"
				method="post" autocomplete="off">
				<div id="register_form" class="form_01">
					<div>
						<h2>사이트 이용정보 입력</h2>
						<ul>
							<li>
							    <input type="text" name="mb_id" value="" id="reg_mb_id"
								 class="frm_input half_input required" minlength="3"
								maxlength="20" placeholder="아이디"><span id="msg_mb_id"></span>
								<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
							</li>
							<li>
							    <input type="password" name="mb_password"
								id="reg_mb_password" 
								class="frm_input half_input required" minlength="3"
								maxlength="20" placeholder="비밀번호">
								<input
								type="password" name="mb_password_re" id="reg_mb_password_re"
								 class="frm_input half_input right_input required"
								minlength="3" maxlength="20" placeholder="비밀번호 확인"></li>
						</ul>
					</div>

					<div class="tbl_frm01 tbl_wrap">
						<h2>개인정보 입력</h2>

						<ul>
							<li><input type="text" name="mb_name" id="reg_mb_name" 
								value=""  class="frm_input half_input required "
								size="10" placeholder="이름"></li>
							
							<li><input type="hidden" name="mb_nick_default" value="">
								<input type="text" name="mb_nick" value="" id="reg_mb_nick"
								 class="frm_input required nospace half_input"
								size="10" maxlength="20" placeholder="닉네임"> <span
								id="msg_mb_nick"></span> <span class="frm_info"> 공백없이
									한글,영문,숫자만 입력 가능 </span></li>
							<li><input type="text" name="mb_khNum" value=""
								id="reg_mb_khNum" 
								class="frm_input half_input required" size="5"
								maxlength="5" placeholder="KH학생번호"><span class="frm_info">5자리 학생번호 입력</span></li>
							<li><input type="text" name="mb_email" value=""
								id="reg_mb_email" 
								class="frm_input email half_input required" size="70"
								maxlength="100" placeholder="E-mail"></li>
						</ul>
					</div>
				</div>
				<div class="btn_confirm">
					<input type="submit" value="회원가입" id="btn_submit" class="btn_submit"> 
					<a href="<%=request.getContextPath()%>/index.jsp" class="btn_cancel">취소</a>
				</div>
			</form>
		</div>
	</div>
	
<script>
/* var password2=document.getElementById("password2");
var id=document.getElementById("id");
var password=document.getElementById("password");
var name=document.getElementById("name");
var email=document.getElementById("email");
var frm=document.frm;
var pwc=document.pwc;
var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
//
var reg3=/^[가-힣]{2,4}$/; */
</script>


<!-- 콘텐츠 끝 -->

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->