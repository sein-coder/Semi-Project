<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.umo.model.vo.Inquery,java.util.List,com.umo.model.vo.InqueryComment"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>


<% 
	Inquery inquery = (Inquery)request.getAttribute("inquery");
	List<InqueryComment> list = (List<InqueryComment>)request.getAttribute("list");

	String inputCode = "";
	String outputCode = "";
	if(inquery!=null && inquery.getInputCode()!=null && inquery.getOutputCode()!=null ) {
		inputCode = inquery.getInputCode().replaceAll("(\r\n|\r|\n|\n\r)", " ");
		outputCode = inquery.getOutputCode().replaceAll("(\r\n|\r|\n|\n\r)", ",");
	}else {
		inputCode = "입력 코드가 없습니다. ";
		outputCode = "출력 코드가 없습니다.";
	}
%>

<%@ include file = "/views/common/header.jsp" %>
	
<style>
	button.btn {margin-left: auto; margin-right: auto; margin-top: 5px; }
    section#inquery-container h2{text-align: center; margin-top: 10px;}
    table#tbl-inquery{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-inquery th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-inquery td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
<style>
	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both;} 
	table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:100%;}
	table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
	table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
	table#tbl-comment button.btn-reply{display:none;}
	table#tbl-comment tr:hover {background:lightgray;}
	table#tbl-comment tr:hover button.btn-reply{display:inline;}
	table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
	table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
	table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
	table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
	table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
	table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
