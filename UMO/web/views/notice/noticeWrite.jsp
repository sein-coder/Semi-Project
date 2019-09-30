<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<style>
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
   <section id="notice-container">
   <h2>공지사항</h2>
      <form id="frm" action="<%=request.getContextPath()%>/noticeWriteEnd" method="post" enctype="multipart/form-data">  
      <table id="tbl-notice" class="table table-striped table-bordered table-hover" style="width: 1000px;">
       <tr>
         <th>제목</th>
         <td><input type="text" name="title" required/></td>
       </tr>
       <tr>
         <th>작성자</th>
         <td><input type="text" name="writer" value="<%=loginMember.getMemberId()%>" readonly="readonly"/></td>
       </tr>
       <tr>
         <th>첨부파일</th>
         <td><input type="file" name="up_file" /></td>
       </tr>
       <tr>
         <th>내용</th>
<<<<<<< HEAD
         <td> <textarea name="content" id="content" rows="10" cols="100"></textarea></td>
=======
         <td><textarea rows="5" cols="50" id="content" name="content"></textarea></td>
>>>>>>> refs/remotes/origin/master2.0
       </tr>
       <tr>
         <td colspan="2" style="text-align:center;"><input type="submit" value="등록"/></td>
       </tr>  
      </table>
      </form>
<<<<<<< HEAD
   
   
   <script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
   });

    $("#frm").submit(function(){
    	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    });
    
   // textArea에 이미지 첨부
   function pasteHTML(filepath){
       var sHTML = '<img src="<%=request.getContextPath()%>/upload/food/contentimg/'+filepath+'">';
       oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
   }
   </script>
=======
>>>>>>> refs/remotes/origin/master2.0
   </section>
   
   <!-- <script src="./js/TextEditor.js"></script> -->
   
   <script>
		//에디터 설정부분
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "content",
		 sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	
		// textArea에 이미지 첨부
		function pasteHTML(filepath){
		    var sHTML = '<img src="<%=request.getContextPath()%>/upload/notice/contentimg/'+filepath+'">';
		    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		$(this).submit(function(){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
		});
   </script>
   

<%@ include file="/views/common/footer.jsp" %>