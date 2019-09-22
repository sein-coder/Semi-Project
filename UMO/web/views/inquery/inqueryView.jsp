<%@page import="com.umo.model.vo.Inquery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>


<% 
	Inquery inquery = (Inquery)request.getAttribute("inquery");
	String inputCode = "";
	String outputCode = "";
	if(inquery.getInputCode()!=null && inquery.getOutputCode()!=null) {
		inputCode = inquery.getInputCode().replaceAll("(\r\n|\r|\n|\n\r)", " ");
		outputCode = inquery.getOutputCode().replaceAll("(\r\n|\r|\n|\n\r)", ",");
	}
	else {
		inputCode = "입력 코드가 존재하지 않습니다.";
		outputCode = "출력 코드가 존재하지 않습니다.";
	}
%>

<%@ include file = "/views/common/header.jsp" %>
	
<style>
	section#inquery-container { width:600px; margin-top: 170px; margin-bottom: 50px; margin-left: auto; margin-right: auto; text-align:center; }
	table#tbl-inquery{width:100%; border:1px solid black; border-collapse:collapse; }
    table#tbl-inquery th, table#tbl-inquery td {border:1px solid; padding: 5px 0; text-align:center;} 
	div#inputeditor,div#outputeditor { font-size: 15px; }
	button.btn {margin-left: auto; margin-right: auto; margin-top: 5px; } 
</style>
	
	<section id="inquery-container">
		<h2 style="text-align: center;"><%= inquery.getBoard_Title()%></h2>
		<table id="tbl-inquery" style="border: 1px solid red; margin-left: auto; margin-right: auto; font-size: 18px;">
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
		<script>
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
		</script>
		
	</section>

<%@ include file = "/views/common/footer.jsp" %>
