<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<%Member m=(Member)request.getAttribute("member");


%>
 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>


<head>
<style>

/* Main CSS */
/* * { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; } */

body {
	font-family: sans-serif;
	width:100%;
	height:100%;
	background-color: F0F8FF;
	/* border:2px solid blue; */
	/* line-height: 2; */
	padding-top:15%;
	padding-bottom: 25%;
	
}
 #loginscreen{
	
margin-left:23%;
padding-right:3%;
margin-top:10%;
margin-bottom: 300px;
border:4px solid  mintcream;
width:50%;
height:85%;
text-align:center;
overflow:hidden;

}

#slick-login {
	width: 210px;
	height: 155px;
	/* position: absolute; */
	

	
	
margin:15% 0 20% 28%;
	
}

#slick-login label {
	/* display: none; */
	font-size:26px;
	
}

.placeholder {
    color: green;
}

#slick-login input[type="text"],#slick-login input[type="password"] {
	width: 86%;
	height: 40px;
	position: relative;
	margin-top: 10px;
	font-size: 16px;

	
	border: 1px solid dashed;

	padding-left: 10px;
	
	
	border-radius: 10px;



	
	box-shadow: inset 0px 2px 0px #d9d9d9;

	
}

#slick-login input[type="submit"] {
	width: 86%;
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
   
<form id="slick-login" name="login" method="post"  >
<h1 >로그인</h1>
<label for="id">아이디</label><input type="text" name="userId" class="placeholder" placeholder="아이디작성하세요">
<label for="password">password</label><input type="password" name="pw" class="placeholder" placeholder="password">

<input type="submit" id="logcheck" value="Log In" style="margin-top:13px;" onclick="return logincheck();"  formaction="<%=request.getContextPath()%>/loginCh?"  >


<input type="submit" id="hweonJoin"   value="회원가입" formaction="<%=request.getContextPath()%>/memberJoin">

</form>
 
</div>

<script>
 
var id=$("input[name='userId']");
var pw=$("input[name='password']");

function logincheck(){
if(id.val().length<4||id.val().length>11)
	{
	alert("4자이상입력 11자이하입력");
	
	return false;
	}


	if(pw.val().length<6||pw.val().length>15)
		{
		alert("비밀번호6글자이상입력 15글자이하입력");
		return false;
		}
	
	
	
}

</script>

		
</body>



