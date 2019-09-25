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
        	margin-bottom:2%;
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
        
        #idcheck{
        width:45%;
        height:5%;
        margin-bottom:2%;
        }
        
        #pwc{
        width:45%;
        height:5%;
        margin-bottom:3%;
        }
        
        #namecheck{
        width:40%;
        height:5%;
        margin-bottom:3%;
        }
        
        #nicknamecheck{
        width:45%;
        height:5%;
        border:4px solid red;
        margin-left:30px;
        }
        #emailcheck{
        width:50%;
        height:3%;
        }
        </style>
</head>
<body>



<%@ include file="/views/common/header.jsp"%>






<br>

<section id="memberEnroll-container">
  <div id="stylized" class="myform">
        <form id="form" name="frm" method="post"  action="<%=request.getContextPath()%>/index.jsp">
        <h1>회원가입</h1>
        <label>아이디
        <div class="label">Id</div>
        <input type="text" name="id" id="id"  />
        
        </label>
       
        <div id="idcheck"></div>
        
        <label>비밀번호
            <div class="label">Pw</div>
            <input type="password" name="pw" id="password" />
            </label>
            <label>비밀번호확인
    <div class="label">pw2</div>
    
    <input type="password" name="pw2" id="password2"/>
    </label>
    <div id="pwc" name="pwc"></div>
        <label>이름
            <div class="label">Name</div>
            <input type="text" name="name" id="name" />
            </label>
            <div id="namecheck"></div>
            <label>닉네임
            <div class="label">NickName</div>
            <input type="text" name="nickname" id="nickname"/>
            </label>
            <div id="nicknamecheck"></div>
            <label>이메일
                <div class="label">Email</div>
                
                <input type="text" name="email" id="email" />
                
                </label>
                <span> <button  onclick="identify();" style="">인증번호</button>
           
             </span> 
             <div id="emailcheck"></div>
            <label>전화번호
                <div class="label">Phone</div>
                
                <input type="text" name="phone" id="phone" /> 
            </label>
            <div id="phonecheck" style="width:30px; height:5%;"></div>
                <label>주소
                    <div class="label">Address</div>
                    
                    <input type="text" name="address" id="address" /> 
        </label>
       
        <button type="submit" id="joincheck" formaction="<%=request.getContextPath()%>/memberJoinEnd">회원가입확인</button>
        <button type="button" id="cancel" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">취소</button>
        
        
        </form>
        </div>
</section>


<%-- var password2=document.getElementById("pw2");
var id=document.getElementById("id");
var password=document.getElementById("pw");
var name=document.getElementById("name");
var email=document.getElementById("email");
var phone=document.getElementById("phone");
var frm=document.frm;
var pwc=document.pwc;
var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
var reg3=/^[가-힣]{2,4}$/;
var reg4=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var reg5=/^\d{3}-\d{3,4}-\d{4}$/;


