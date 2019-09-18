<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/placeholder.js"></script>
<head>
<style>
fieldset,form,label {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
#loginscreen{
margin:20% 0 0 25%;
border:4px solid green;
width:50%;
height:75%;
}

/* HTML5 display-role reset for older browsers */


body {
	line-height: 1;
}









/* Main CSS */
* { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; }

body {
	font-family: sans-serif;
	width:100%;
	height:80%;
	background-color: seashell;
	
}

#slick-login {
	width: 220px;
	height: 155px;
	position: absolute;
	left: 50%;
	top: 30%;
	margin-left: -110px;
	margin-top: 5px;

	
}

#slick-login label {
	/* display: none; */
	font-size:26px;
}

.placeholder {
    color: #444;
}

#slick-login input[type="text"],#slick-login input[type="password"] {
	width: 100%;
	height: 40px;
	position: relative;
	margin-top: 10px;
	font-size: 16px;
	
	
	border: 1px solid rgba(0, 0, 0, .49);

	padding-left: 10px;
	
	
	border-radius: 10px;



	
	box-shadow: inset 0px 2px 0px #d9d9d9;

	
}



/* #slick-login input:first-child {
	margin-top: 0px;
} */

#slick-login input[type="submit"] {
	width: 100%;
	height: 50px;
	margin-top: 7px;
	color: black;
	font-size: 18px;
	font-weight: bold;
	
	outline: none;
	border: 1px solid tan;

	
	background-clip: padding-box;
	border-radius: 6px;

	
}


</style>

</head>
<body>

	<div id="loginscreen">
    <fieldset>
<form id="slick-login"  >
<h1 style="text-align:center">로그인</h1>
<label for="id" >아이디</label><input type="text" name="userId" class="placeholder" placeholder="아이디작성하세요">
<label for="password">password</label><input type="password" name="password" class="placeholder" placeholder="password">
<input type="submit" value="Log In" style="margin-top:13px;" formaction="<%=request.getContextPath()%>/loginCh">

<input type="submit" id="hweonJoin" style="width:100%; height:50px; margin-top:20px;" onclick="memberJoin()" value="회원가입" formaction="<%=request.getContextPath()%>/memberJoin">
</form>
</fieldset>
</div>



		
</body>