</style>
	
	<section id="inquery-container">
		<div align="center">
		<h2 style="text-align: center;"><%= inquery.getBoard_Title()%></h2>
		<table id="tbl-inquery" style="border: 1px solid red; margin-left: auto; margin-right: auto; font-size: 18px;">
		<tr>
			<td colspan="5">
                <a href="<%=request.getContextPath() %>/scrap/scrapViewServlet?board_type=inquery&board_no=<%=inquery.getBoard_No()%>" target="_blank" id="ol_after_scrap" class="win_scrap">스크랩<br>
                <strong class="scrap"><i class="fa fa-thumb-tack" aria-hidden="true"></i></strong>
                </a>
            </td>
		</tr>	
			<tr>
				<th style="width: 10%;">
					<%= inquery.getBoard_No() %>
				</th>
				<th>
					<%= inquery.getCode_Type() %>
				</th>
				<th>
					작성일 : <%= inquery.getBoard_Date() %>
				</th>
				<th style="width: 20%;">
					조회수 : <%= inquery.getBoard_Count() %>
				</th>
			</tr>
			<tr>
				<td colspan="4">
					<%= inquery.getBoard_Contents() %>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<h3>입력 코드</h3>
					<div id="inputeditor"></div>
					<input type="hidden" id="inputCode" name="inputCode" value="">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<h3>출력 내용</h3>
					<div id="outputeditor"></div>
					<input type="hidden" id="outputCode" name="outputCode" value="">
				</td>
			</tr>
			<tr>
				<td style="width: 20%;">
					업로드 코드
				</td>
				<td colspan="3">
				<% if(inquery.getOriginal_FileName()!=null) { %>
					<a href="<%=request.getContextPath()%>/inquery/inqueryFileDownload?fileName=<%=inquery.getOriginal_FileName()%>">
						<img src="<%=request.getContextPath()%>/images/file.png" width="20px"/>
						<%=inquery.getOriginal_FileName() %>
					</a>
				<% } %>
				</td>
			</tr>
		</table>
		<button class="btn" onclick="location.href='<%= request.getContextPath() %>/inquery/inqueryBoard'">목록</button>
			<% if(loginMember!=null && loginMember.getMemberId().equals(inquery.getBoard_Writer())) { %>
				<button class="btn" onclick="location.href='<%= request.getContextPath() %>/inquery/inqueryUpdate?Board_No=<%=inquery.getBoard_No()%>'">수정</button>
				<button class="btn" onclick="location.href='<%= request.getContextPath() %>/inquery/inqueryDelete?Board_No=<%=inquery.getBoard_No()%>'">삭제</button>
			<% } %>
			
		<div id="comment-container">
			<div class="comment-editor">
				<form action="<%=request.getContextPath()%>/inqueryComment/insertComment" method="post" onsubmit="return fn_commentValidate();">
					<table style="margin-top:20px; margin-left: auto; margin-right: auto;">
						<tr>
							<td>
								<!-- 굳이 클라이언트에게 입력받을 필요가 없는 내용 -->
								<input type="hidden" name="boardRef" value="<%= inquery.getBoard_No() %>">
								<input type="hidden" name="boardCommentRef" value="0">
								<input type="hidden" name="boardCommentLevel" value="1">
								<input type="hidden" name="boardWriter" value="<%= loginMember!=null?loginMember.getMemberId():"" %>">
								<!-- 클라이언트에게 입력받아야하는 내용 -->
								<textarea style="min-height: 100px;" name="content" cols="60" rows="3"></textarea>
							</td>
							<td>
								<input type="submit" value="등록" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<table id="tbl-comment">
		<% if(!list.isEmpty()) { 
			for(InqueryComment comment : list) {
				if(comment.getComment_level()==1) {
		%>
			<tr class="level1">
				<td>
					<sub class="comment-writer"><%= comment.getComment_writer() %></sub>
					<sub class="comment-date"><%= comment.getComment_date() %></sub>
					<br>
					<%= comment.getComment_contents() %>
				</td>
				<td>
					<button class="btn-reply" value="<%=comment.getComment_no()%>">답글</button>
					<button class="btn-delete" value="<%=comment.getComment_no()%>">삭제</button>
				</td>				
			</tr>
		<%		} else { %> 
					<tr class="level2">
					<td>
						<sub class="comment-writer"><%= comment.getComment_writer() %></sub>
						<sub class="comment-date"><%= comment.getComment_date() %></sub>
						<br>
						<%= comment.getComment_contents() %>
					</td>
					<td>
						<button class="btn-reply" value="<%= comment.getComment_no() %>">답글</button>
					</td>				
				</tr>
		<% 		}
			} 
		} %>
		</table>
		</div>
		<script>
		
		//editor초기화
		var inputCode = ace.edit('inputeditor');
		var outputCode = ace.edit('outputeditor'); 
		
		var jsbOpts = {
	        indent_size : 4
	    };
		
		inputCode.setTheme("ace/theme/monokai");
		inputCode.getSession().setMode("ace/mode/java");
		inputCode.getSession().setValue('<%=inputCode%>');
		
	    outputCode.getSession().setMode("ace/mode/java");
		
	    <%for(int i=0; i<outputCode.split(",").length; i++) {%>
			insertLine(outputCode,'<%=outputCode.split(",")[i]%>');
	    <%}%>
	    
	    inputCode.getSession().setValue(js_beautify(inputCode.getSession().getValue(), jsbOpts));
	    outputCode.getSession().setValue(js_beautify(outputCode.getSession().getValue(), jsbOpts));
	    
	    inputCode.setReadOnly(true);
	    outputCode.setReadOnly(true);
	    
	    var lines = inputCode.session.doc.getAllLines()
	    $("#inputeditor").height((lines.length * 18)+5);
	    $("#outputeditor").height((lines.length * 18)+5);
	    
	    commitChanges(inputCode,$("#inputCode"));
	    commitChanges(outputCode,$("#outputCode"));
	    
	    function commitChanges(editor, codetag) {
	    	codetag.val(editor.getSession().getValue());
	    }
	    
	    function insertLine(editor,text){
	    	editor.getSession().insert({
		    	row : editor.getSession().getLength(),
		    	column : 0
		    }, "\n" + text)
	    };
	    
	    //댓글 관련 함수
	    $(function() {
	    	$("[name=content]").focus(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    	})
	    	$(".btn-reply").click(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    		var tr = $("<tr>");
	    		var html="<td style='display:none; text-align:left;' colspan='2'>";
	    		html+= "<form action='<%=request.getContextPath()%>/inqueryComment/insertComment' method='post'>";
	    		html+=  '<input type="hidden" name="boardRef" value="<%= inquery.getBoard_No() %>">';
				html+=	'<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'">';
				html+=	'<input type="hidden" name="boardCommentLevel" value="2">';
				html+=	'<input type="hidden" name="boardWriter" value="<%= loginMember!=null?loginMember.getMemberId():"" %>">';
				html+=  '<textarea name="content" cols="60" rows="3"></textarea>';
				html+=  '<input type="submit" value="등록" />';
				html+=  '</form></td>';
				tr.html(html);
				tr.insertAfter($(this).parent().parent()).children("td").show().slideDown(800);
				$(this).off('click') //실행후 이벤트 중단
	    	});
	    	
	    	$(".btn-delete").click(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    		
	    		location.href="<%=request.getContextPath()%>/inqueryComment/deleteComment?boardRef=<%=inquery.getBoard_No()%>&boardCommentNo="+$(this).val()+"";
	    	});
	    	
	    });
	    
	    function fn_commentValidate(){
	    	if(<%=loginMember==null%>){
	    		fn_loginAlert();
	    	}
	    	var len = $("[name=content]").val().trim().length;
	    	if(len<1){
	    		alert("내용을 입력하세요.")
	    		return false;
	    	}
	    	return true;
	    }
	    
	    function fn_loginAlert(){
	    	alert("로그인 후 이용하세요!");
	    	$("[name=content]").blur();
	    	location.href="<%=request.getContextPath()%>/";
	    }
	    
	    
		</script>
		
	</section>

<%@ include file = "/views/common/footer.jsp" %>
