<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp" %>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>
	
	
	<style>
		section#questionForm-container{ width: 100%; margin-bottom: 20px; margin-top: 9em; text-align: center;}
		div.question-form {width:50%; margin-left: auto; margin-right: auto; border: 1px solid red;}
		input#question-title { width: 600px; margin-left: auto; margin-right: auto; font-size: 25px; padding: 2px;}
		textarea#question-content { resize: none; margin-left: auto; margin-right: auto; padding: 2px; width: 600px;}
		div#inputCode,div#outputCode { margin-top:20px; margin-left: auto; margin-right: auto; font-size: 15px; height: 600px; width : 600px; border: 1px solid black;}
		input#submit { margin-top: 10px; }
	</style>

	<section id="questionForm-container">
	<div class="question-form">
		<form action="">
			제목<input id="question-title" name="question-title" type="text"/>
			질의내용<textarea id="question-content" name="question-content" rows="15" cols="25"></textarea>
			
			<div id="inputCode"></div>
			
			<div id="outputCode"></div>
			
			<input id="submit" type="submit" value="질문올리기">
			<input id="btn-cancel" type="button" value="되돌아가기">
		</form>
	</div>
	
	<script>
		//editor 입력코드와 출력 자료에 적용
		var inputCode = ace.edit('inputCode');
		var outputCode = ace.edit('outputCode'); 
		
		var code = 'public class Test {public static void main(String[] args) throws Exception {System.out.print("Hello world");}}';
		var jsbOpts = {
	        indent_size : 4
	    };
		
		inputCode.setTheme("ace/theme/monokai");
		inputCode.getSession().setMode("ace/mode/java");
		inputCode.getSession().setValue(code);
		
	    outputCode.getSession().setMode("ace/mode/java");
	    outputCode.getSession().setValue(code);
	    
	    inputCode.getSession().setValue(js_beautify(inputCode.getSession().getValue(), jsbOpts));
	    outputCode.getSession().setValue(js_beautify(outputCode.getSession().getValue(), jsbOpts));
	    
	    inputCode.setReadOnly(true);
	    outputCode.setReadOnly(true);
	    
	    var lines = inputCode.session.doc.getAllLines()
	    $("#inputCode").height((lines.length * 18)+5);
	    $("#outputCode").height((lines.length * 18)+5);
	    
	</script>
	
	</section>

<%@ include file = "/views/common/footer.jsp" %>
