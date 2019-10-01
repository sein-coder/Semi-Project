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
				<span title="정보수정">정보수정</span>
			</h2>

			<!-- 회원정보 입력/수정 시작 { -->


			<form id="fregisterform" name="fregisterform" action="<%=request.getContextPath()%>/infoUpdateEnd" onsubmit="return fregisterform_submit(this);"
				method="post" autocomplete="off">
				<div id="register_form" class="form_01">
					<div>
						<h2>사이트 이용정보 입력</h2>
						<ul>
							<li>
							    <input type="text" name="mb_id" value="<%=m.getMemberId() %>" id="reg_mb_id"
								 class="frm_input half_input required" minlength="3"
								maxlength="20" placeholder="아이디" readonly><span id="msg_mb_id"></span>
								<span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
							</li>
							<li>
							    <input type="type" name="mb_password"
								id="reg_mb_password" 
								class="frm_input half_input required" minlength="3" value=""
								maxlength="20" placeholder="비밀번호">
								<input
								type="password" name="mb_password_re" id="reg_mb_password_re"
								 class="frm_input half_input right_input required"
								minlength="3" maxlength="20" placeholder="비밀번호 확인" value=""></li>
						</ul>
					</div>

					<div class="tbl_frm01 tbl_wrap">
						<h2>개인정보 입력</h2>

						<ul>
							<li><input type="text" name="mb_name" id="reg_mb_name" 
								value="<%=m.getMemberName()%>"  class="frm_input half_input required "
								size="10" placeholder="이름"></li>
							
							<li><input type="hidden" name="mb_nick_default" value="">
								<input type="text" name="mb_class" value="" id="reg_mb_nick"
								 class="frm_input required nospace half_input"
								size="10" maxlength="20" placeholder="반"> <span
								id="msg_mb_nick" value="<%=m.getClass1()%>"></span> </li>

							<li><input type="text" name="mb_email" value="<%=m.getEmail() %>"
								id="reg_mb_email" 
								class="frm_input email half_input required" size="70"
								maxlength="100" placeholder="E-mail"></li>
							<li><input type="text" name="mb_khNum" value="<%=m.getKhno() %>"
								id="reg_mb_khNum" 
								class="frm_input half_input required" size="5"
								maxlength="5" placeholder="KH학생번호"><span class="frm_info">5자리 학생번호 입력</span></li>

						</ul>
					</div>
				</div>
				<div class="btn_confirm">
					<input type="submit" value="정보수정" id="btn_submit" class="btn_submit"> 
					<a href="<%=request.getContextPath()%>/index.jsp" class="btn_cancel">취소</a>
				</div>
			</form>
		</div>
	</div>
	<script>

	
	
	</script>
</div>


<!-- 콘텐츠 끝 -->

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->