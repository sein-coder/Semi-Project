<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.umo.model.vo.Inquery"%>

<%@ include file="/views/common/header.jsp"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	
<%
	Inquery inquery = (Inquery)request.getAttribute("inquery");
	String inputCode = (String)request.getAttribute("inputCode");	
	String[] outputCode = ((String)request.getAttribute("outputCode")).split(",");
	String type = (String)request.getAttribute("type");
%>

<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
			<h2 id="container_title">
				<span title="공지사항">공지사항</span>
			</h2>

			<!-- 게시물 읽기 시작 { -->
          <form id="frm" action="<%=request.getContextPath() %>/inquery/inqueryWriteEnd?code-type=<%= type %>" method="post" enctype="multipart/form-data">  
			<input type="hidden" name="writer" value='<%=((Member)session.getAttribute("loginMember")).getMemberId()%>'>
			<article id="bo_v" style="width: 100%; height: auto !important;">
				
				<header>
					<h2 id="bo_v_title">
						<input type="text" id="inquery-title" name="inquery-title" class="frm_input full_input_title required" size="50" maxlength="200" required="required" placeholder="제목" autocomplete="off">
					</h2>
				</header>

				<section id="bo_v_info">
					<h2>페이지 정보</h2>
					<strong><span class="sv_member">작성자 : <%=loginMember.getMemberId()%></span></strong>
					<br>
					<br>
					<h2>코드 타입</h2>
					<strong><span class="sv_member">코드 타입 : <%= type %></span></strong>
					<input id="code-type" name="code-type" type="hidden" value="<%= type %>">
				</section>
				
				<section id="bo_v_atc">
					<h2 id="bo_v_atc_title">본문</h2>

					<!-- 본문 내용 시작 { -->
					<div id="bo_v_con">
						<textarea rows="10" cols="89" id="inquery-content" name="inquery-content"></textarea>
					</div>
					<!-- } 본문 내용 끝 -->
					<div>
						<h3>입력 코드</h3>
						<div id="inputeditor"></div>
						<input type="hidden" id="inputCode" name="inputCode" value="">
					</div>
					<div>
						<h3>출력 내용</h3>
						<div id="outputeditor"></div>
						<input type="hidden" id="outputCode" name="outputCode" value="">
					</div>
				</section>
                
                <!-- 첨부파일 시작 { -->
				<div class="bo_w_flie write_div">
					<div class="file_wr write_div">
						<label for="bf_file_1" class="lb_icon"><i
							class="fa fa-download" aria-hidden="true"></i></label>
							<input type="file"
							name="up_file" id="up_file"
							title="파일첨부  : 용량  10mb 이하만 업로드 가능" class="frm_file ">
					</div>
				</div>
				<!-- 첨부파일 시작 { -->

				<!-- 게시물 하단 버튼 시작 { -->
				<div class="btn_confirm write_div">
					<input
						type="submit" value="작성완료" id="btn_submit"
						class="btn_submit btn">
					<a href='<%=request.getContextPath()%>/webCopiler/webCopilerView' class="btn_cancel btn">되돌아가기</a> 
				</div>
				<!-- } 게시물 하단 버튼 끝 -->
			</article>
			</form>
		</div>
  
		<!-- } 게시글 읽기 끝 -->
	</div>
</div>



<!-- } 콘텐츠 끝 -->

<script>
		//에디터 설정부분
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "inquery-content",
		 sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
	
		// textArea에 이미지 첨부
		function pasteHTML(filepath){
		    var sHTML = '<img src="<%=request.getContextPath()%>/upload/inquery/contentimg/'+filepath+'">';
		    oEditors.getById["inquery-content"].exec("PASTE_HTML", [sHTML]);
		}
		
		$("#frm").submit(function(){
			oEditors.getById["inquery-content"].exec("UPDATE_CONTENTS_FIELD", []); 					
		});
	
		//editor 입력코드와 출력 자료에 적용
		var inputCode = ace.edit('inputeditor');
		var outputCode = ace.edit('outputeditor'); 
		
		var jsbOpts = {
	        indent_size : 4
	    };
		
		inputCode.setTheme("ace/theme/monokai");
		inputCode.getSession().setMode("ace/mode/java");
		inputCode.getSession().setValue('<%= inputCode %>');
		
	    outputCode.getSession().setMode("ace/mode/java");
		
	    <%for(int i=0; i<outputCode.length; i++) {%>
			insertLine(outputCode,'<%=outputCode[i]%>');
	    <%}%>
	    
	    inputCode.getSession().setValue(js_beautify(inputCode.getSession().getValue(), jsbOpts));
	    outputCode.getSession().setValue(js_beautify(outputCode.getSession().getValue(), jsbOpts));

	    inputCode.setReadOnly(true);
	    outputCode.setReadOnly(true);
	    
	    var lines = inputCode.session.doc.getAllLines()
	    $("#inputeditor").height((lines.length * 18)+5);
	    $("#outputeditor").height((lines.length * 18)+5);
	    
	    commitChanges(inputCode,$("#inputCode"));
	    commitChanges(outputCode,$("#outputCode"));
	    
	    function commitChanges(editor, codetag) {
	    	codetag.val(editor.getSession().getValue());
	    }
	    
	    function insertLine(editor,text){
	    	editor.getSession().insert({
		    	row : editor.getSession().getLength(),
		    	column : 0
		    }, "\n" + text)
	    };

	    $(function(){
			$('[name="up_file"]').change(function(){
				var filetype = $(this).val().split(".")[$(this).val().split(".").length-1];
				if(!( filetype.toLowerCase() == $("#code-type").val().toLowerCase() ) ){
	    			alert("같은 종류의 코드파일을 업로드해주세요.");
	    			$(this).val("");			  
	    		}
				else {
					if($(this).val()!=""){
						$("#fname").hide();					
					}else{
						$("#fname").show();	
					}
				}
			});
		});
	    
	</script>

<%@ include file="/views/common/footer.jsp"%>