<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>


<style>
/* 회원가입 입력 */
#register_form{background:#fff;padding:20px;margin-bottom:20px}
#fregisterform #msg_certify {margin:5px 0 0;padding:5px;border:1px solid #dbecff;background:#eaf4ff;text-align:center}
#fregisterform .frm_address {margin:5px 0 0}
#fregisterform #mb_addr3 {display:inline-block;margin:5px 0 0;vertical-align:middle}
#fregisterform #mb_addr_jibeon {display:block;margin:5px 0 0}
#fregisterform .btn_confirm{text-align:center}
#fregisterform .btn_confirm .btn_submit{height:45px;;padding:0 30px;font-weight:bold;font-size:1.083em}
#fregisterform .btn_confirm .btn_cancel{line-height:45px;height:45px;padding:0 30px;font-weight:bold;font-size:1.083em}
#fregisterform .frm_info{display:block;color:#3497d9;font-size:0.92em}
#fregisterform .form_01 div{margin: 0 0 50px}
</style>

<!-- 컨텐츠  -->
<div id="wrapper">
   <div id="container_wr">
      <div id="container">
         <h2 id="container_title">
            <span title="회원 가입">회원 가입</span>
         </h2>

         <!-- 회원정보 입력/수정 시작 { -->


         <form id="fregisterform" name="fregisterform" action="<%=request.getContextPath()%>/memberJoinEnd" onsubmit="return fregisterform_submit(this);"
            method="post" autocomplete="off">
            <div id="register_form" class="form_01">
               <div>
                  <h2>사이트 이용정보 입력</h2>
                  <ul>
                     <li>
                         <input type="text" name="mb_id" value="" id="reg_mb_id"
                         class="frm_input half_input required" minlength="3"
                        maxlength="20" placeholder="아이디"><span id="msg_mb_id">
                        <input class="btn_b02 btn" type="button" onclick="idduplicate();" value="중복확인" />
                        </span>
                        <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
                     </li>
                     <li>
                         <input type="password" name="mb_password"
                        id="reg_mb_password" 
                        class="frm_input half_input required" minlength="3"
                        maxlength="20" placeholder="비밀번호">
                        <input
                        type="password" name="mb_password_re" id="reg_mb_password_re"
                         class="frm_input half_input right_input required"
                        minlength="3" maxlength="20" placeholder="비밀번호 확인">
                        <div id="pwcheck" style="width:23%;,height:10%;"></div>
                        </li>
                  </ul>
               </div>

               <div class="tbl_frm01 tbl_wrap">
                  <h2>개인정보 입력</h2>

                  <ul>
                     <li><input type="text" name="mb_name" id="reg_mb_name"
                     value=""  class="frm_input half_input required "
                        size="10" placeholder="이름"></li>
                     
                     <li><input type="hidden" name="mb_nick_default" value="">
                        <input type="text" name="mb_nick" value="" id="reg_mb_nick"
                         class="frm_input required nospace half_input"
                        size="10" maxlength="20" placeholder="닉네임"> <span
                        id="msg_mb_nick"></span> <span class="frm_info"> 공백없이
                           한글,영문,숫자만 입력 가능 </span></li>
                     <li><input type="text" name="mb_khNum" value=""
                        id="reg_mb_khNum" 
                        class="frm_input half_input required" size="5"
                        maxlength="5" placeholder="KH학생번호">
                        <input class="btn_b02 btn" type="button" onclick="khnnumduplicate();" value="중복확인" />
                        <span class="frm_info">5자리 학생번호 입력</span></li>
                     <li><input type="text" name="mb_email" value=""
                        id="reg_mb_email" 
                        class="frm_input email half_input required" size="70"
                        maxlength="100" placeholder="E-mail"></li>
                  </ul>
               </div>
            </div>
            <div class="btn_confirm">
               <input type="submit" value="회원가입" id="btn_submit" class="btn_submit"> 
               <a href="<%=request.getContextPath()%>/index.jsp" class="btn_cancel">취소</a>
            </div>
         </form>
      </div>
   </div>
   
<script>
/* var password2=document.getElementById("password2");
var id=document.getElementById("id");
var password=document.getElementById("password");
var name=document.getElementById("name");
var email=document.getElementById("email");
var frm=document.frm;
var pwc=document.pwc;
var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
//
var reg3=/^[가-힣]{2,4}$/; */

/* function validate(){

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

   } */
   

</script>

<script>
var studentNum=$("#reg_mb_khNum");



var namecheck=$("#namecheck");
var emailcheck=$("#emailcheck");

/* $(document).ready(function(){
   $("#fregisterform").submit(function()
   {
      var id=$("#reg_mb_id");
   
        var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
   if(id.val()=='')
      {
        idcheck.text("아이디를 입력하세요");
            id.focus();
            return false;
      
      }
    else if(!reg.test(id.val()))
     {
                idcheck.text("4자이상입력 11자이하입력,앞에는 영문자");
                idcheck.css("color","red");
                id.focus();
                return false;
            }
    else{
       idcheck.text("");
    }
   var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
   var pw=$("#reg_mb_password");
   var pw2=$("#reg_mb_password_re");

    if(pw.val() =='') {
        pwcheck.text("비밀번호를 입력하세요!");
        pw.focus();
        return false;
    }
    else if(!reg2.test(pw.val())){
        pwcheck.text("첫글자는 영문자이며 6~12자이내로 입력");
        pw.focus();
        return false;
    }
   
    
   
    if(pw2.val() =='') {
        pwcheck.text("비밀번호확인란에 비밀번호를 다시 한번 더 입력하세요!");
        pw2.focus();
        return false;
    }
    else if(pw.val()!= pw2.val()){
        pwcheck.text('입력한 두 개의 비밀번호가 일치하지 않습니다');
        pw2.focus();
        return false;
    }
   
   
   
   var reg3=/^[가-힣]{2,4}$/;
   var name=$("#reg_mb_name");
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
    
var reg4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var email=$("#reg_mb_email");

if(email.val() ==""){
   emailcheck.text("이메일입력");
   
    email.focus();
    return false;
} 
else if (!reg4.test(email.val())) {
   emailcheck.text("이메일 주소가 유효하지 않습니다.예:g30w@naver.com");
    email.focus();
    return false;
}

   });
   

    }) */

    var id=$("#reg_mb_id");
   /*  var idcheck=$("#idcheck");  */
    var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
   function khnnumduplicate(){
   var khnum=$("#reg_mb_khNum");
   var name=$("#reg_mb_name");
    if(khnum.val()==""){
       alert("학생번호를 확인해주십시오."); 
       return false;
    }else{
       $.ajax({
         url:"./khnumcheck",
         type:"post",
         data:{"khnum":khnum.val(),"name":name.val()},
         success:(function(data)
      {
            console.log("1 = 중복o / 0 = 중복x : "+data);
         
          if(data=="true")
            {
            alert("학생번호 확인");
          }
         else{
            
         if(name.val()==""){
          alert("이름을 확인해주십시오."); 
            return false;
         }
         else if(data=="false"){
            alert("이름과 학생번호를 확인해주십시오."); 
         return false;
            }
        }
             
      })
      
      });
   }
      }  
   
   function idduplicate()
   {
      $.ajax({
         url:"./idcheck",
         type:"post",
         data:{"id":id.val()},
         success:(function(data)
      {
            console.log("1 = 중복o / 0 = 중복x : "+data);
         
          if(data=="true")
            {
            alert("아이디가 존재합니다");
            id.focus();
            return false;
                       
          }
         else{
             if(id.val()==""){
                 alert("아이디를 입력하시오.");
                 id.focus();
                 }   else if(!reg.test(id.val())){
                    alert("4자리이상,단.앞글자는 영문자여야 합니다.");
                    }
                 
                 else if(data=="false"){
                       alert("아이디사용가능."); 
                    }
                 }
         
      })
      
      });
      } 
       
  
      var reg2=/^[a-zA-z][a-zA-z0-9]{5,12}$/;
       var pw=$("#reg_mb_password"); 
      var pw2=$("#reg_mb_password_re");
      var pwcheck=$("#pwcheck");
      
      pw.on("keyup",function(){
         if(pw.val() =='') {
              pwcheck.text("비밀번호를 입력하세요!");
              pw.focus();
              pwcheck.css('color','red');
              return false;
          }
          else if(!reg2.test(pw.val())){
              pwcheck.text("첫글자는 영문자이며 6~12자이내로 입력");
              pw.focus();
              pwcheck.css('color','red');
              return false;
          }else if(pw.val()!= pw2.val()){
              pwcheck.text('입력한 두 개의 비밀번호가 일치하지 않습니다');
              pw.focus();
              pwcheck.css('color','red');
              return false;
          }
          else{
             pwcheck.text("비밀번호가 일치합니다");
             pwcheck.css('color','BLUE');
          }
      });
          
      pw2.on("keyup",function(){
          if(pw2.val() =='') {
              pwcheck.text("비밀번호확인란에 비밀번호를 다시 한번 더 입력하세요!");
              pw2.focus();
              pwcheck.css('color','red');
              return false;
          }else if(!reg2.test(pw.val())){
              pwcheck.text("첫글자는 영문자이며 6~12자이내로 입력");
              pw2.focus();
              pwcheck.css('color','red');
              return false;
          }
          else if(pw.val()!= pw2.val()){
              pwcheck.text('입력한 두 개의 비밀번호가 일치하지 않습니다');
              pw2.focus();
              pwcheck.css('color','red');
              return false;
          }
          else{
             pwcheck.text("비밀번호가 일치합니다");
             pwcheck.css('color','BLUE');
          }
         
         });
      
    

    <%--    $(document).ready(function(){
          
       
   $("#fregisterform").submit(function(){
      
      
             var reg= /^[a-zA-Z][a-zA-Z0-9]{3,10}$/;
             
              $.ajax({
                     url : "<%=request.getContextPath()%>/idcheck", 
                     dataType:"json",
                     data: { "id": $("#reg_mb_id").val(), "reg": reg },
                     type : "get",
                     beforeSend:function(data){
                        if(!reg.test(id))
                           
                     
                     },
                     
                         success : function() {
                        idcheck.text("");
                            
                         },
                      error:function()
                      {
                         idcheck.text("4자이상입력");
                         id.focus()
                         return false;
                      }
                        
              });
                   
   });
       }); --%>
</script>



<!-- 콘텐츠 끝 -->

<!-- 하단 시작  -->
<%@ include file="/views/common/footer.jsp"%>
<!-- 하단 끝 -->