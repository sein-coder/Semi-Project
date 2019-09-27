<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<head>
 <style>
  #memberEnroll-container{
      margin-top:10%;
      width:100%;
      height:100%;
      
  }
       
        
        
        
        #stylized{
            border:2px solid  #b7ddf2;
            background:#ebf4fb;
            width:47%;
            height:100%;
            margin-left:20%;
            padding-left:15%;
            text-align:center;
            
        }
         #stylized h1 {
            font-size:18px;
            font-weight:bold;
            margin-bottom:20px;
            font-family:nanumgothic,dotum;
            text-align: center;
        margin-left:-31%;
        }
       
        #stylized label{
        	display:flex;
        	text-align:center;
        	margin-left:3%;
        	margin-bottom:7%;
            font-weight:bold;
            font-size:15px;
            border:1px solid black;
            width:65%;
            font-family:tahoma;
            
           
        }
        #stylized .label{
            color:#666666;
            font-size:13px;
            font-weight:normal;
           
            font-family:dotum;
            letter-spacing:-1px;
        }
        #stylized input{
       
        font-size:15px;
       
        border:solid 1px #aacfe4;
        width:180px;
       height:30px;
        }
         #joincheck{
        
        margin-left:-20%;
        width:110px;
        height:31px;
        
        line-height:23px;
        background-color:lightslategray;
        color:black;
        font-size:11px;
        font-weight:bold;
        font-family:tahoma;
        } 
        </style>
</head>
<body>



<%@ include file="/views/common/header.jsp"%>






<br>

<section id="memberEnroll-container">
  <div id="stylized" class="myform">
        <form id="form" name="frm" method="post" onsubmit="return validate();" action="<%=request.getContextPath()%>/index.jsp">
        <h1>회원가입</h1>
        <label>아이디
        <div class="label">Id</div>
        <input type="text" name="id" id="id"  />
        </label>
        <label>비밀번호
            <div class="label">Pw</div>
            <input type="text" name="pw" id="pw" />
            </label>
            <label>비밀번호확인
    <div class="label">pw2</div>
    
    <input type="text" name="password2" id="password2"/>
    </label>
    <div id="pwc" name="pwc"></div>
        <label>이름
            <div class="label">Name</div>
            <input type="text" name="name" id="name" />
            </label>
            <label>반
                <div class="label">반</div>
                
                <input type="text" name="class1" id="class1" /> 
            </label>
            <label>회원번호
                <div class="label">회원번호</div>
                
                <input type="text" name="khno" id="khno" />
                </label>
            
            <label>이메일
                <div class="label">Email</div>
                
                <input type="text" name="email" id="email" />
                </label>
                
                <!-- <span class="sp"><button id="emailidentify"  style="margin-left:73%; margin-top:-10%;" onclick="em_iden();">이메일인증</button> -->
           <!--  <div id="emailidenwindow" style="width:150px; height:27px; border:1px solid black; margin-left:36%; margin-top:-3%;"></div> -->
            </span>
            
               
        <button type="submit" id="joincheck" formaction="<%=request.getContextPath()%>/memberJoinEnd">회원가입확인</button>
        <button type="button" id="cancel" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">취소</button>
        
        
        </form>
        </div>
</section>

<script>
var password2=document.getElementById("password2");
var id=document.getElementById("id");
var password=document.getElementById("password");
var name=document.getElementById("name");
var email=document.getElementById("email");
var frm=document.frm;
var pwc=document.pwc;
var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
//
var reg3=/^[가-힣]{2,4}$/;

function validate(){

if(!reg.test(id.value)){
	
    alert("아이디는 4자이상 10자이하를 입력해야합니다.");
    return false;
}
 if(!reg2.test(password.value)){
     alert("비밀번호는 5자이상 12자이하를 입력해야합니다.");
     return false;
 }
if(!reg3.test(name.value())){
    alert("한글이름만 되며 2글자이상이여야 합니다.");
    return false;
}


frm.action="/index.jsp";

}



function cancel(){
    location.href="<%=request.getContextPath()%>/index.jsp";
}


<%-- function em_iden(){
	
	frm.action="<%=request.getContextPath()%>/memberLogin";
	frm.submit();
} --%>
</script>

<br>


<%@ include file="/views/common/footer.jsp"%>
</body>



