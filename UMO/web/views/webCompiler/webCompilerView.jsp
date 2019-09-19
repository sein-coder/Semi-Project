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
		select#language-choice { position: relative; margin-top: 5px; margin-left: auto; padding-top: 5px; padding-bottom: 5px;}
		select#language-choice option { font-size: 18px; }
		button#btn-compiler{ font-size: 20px; color: red; padding-left: 15%; padding-right: 15%;}
		div.title { font-size: 1.67em; font-weight: bold; text-align: center; }
	    div#editor,div#result { margin-top:20px; margin-left: auto; margin-right: auto; font-size: 15px; height:300px; width: 700px; border: 1px solid black;}
	    .as-console-wrapper { display: none !important; }
	    div.result { text-align: left; margin-left: 30%;}
	    div.ace_scroller { width: 680px; }
	    button#question { position: absolute; top: 10em; right: 38.5em; }
	</style>
	
	<section id="webCompiler-container">
		<button id="question" onclick="fn_question()">질의하기</button>
		<form action="<%= request.getContextPath() %>/webCompiler/codeInput" method="post">
		<div id="language-container">
		언어 선택 :
		<select name="language-choice" id="language-choice">
			<option value="Java" selected>Java</option>
			<option value="HTML">HTML</option>
			<option value="javaScript">javaScript</option>
		</select>
		</div>
		
		<div class="title">코드 입력 창</div>
  		<div id="editor"></div>
		<br>
		<input type="hidden" id="inputCode" name="inputCode" value="">
				
		</form>
		<button id="btn-compiler" onclick="compile();">C o m p i l e r</button>
		<input type="hidden" id="outputCode" name="outputCode" value="">
		
		<div id="result" class="result" style="display: none;"></div>
	</section>
	<script>
	//question button event
		function fn_question() {
			if($("#result").css("display") == "none") {
				alert("컴파일 후에 질의할 수 있습니다.");
			}
			else if($("#result").css("display") == "block"){
    			location.href="<%=request.getContextPath()%>/question/questionWriteServlet?inputCode="+encodeURI($('#inputCode').val())+"&outputCode="+encodeURI($('#outputCode').val());
			//encodeURI(문자열) : 특수문자가 포함된 문자열 인코딩처리
			}
		}
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
	    editor.getSession().setValue(code);
	    commitChanges();
	    
	    var resulteditor = ace.edit('result');
	    resulteditor.getSession().setMode("ace/mode/java");
	    
	    // Main Logic
	    setTimeout(formatCode, 500); // Format sample Java after 1 second.
	
	    // Functions
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
    
    	function compile(){
    		var h = 0;
    		var result = "";
    		formatCode();
    		$.ajax({
    			url:"<%=request.getContextPath()%>/webCompiler/codeInput",
				type:"post", //get이든 post든 무상관
				data:{"inputCode":$("#inputCode").val(),
					"language-choice":$("#language-choice").val()},
				dataType:"text",
				success:function(data){
					if($("#result").css("display") == "none") {
						$("#result").show('slow');
						$("html").animate({scrollTop : ($("#result").offset().top)}, 500);
					}else{
						$("html").animate({scrollTop : ($("#result").offset().top)}, 500);
					}
					var CodeResult = data.substring(1,data.length-1).split(",");
					for(var i = 0 ; i<CodeResult.length-1; i++){
						result += CodeResult[i].split(",")+"\n";
					}
					resulteditor.getSession().setValue(result);
					$("#outputCode").val(resulteditor.getSession().getValue());
		    		resulteditor.setReadOnly(true);
				}
    		});
    	}

	</script>

<%@ include file = "/views/common/footer.jsp" %>