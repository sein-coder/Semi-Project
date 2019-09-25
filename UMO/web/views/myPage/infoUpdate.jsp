<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.umo.model.vo.Member" %>
<%Member m=(Member)request.getAttribute("member"); %>

<head>

  <style>
    #memberUpdate-box {
      margin-top: 10%;
      /* margin-left: 15%; */
      /* margin-bottom: 15%; */
      width: 100%;
      height: 100%;
      /* margin: 0 auto; */
      border: 1px solid black;

    }

    #updateList {
      border: solid 2px #b7ddf2;
      background-color:F5FFFA;
     
      padding-bottom: 4%;
      width: 50%;
      margin-left:20%
      /* height: 80%; */
      /* margin: 15% 0 0 0%; */



    }

    #updateFrm {

      width: 600px;
     height:auto;

    }

    label {
      border:1px solid black;
      font-weight: bold;
      font-size: 17px;
      width: 41%;
      height: 30%;

      font-family: tahoma;
      margin-left: 28%;
      margin-top: 2%;
line-height:30px;
    }

    /* .label{
            color:black;
            
            font-size:17px;
            font-weight:normal;
          
            
            
            font-family:dotum;
           
        } */
    #updatelist input {

      font-size: 12px;

      border: solid 1px #aacfe4;
      width: 145px;
      height: 32px;
       margin-left:20%; 
      /* margin-bottom:10%; */
      /* margin:0 auto; */
    }




    #updateCheck {

      width: 110px;
      height: 31px;
      background-color: lightslategray;
      color: black;
      font-size: 11px;
      font-weight: bold;
      font-family: tahoma;
    }
  </style>
</head>

<body>
  <%@ include file="/views/common/header.jsp"%>
  <section id="memberUpdate-box" style="overflow:hidden;">
    <div id="updateList" >

      <p style="text-align:center; font-size:21px;">멤버수정</p>
      <br>
      <form name="updateFrm" method="post" onsubmit="return update_validate();">

        <label>멤버아이디<input type="text" id="id" name="id" value="<%=m.getMemberId()%>" readonly /></label>
        <label>멤버비밀번호<input type="text" id="pw" name="pw" value="<%=m.getMemberPw()%>" /></label>
        <label>이름<input type="text" id="name" name="name" value="<%=m.getMemberName()%>" /></label>
        <label>이메일<input type="text" id="email" name="email" style="" value="<%=m.getEmail()%>" /></label>
        <label>전화번호<input type="text" id="phone" name="phone" value="<%=m.getPhone() %>" /></label>
        <label>주소<input type="text" id="address" name="address" value="<%=m.getAddress()%>" /></label>

        <input type="button" onclick="fn_updateMember();" value="수정완료" id="updateCheck"
          style="margin-left:10%;margin-top:15%;" />
        <input type="button" value="취소" name="cancel" id="updateCheck" onclick="acancel();" style="margin-left:7%;margin-top:2%;"/>

      </form>
    </div>
  </section>
  <br>
  <script>
    function update_validate() {
      //정규표현식 이용해서 제한사항작성
      return true;
    }

    function fn_updateMember() {
      //수정된정보를 서블릿에 전송
      updateFrm.action = "<%=request.getContextPath()%>/infoUpdateEnd";
      console.log(updateFrm.action);
      updateFrm.submit();//데이터전송!

    }
    function acancel() {


      location.href = "myPage?userId=<%=m.getMemberId()%>";
    }
  </script>
  <br>
  <%@ include file="/views/common/footer.jsp"%>
</body>