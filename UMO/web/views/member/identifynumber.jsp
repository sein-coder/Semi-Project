<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.kh.model.vo.Member"%> --%>

<style>
form{

width:30%;
height:50%;
margin-top:20%;
display:inline-block;
}
#identinput{
width:20%;
height:30%;

}
button{
display:inline-block;
width:320px;
height:30%;
}
</style>



<body>

<form id="form" >
<h3>인증번호를 입력하십시오</h3>
<input type="text" name="number" id="number"/>
<button onclick="numbercheck();"></button>
<div id="identinput"></div>

</form>
<script>
function numbercheck(){
	alert("확인");
	
}

</script>


</body>