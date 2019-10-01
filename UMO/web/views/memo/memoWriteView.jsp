<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지쓰기</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<script src="https://use.fontawesome.com/3b5ffe2c0a.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ page import="com.umo.memo.model.vo.Memo" %>
<% 
	String userId = request.getAttribute("userId").toString();
%>
</head>
<body>
	<div id="memo_write" class="new_win">
		<h1 id="win_title">
			<i class="fa fa-envelope-o" aria-hidden="true"></i> 쪽지 보내기
		</h1>
		<div class="new_win_con">
			<ul class="win_ul">
				<li><a href="<%=request.getContextPath()%>/memoListServlet?userId=<%= userId %>">받은쪽지</a></li>
				<li><a href="<%=request.getContextPath()%>/sendMemoListServlet?userId=<%= userId %>">보낸쪽지</a></li>
				<li class="selected"><a href="<%=request.getContextPath()%>/memoWriteServlet?userId=<%= userId %>">쪽지쓰기</a></li>
			</ul>

			<form name="fmemoform"
				action="<%= request.getContextPath() %>/memoWriteEndServlet"
				onsubmit="" method="post"
				autocomplete="off">
				<div class="form_01">
					<ul>
						<li><input type="text" name="me_recv_mb_id" value=""
							id="me_recv_mb_id" required
							class="frm_input full_input required" size="47"
							placeholder="받는 회원아이디"></li>
						<li><textarea
								name="me_memo" id="me_memo" required class="required"></textarea>
						</li>
					</ul>
					<input type="hidden" name="userId" id="userId" value="<%= userId %>">
				</div>

				<div class="win_btn">
					<button type="button" value="보내기" id="btn_submit" class="btn_submit">보내기</button>
					<button type="button" onclick="window.close();" class="btn_close">창닫기</button>
				</div>
			</form>
		</div>

	</div>

</body>

<script>
	$("#btn_submit").click(function(){
		$.ajax({
			url : "./memoWriteEndServlet", 
			dataType:"text",
			data : {"me_recv_mb_id":$("#me_recv_mb_id").val(),
				"me_memo":$("#me_memo").val(),
				"userId":$("#userId").val()},
			type : "post", 
			success : function(data){
				console.log(data);
				if(data>0){
					alert("보내기 성공");
					location.href='<%=request.getContextPath()%>/sendMemoListServlet?userId=<%= userId %>'
				}else{
					alert("보내기 실패");
					location.href='<%=request.getContextPath()%>/memoWriteServlet?userId=<%= userId %>'
				}
			}
		});
	});
</script>

</html>