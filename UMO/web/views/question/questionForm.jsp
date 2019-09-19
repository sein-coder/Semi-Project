<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp" %>
	
	<style>
		section#questionForm-container{ width: 100%; margin-bottom: 20px; height: 20em; margin-top: 9em;}
		div.question-form {width:35%; margin-left: auto; margin-right: auto; border: 1px solid red;}
		input#question-title { width: 400px; }
		textarea#question-content { resize: none; width: 500px; }
	</style>
	
	<section id="questionForm-container">
	<div class="question-form">
		<form action="">
			제목<input id="question-title" name="question-title" type="text"/>
			질의내용
			<textarea id="question-content" name="question-content" rows="10" cols="30">
			
			</textarea>
		</form>
	</div>
	</section>

<%@ include file = "/views/common/footer.jsp" %>
