<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp" %>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>
	
<%
	String inputCode = (String)request.getAttribute("inputCode");	
	String[] outputCode = ((String)request.getAttribute("outputCode")).split(",");
	String type = (String)request.getAttribute("type");
%>
	
	
	<style>
		section#inqueryForm-container{ width: 100%; margin-bottom: 20px; margin-top: 9em; text-align: center;}
		div.inquery-form {width:55%; margin-left: auto; margin-right: auto;}
		input#inquery-title { width: 400px; font-size: 25px; padding: 2px;}
		textarea#inquery-content { resize: none; margin-left: auto; margin-right: auto; padding: 2px; width: 600px; }
		div#inputeditor,div#outputeditor { margin-top:20px; margin-left: auto; margin-right: auto; font-size: 15px; height: 600px; width : 600px; }
		input#submit { margin-top: 10px; }
		input#type { width: 75px; font-size: 20px; padding: 2px; text-align: center;}
		table.form-tbl { margin-left: auto; margin-right: auto; padding-bottom: 10px; }
		table.form-tbl h3{ width: 120px; text-align: center; margin-left: auto; margin-right: auto;}
		table.form-tbl td,tr{ text-align: left; }
		table.form-tbl td { margin-left: auto; margin-right: auto; border: 1px solid black; }
	</style>

	<section id="inqueryForm-container">
	<div class="inquery-form">
		<form action="<%=request.getContextPath() %>/inquery/inqueryWriteEndServlet?code-type="+<%= type %> method="post" enctype="multipart/form-data">
			<input type="hidden" name="writer" value='<%=((Member)session.getAttribute("loginMember")).getMemberId()%>'>
			<table class="form-tbl" style="border: 1px solid black;">
				<tr>
					<td>
						<h3>제목</h3>
					</td>
					<td>
						<input id="inquery-title" name="inquery-title" type="text"/>
					</td>
				</tr>
				<tr>
					<td>
						<h3>코드 종류</h3>
					</td>
					<td>
						<input id="code-type" name="code-type" type="text" value="<%= type %>">
					</td>
				</tr>
				<tr>
					<td>
						<h3>파일 업로드</h3>
					</td>
					<td>
						<input type="file" id="up_file" name="up_file"> 
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h3>질의내용</h3>
						<textarea id="inquery-content" name="inquery-content" rows="10" cols="25"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h3>입력 코드</h3>
						<div id="inputeditor"></div>
						<input type="hidden" id="inputCode" name="inputCode" value="">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<h3>출력 내용</h3>
						<div id="outputeditor"></div>
						<input type="hidden" id="outputCode" name="outputCode" value="">
					</td>
				</tr>
			</table>

			<input id="submit" type="submit" value="질문올리기">
			<input id="btn-cancel" type="button" value="되돌아가기" onclick="location.href='<%=request.getContextPath()%>/webCopiler/webCopilerView'">
		</form>
	</div>
	
	<script>
		//editor 입력코드와 출력 자료에 적용
		var inputCode = ace.edit('inputeditor');
		var outputCode = ace.edit('outputeditor'); 
		
		var jsbOpts = {
	        indent_size : 4
	    };
		
		inputCode.setTheme("ace/theme/monokai");
		inputCode.getSession().setMode("ace/mode/java");
		inputCode.getSession().setValue('<%= inputCode %>');
		
	    outputCode.getSession().setMode("ace/mode/java");
		
	    <%for(int i=0; i<outputCode.length; i++) {%>
			insertLine(outputCode,'<%=outputCode[i]%>');
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
	    
	    $("#up_file").change(function(){
	    	$.each($("#up_file")[0].files,function(i,item){
	    		var filetype = item.name.split(".")[item.name.split(".").length-1];
	    		if(!( filetype.toLowerCase() == $("#type").val().toLowerCase() ) ){
	    			alert("같은 종류의 코드파일을 업로드해주세요.");
	    			$("input[type=file]").val("");			  
	    		}
	    	});
	    });
	   console.log($("#code-type").val());
	</script>
	
	</section>

<%@ include file = "/views/common/footer.jsp" %>
