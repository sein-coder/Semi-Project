<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp" %>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>
	
	
	<style>
		section#webCompiler-container{ width: 100%; text-align: center; margin-bottom: 20px;}
		section#webCompiler-container textarea#inputcode{ resize: none; width: 730px; font-size: 25px; margin-left: auto; margin-right: auto;}
		div#language-container { text-align:left; margin-right: 62%; margin-left: 31%; margin-top: 7%;}
		select#language-choice { position: relative; margin-left: auto; font-size: 18px; }
		select#language-choice option { font-size: 18px; }
		input#btn-compiler{ font-size: 20px; color: red; padding-left: 16%; padding-right: 16%;}
		div.title { font-size: 1.67em; font-weight: bold; text-align: center; }
	    div#editor { margin-top:20px; margin-left: auto; margin-right: auto; font-size: 15px; height: 500px; width: 750px;}
	    .as-console-wrapper { display: none !important; }
	</style>
	
	<section id="webCompiler-container">
		<h2>Web Compiler</h2>
		<form action="<%= request.getContextPath() %>/webCompiler/codeInput" method="post">
		<div id="language-container">
		언어 선택 :
		<select name="language-choice" id="language-choice">
			<option value="Java">Java</option>
			<option value="HTML">HTML</option>
			<option value="javaScript">javaScript</option>
		</select>
		</div>
		
		<div class="title">코드 입력 창</div>
  		<div id="editor"></div>
		<br>
		<input type="hidden" id="inputCode" name="inputCode" value="">
		<input id="btn-compiler" type="submit" value="C o m p i l e r">
		
		</form>
		
		
	</section>
	<script>
	//Ace Editor Logic
		var editor = ace.edit('editor');
		var code = 'public class Test {public static void main(String[] args) throws Exception {System.out.print("Hello world");}}';
	    var inputCode = $("#inputCode");
	    inputCode.val(code);
		var jsbOpts = {
	        indent_size : 4
	    };
	
	    editor.setTheme("ace/theme/monokai");
	    editor.getSession().setMode("ace/mode/java");
	    syncEditor();
	
	    // Main Logic
	    setTimeout(formatCode, 500); // Format sample Java after 1 second.
	
	    // Functions
	    function syncEditor() {
	    	editor.getSession().setValue(code);
	    }
	    function commitChanges() {
	    	inputCode.val(editor.getSession().getValue());
	    }
	    function formatCode() {
	    	var session = editor.getSession();
	    	session.setValue(js_beautify(session.getValue(), jsbOpts));
	    }
    //언어선택시 Editor화면 전환
	    $(function(){
			$("#language-choice").change(function(){
				if($(this).val()=="Java"){
					var code = 'public class Test {public static void main(String[] args) throws Exception {System.out.print("Hello world");}}';
					var editor = ace.edit('editor');
					editor.getSession().setValue(code);
					setTimeout(formatCode, 500);
				}
			});
			
			$("#editor").keyup(function(){
				commitChanges();				
			});
		});
	</script>

<%@ include file = "/views/common/footer.jsp" %>