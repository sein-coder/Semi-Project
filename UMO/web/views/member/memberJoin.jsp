<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.umo.model.vo.Member"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<head>
 <style>
  #memberEnroll-container{
      margin-top:15%;
      width:100%;
      height:95%;
      
  }
       
        
        
        
        #stylized{
            border:solid 2px #b7ddf2;
            background:#ebf4fb;
            width:50%;
            height:85%;
            margin:10% 0 5% 20%;
        }
         #stylized h1 {
            font-size:18px;
            font-weight:bold;
            margin-bottom:8px;
            font-family:nanumgothic,dotum;
            text-align: center;
        
        }
       
        #stylized label{
            display:block;
            font-weight:bold;
            font-size:15px;
            width:110px;
            float:left;
            font-family:tahoma;
            margin-left:15%;
           
        }
        #stylized .label{
            color:#666666;
            display:block;
            font-size:13px;
            font-weight:normal;
           
            width:140px;
            font-family:dotum;
            letter-spacing:-1px;
        }
        #stylized input{
       
        font-size:12px;
       
        border:solid 1px #aacfe4;
        width:180px;
       height:22px;
        margin-left:-5px;
        margin-top:2px;
        margin-bottom:30px;
        }
         #joincheck{
        
        margin-left:35%;
        width:110px;
        height:31px;
        text-align:center;
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
       <br>
        <br>
        
        
        <label>멤버아이디
        <div class="label">Id</div>
        </label>
        <input type="text" name="id" id="id"  />
        
        
        <label>멤버비밀번호
            <div class="label">Pw</div>
            </label>
            <input type="text" name="password" id="password" />
            <label>멤버비밀번호확인
    <div class="label">pw2</div>
    </label>
    <input type="text" name="password2" id="password2"/>
    <div id="pwc" name="pwc"></div>
    <br>
    <br>
        <label>멤버이름
            <div class="label">Name</div>
            </label>
            <input type="text" name="name" id="name" />
            
            <label>멤버이메일
                <div class="label">Email</div>
                </label>
                <input type="text" name="email" id="email" />
                <!-- <span class="sp"><button id="emailidentify"  style="margin-left:73%; margin-top:-10%;" onclick="em_iden();">이메일인증</button> -->
                <br>
           <!--  <div id="emailidenwindow" style="width:150px; height:27px; border:1px solid black; margin-left:36%; margin-top:-3%;"></div> -->
            </span>
            <br>
            <label>멤버전화번호
                <div class="label">Phone</div>
                </label>
                <input type="text" name="phone" id="phone" /> 
            
                <label>멤버주소
                    <div class="label">Address</div>
                    </label>
                    <input type="text" name="address" id="address" /> 
            <br>
        
        <button type="submit" id="joincheck" formaction="<%=request.getContextPath()%>/memberJoinEnd">회원가입확인</button>
        <button type="button" id="cancel" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">취소</button>
        <br>
        <br>
        
        
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