function validate()
{
	function ider()
	{
		if(!reg.test(id.value)){
			$.ajax(){
				type:"post";
			url:"memberJoin.jsp";
			data:{
				id=("#id").val();
				password=("#password").val();
				password2=("#password2").val();
				name=("#name").val();
			}
			dataType:"json";
			contentType: "charset=UTF-8";
			error:function(data){
				("#idcheck").text("아이디가 4자이상");
				("#idcheck").css("color","red");
				
				return false;
				
			},
			     success:function(data)
			       {
			      ("#idcheck").text("");

			       }
			
			
			      }
			
			
			                      }
		
	}

	
	
	
	if(!reg2.test(password.value))
	{
		$.ajax(){
			type:"POST";
		url:"memberJoin.jsp";
		dataType:"password";
		contentType: "charset=UTF-8";
		error:function(xhr,status,error){
			("#pwc").text("비밀번호는 5자이상 12자이하를 입력해야합니다.");
			("#pwc").css("color","red");
			
		},
		     success:function()
		       {
		     ("#pwc").text("");

		       }
		
		
		      }
		
		
	}
	
	if(!reg3.test(name.value))
	{
		$.ajax(){
			type:"POST";
		url:"memberJoin.jsp";
		dataType:"text";
		contentType: "charset=UTF-8";
		error:function(){
			("#namecheck").text("이름은 2자이상이며,한글만 가능");
			("#namecheck").css("color","red");
			
		},
		     success:function()
		       {
		     ("#namecheck").text("");

		       }
		
		
		      }
		
		
	
	
	
	
	
		}
function cancel(){
    location.href="<%=request.getContextPath()%>/index.jsp";
}
	
	
		} --%>
		
		
		<script>
		var idcheck=$("#idcheck");
		var pwc=$("#pwc");
		var namecheck=$("#namecheck");
		var nicknamecheck=$("#nicknamecheck");
		var emailcheck=$("#emailcheck");
		var phonecheck=$("#phonecheck");
		$(document).ready(function(){
		    
		    $("#form").submit(function(){
		        var id = $("input[name='id']");
		        var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
		        if( id.val() =='') {
		            idcheck.text("아이디를 입력하세요");
		            id.focus();
		            return false;
		        }
		       
		        
		        else if(!reg.test(id.val()))
		     {
		                idcheck.text("4자이상입력 11자이하입력,앞에는 영문자");
		                id.focus();
		                return false;
		            }
		            else{
		            	 idcheck.text("");
		            }
		        
		        
		        
		        var pw = $("input[name='pw']");
		        var pw2 = $("input[name='pw2']");
		        var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
		        
		        if(pw.val() =='') {
		            pwc.text("비밀번호를 입력하세요!");
		            pw.focus();
		            return false;
		        }
		        else if(!reg2.test(pw.val())){
		            pwc.text("첫글자는 영문자이며 6~12자이내로 입력");
		            pw.focus();
		            return false;
		        }
		        else{
		        	pwc.text("");
		        }
		        
		       
		        if(pw2.val() =='') {
		            pwc.text("비밀번호확인란에 비밀번호를 다시 한번 더 입력하세요!");
		            pw2.focus();
		            return false;
		        }
		        else if(pw.val()!= pw2.val()){
		            pwc.text('입력한 두 개의 비밀번호가 일치하지 않습니다');
		            pw2.focus();
		            return false;
		        }
		        
		        
		        
		        var name = $("input[name='name']");
		        	var reg3=/^[가-힣]{2,4}$/;
		        if( name.val() =='') {
		            namecheck.text("이름을 입력하세요");
		            name.focus();
		            return false;
		        }

		        	else if (!reg3.test(name.val())) {
		                namecheck.text("2자이상입력,한글만 가능");
		                name.focus();
		                return false;
		            }
		        	else{
		        		namecheck.text("");
		        	}
		        
		        var nickname=$("input[name='nickname']");
		        var reg4=/^[a-zA-Z가-힣1-9]{2,}$/;
		        if( nickname.val() == '') {
		            nicknamecheck.text("닉네임을 입력하세요");
		            nickname.focus();
		            return false;
		        }

		        	else if (!reg4.test(nickname.val())) {
		                nicknamecheck.text("2자이상입력,한글만 가능");
		                nickname.focus();
		                return false;
		            }
		        	else{
		        		nicknamecheck.text("");
		        	}
		        
		        
		        var email = $("input[name='email']");
	        	var reg5=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		        if(email.val() ==""){
		        	emailcheck.text("이메일입력");
		        	
		            email.focus();
		            return false;
		        } 
		        else if (!reg5.test(email.val())) {
		        	emailcheck.text("이메일 주소가 유효하지 않습니다.예:g30w@naver.com");
	                email.focus();
	                return false;
	            }
		        
		        else{
		        	emailcheck.text("");
		        }

		        var phone = $("input[name='phone']");
		        var reg6=/^\d{3}\d{3,4}\d{4}$/;
		        if(phone.val() == ''){
		            phonecheck.text("휴대폰 번호를 입력하세요");
		            phone.focus();
		            return false;
		        }  
		        	
		        else if(!reg6.test(phone.val())){
		        	
		        	phonecheck.text("휴대폰 번호는 숫자만 10~11자리 입력하세요.ex)-포함(010-3009-9999)");
		        	phone.focus();
		            return false;
		        } 

		    
		        else{
		        	phonecheck.text("");
		        }
		    

		   
		    });
		   
		});
		/*  function identify()
			{
				 var email = $("input[name='email']");
				window.open("http://localhost:9090/UMO/views/member/identifynumber.jsp",'네이버창',"width=3%","height:3%","toolbar=no","menubar=no");
			}  */
		
		
		</script>

		
		
		
</script>
<br>
<br>
<br>



<%@ include file="/views/common/footer.jsp"%>
</body>



