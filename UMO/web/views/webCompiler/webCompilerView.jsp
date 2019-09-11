<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp" %>
	
	<style>
		section#webCompiler-container{ width: 100%; text-align: center; margin-bottom: 20px;}
		section#webCompiler-container textarea#inputcode{ resize: none; width: 730px; font-size: 25px; margin-left: auto; margin-right: auto;}
		div#language-container { text-align:left; margin-right: 62%; margin-left: 31%; margin-top: 7%;}
		select#language-choice { position: relative; margin-left: auto; font-size: 18px; }
		select#language-choice option { font-size: 18px; }
		input#btn-compiler{ font-size: 20px; color: red; padding-left: 16%; padding-right: 16%;}
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
		<h3 style="display: inline; position: relative;">코드 입력 부분</h3>
		<textarea name="inputcode" id="inputcode" rows="15" cols="60">public class Code { public static void main(String args[]){		} }</textarea>
		<br>
		<input id="btn-compiler" type="submit" value="C o m p i l e r">
		</form>
		
<!-- 		<h3>코드 출력부분</h3>
		<div id="code-output">
			<textarea rows="10" cols="100"></textarea>
		</div> -->
		
	</section>
	<script>
		$(function(){
			$("#language-choice").change(function(){
				if($(this).val()=="Java"){
					var code = 'public class Code { public static void main(String args[]){		} }';
					$("#inputcode").val(code);
				}
			})
		})
		
	</script>

<%@ include file = "/views/common/footer.jsp" %>