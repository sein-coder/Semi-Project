<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Board" %>

<% 
     Board gb=(Board)request.getAttribute("gb");
     String content=gb.getContent();
     content=content.replace("<br>", "\r\n");
%>

<%@ include file="/views/common/header.jsp" %>
<style>


</style>
    <div class="row body" style="margin-top: 150px">
        <div class="col-lg-2"></div>
	<div class="col-lg-8">
		<section id="notice-container">
			<h2 style="text-align: center;">반별게시판</h2>
			<form action="<%=request.getContextPath()%>/gradeUpdateEnd?no=<%=gb.getNo() %>" method="post" enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="<%=gb.getNo()%>">
				<table id="tbl-notice"
					class="table table-striped table-bordered table-hover">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="<%=gb.getTitle()%>" required /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer"
							value="<%=loginMember.getMemberId()%>" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><%if(gb.getOriginal_filename()!=null){ %>
					<input type="file" name="up_file"/>
					<input type="hidden" name="ori_file" value="<%=gb.getRenamed_filename()%>"/>
					<%if(gb.getRenamed_filename()==null){ %>
					<span id="fname"><%=gb.getOriginal_filename() %></span>
					<%} else{%>
					<span id="fname"><%=gb.getRenamed_filename() %></span>
					<%} %>
					<%}else{ %>
					<input type="file" name="up_file"/>
					<%} %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="5" cols="50" id="content" name="content"><%=content %></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="등록" /></td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	<div class="col-lg-2"></div>
    </div>
<script>

$(function(){
	$('[name=up_file]').change(function(){
		if($(this).val()!=""){
			$("#fname").hide();
		}else{
			$("#fname").show();
		}
	});
});
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
    var sHTML = '<img src="<%=request.getContextPath()%>/upload/grade/contentimg/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
$(this).submit(function(){
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
});
</script>
<%@ include file="/views/common/footer.jsp" %>