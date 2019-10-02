<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.umo.model.vo.Inquery,java.util.List,com.umo.model.vo.InqueryComment"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-beautify/1.6.8/beautify.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" rel="stylesheet"/>


<% 
	Inquery inquery = (Inquery)request.getAttribute("inquery");
	List<InqueryComment> list = (List<InqueryComment>)request.getAttribute("list");
	String board_type = request.getAttribute("board_type")!=null?request.getAttribute("board_type").toString():"";
	
	Inquery preb = (Inquery)request.getAttribute("preb")!=null?(Inquery)request.getAttribute("preb"):null;
	Inquery nextb = (Inquery)request.getAttribute("nextb")!=null?(Inquery)request.getAttribute("nextb"):null;
	
	String inputCode = "";
	String outputCode = "";
	if(inquery!=null && inquery.getInputCode()!=null && inquery.getOutputCode()!=null ) {
		inputCode = inquery.getInputCode().replaceAll("(\r\n|\r|\n|\n\r)", " ");
		outputCode = inquery.getOutputCode().replaceAll("(\r\n|\r|\n|\n\r)", ",");
	}else {
		inputCode = "입력 코드가 없습니다. ";
		outputCode = "출력 코드가 없습니다.";
	}
%>


<%@ include file="/views/common/header.jsp"%>

<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
		<h2 id="container_title">
			<span title="질의 게시판">질의 게시판</span>
		</h2>

		<!-- 게시물 읽기 시작 { -->

		<article id="bo_v" style="width: 100%; height: auto !important;">
			<header>
				<h2 id="bo_v_title">
					<span class="bo_v_tit"><%=inquery.getBoard_Title()%></span>
					
                     <a href="<%=request.getContextPath() %>/scrap/scrapButtonServlet?board_type=inquery&board_no=<%=inquery.getBoard_No()%>" id="ol_after_scrap" class="win_scrap">스크랩
	                <strong class="scrap"><i class="fa fa-thumb-tack" aria-hidden="true"></i></strong>
	                </a>
				</h2>
			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>

				<strong><span class="sv_member"><%=inquery.getBoard_Writer()%></span></strong>
					<strong><a
					href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i>
						<%=list.size() %>건(댓글)</a></strong>
					<strong>
					<i class="fa fa-eye" aria-hidden="true"></i> <%= inquery.getBoard_Count() %>회(조회수)</strong>
					<strong class="if_date">
					<i class="fa fa-clock-o" aria-hidden="true"></i> <%= inquery.getBoard_Date() %></strong>

			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>

					<!-- 본문 내용 시작 { -->
					<div id="bo_v_con">
						<%= inquery.getBoard_Contents() %>
					</div>
					<div id="bo_v_con">
					<h3>입력 코드</h3>
					<div id="inputeditor"></div>
					<input type="hidden" id="inputCode" name="inputCode" value="">
					</div>
					<div id="bo_v_con">
					<h3>출력 내용</h3>
					<div id="outputeditor"></div>
					<input type="hidden" id="outputCode" name="outputCode" value="">
					</div>
					
					<% if(inquery.getOriginal_FileName()!=null) { %>
						<a href="<%=request.getContextPath()%>/inquery/inqueryFileDownload?fileName=<%=inquery.getOriginal_FileName()%>">
							<img src="<%=request.getContextPath()%>/images/file.png" width="20px"/>
							<%=inquery.getOriginal_FileName() %>
						</a>
					<% } %>

					<!-- } 본문 내용 끝 -->

			</section>

			<div id="bo_v_share"></div>



			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">

				<ul class="bo_v_left">
				</ul>

				<ul class="bo_v_com">
					<li>
					<% if(board_type.equals("scrap")) { %>
					<a href="<%=request.getContextPath()%>/scrap/scrapViewServlet"
						class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>
							목록</a>
					<% } else { %>
					<a href="<%=request.getContextPath()%>/inquery/inqueryBoard"
						class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>
							목록</a>
					<% } %>
					</li>
					<%if(loginMember!=null&&loginMember.getMemberId().equals(inquery.getBoard_Writer())){ %>
					<li><a href="<%=request.getContextPath()%>/inquery/inqueryUpdate?Board_No=<%=inquery.getBoard_No() %>" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 수정</a></li>
					<li><a href="<%=request.getContextPath()%>/inquery/inqueryDelete?Board_No=<%=inquery.getBoard_No() %>" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 삭제</a></li>
							<%} %>
				</ul>

				<ul class="bo_v_nb">
					<li class="btn_prv"><span class="nb_tit"><i
						class="fa fa-caret-up" aria-hidden="true"></i> 이전글</span>
						<% if(preb!=null&&preb.getBoard_Title()!=null) { %>
						<a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=preb.getBoard_No()%>"><%= preb.getBoard_Title() %></a> 
						<% } else { %>
						<a href="">이전 글이 없습니다.</a> 
						<% } %>
						<span class="nb_date"><%= preb!=null?preb.getBoard_Date():"" %></span></li>
						
					<li class="btn_next"><span class="nb_tit"><i
						class="fa fa-caret-down" aria-hidden="true"></i> 다음글</span>
						<% if(preb!=null&&nextb.getBoard_Title()!=null) { %>
						<a href="<%=request.getContextPath()%>/inquery/inqueryView?Board_No=<%=nextb.getBoard_No()%>"><%= nextb.getBoard_Title() %></a> 
						<% } else { %>
						<a href="">다음 글이 없습니다.</a> 
						<% } %>
						<span class="nb_date"><%= nextb!=null?nextb.getBoard_Date():"" %></span></li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->


			<button type="button" class="cmt_btn">
				<i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글목록
			</button>
			<!-- 댓글 시작 { -->
			<section id="bo_vc">
				<h2>댓글목록</h2>

				<article>
				<% if(!list.isEmpty()) {
						for(InqueryComment bc : list){
						if(bc.getComment_level()==1){
					%>
					<header style="z-index: 2">
						<h2><%=bc.getComment_contents() %>님의 댓글</h2>
						<span class="sv_member"><%=bc.getComment_writer() %>의 댓글</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00"><%=bc.getComment_date() %></time></span>
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p><%=bc.getComment_contents() %></p>
						<ul class="bo_vc_act">
							<li><button id="btn-reply" class="btn_b03" value="<%= bc.getComment_no() %>">답변</button></li>
							<%if(loginMember!=null&&loginMember.getMemberId().equals(bc.getComment_writer())){ %>
							<li>
							<a href='<%=request.getContextPath()%>/<%= board_type %>/deleteComment?<%= board_type %>No=<%=bc.getComment_no()%>'
								onclick="comment_delete();" class="btn_b03">삭제</a></li>
								<%} %>
						</ul>
					</div>
					<!-- 레벨2댓글 구현부 -->
					<% } else { %>
					<header style="z-index: 2">
						<h2><%=bc.getComment_contents() %>님의 답변</h2>
						<span class="sv_member"><%=bc.getComment_writer() %>의 답변</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00"><%= bc.getComment_date() %></time></span>
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p style="text-align: right;"><%=bc.getComment_contents() %></p>
						<ul class="bo_vc_act">
							<!-- <li><button class="btn_b03">답변</button></li> -->
							<li><a
								href='<%=request.getContextPath()%>/<%= board_type %>/deleteComment?<%= board_type %>No=<%=bc.getComment_no()%>'
								onclick="comment_delete();" class="btn_b03">삭제</a></li>
						</ul>
					</div>
					<% 	} 
						} 
					} %>

					<input type="hidden" value="" id="">
					<textarea id="save_comment" style="display: none">123</textarea>
					<!-- 무슨 의도로 만든지 물어보기 -->

				</article>

			</section>
			<!-- } 댓글 끝 -->

			<!-- 댓글 쓰기 시작 { -->
			<aside id="bo_vc_w" class="bo_vc_w">
				<h2>댓글쓰기</h2>
				<form name="fviewcomment" id="fviewcomment"
					action="<%= request.getContextPath() %>/<%= board_type %>/insertComment"
					onsubmit="" method="post"
					autocomplete="off">

					<textarea id="wr_content" name="wr_content" maxlength="10000"
						required class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>

					<div class="bo_vc_w_wr">
						<div class="bo_vc_w_info">
<%-- 							 <input type="text" name="wr_name" value="<%= loginMember!=null?loginMember.getMemberId():"" %>" id="wr_name"
								required class="frm_input required" size="25"
								placeholder="이름">   --%>
<!-- 							 <input
								type="password" name="wr_password" id="wr_password" required
								class="frm_input required" size="25" placeholder="비밀번호"> -->
					
						</div>
						<div class="btn_confirm">
							 <input type="submit"
								id="btn_submit" class="btn_submit" value="댓글등록">
						</div>
					</div>
					<!-- insert용 정보 저장 -->
					<input type="hidden" name="boardRef" value="<%=inquery.getBoard_No()%>"/>
					<input type="hidden" name="boardCommentRef" value="0"/>
					<input type="hidden" name="boardCommentLevel" value="1"/>
					<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>
				</form>
			</aside>
          </article>

     </div>

		<!-- } 게시글 읽기 끝 -->
	</div>
	</div>



<!-- } 콘텐츠 끝 -->

<script>
	$("[name=content]").focus(function(){
		if(<%=loginMember==null%>){
			fn_loginAlert();
		}
	})
	$("#btn-reply").click(function(){
 <%if(!board_type.equals("anonymous")){ %>
			if(<%=loginMember==null%>){
    			fn_loginAlert();
    			return;
    		}
			<%}%>
    		var tr=$("<tr>");
    		var html="<td style='display:none;text-align:left;' colpsan='2'>";
    		html+="<form action='<%=request.getContextPath()%>/<%= board_type %>/insertComment' method='post'>";
       		html+='<input type="hidden" name="boardRef" value="<%=inquery.getBoard_No()%>"/>';
			html+='<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'"/>';
			html+='<input type="hidden" name="boardCommentLevel" value="2"/>';
			html+='<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>"/>';					
			html+='<textarea name="wr_content" cols="60" rows="3"></textarea>';
			html+='<input type="submit" value="등록">';
			html+='</form></td>';
			tr.html(html);
			tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
			$(this).off('click');
    	});
	
    function fn_commentValidate(){
    	if(<%=loginMember==null%>){
    		fn_loginAlert();
    		return false;
    	}
    	var len=$("[name==wr_content]").val().trim().length;
    	if(len<1){
    		alert("내용을 입력하세요!");
    		return false;
    	}
    	return true;
    }
	
	function fn_loginAlert(){
    	alert("로그인 후 이용하세요!");
    	$("[name=wr_content]").blur();
    }
	
</script>
<script>
		
		//editor초기화
		var inputCode = ace.edit('inputeditor');
		var outputCode = ace.edit('outputeditor'); 
		
		var jsbOpts = {
	        indent_size : 4
	    };
		
		inputCode.setTheme("ace/theme/monokai");
		inputCode.getSession().setMode("ace/mode/java");
		inputCode.getSession().setValue('<%=inputCode%>');
		
	    outputCode.getSession().setMode("ace/mode/java");
		
	    <%for(int i=0; i<outputCode.split(",").length; i++) {%>
			insertLine(outputCode,'<%=outputCode.split(",")[i]%>');
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
	    
	    //댓글 관련 함수
	    $(function() {
	    	$("[name=content]").focus(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    	})
	    	$(".btn-reply").click(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    		var tr = $("<tr>");
	    		var html="<td style='display:none; text-align:left;' colspan='2'>";
	    		html+= "<form action='<%=request.getContextPath()%>/inqueryComment/insertComment' method='post'>";
	    		html+=  '<input type="hidden" name="boardRef" value="<%= inquery.getBoard_No() %>">';
				html+=	'<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'">';
				html+=	'<input type="hidden" name="boardCommentLevel" value="2">';
				html+=	'<input type="hidden" name="boardWriter" value="<%= loginMember!=null?loginMember.getMemberId():"" %>">';
				html+=  '<textarea name="content" cols="60" rows="3"></textarea>';
				html+=  '<input type="submit" value="등록" />';
				html+=  '</form></td>';
				tr.html(html);
				tr.insertAfter($(this).parent().parent()).children("td").show().slideDown(800);
				$(this).off('click') //실행후 이벤트 중단
	    	});
	    	
	    	$(".btn-delete").click(function(){
	    		if(<%=loginMember==null%>){
	    			fn_loginAlert();
	    		}
	    		
	    		location.href="<%=request.getContextPath()%>/inqueryComment/deleteComment?boardRef=<%=inquery.getBoard_No()%>&boardCommentNo="+$(this).val()+"";
	    	});
	    	
	    });
	    
	    function fn_commentValidate(){
	    	if(<%=loginMember==null%>){
	    		fn_loginAlert();
	    	}
	    	var len = $("[name=content]").val().trim().length;
	    	if(len<1){
	    		alert("내용을 입력하세요.")
	    		return false;
	    	}
	    	return true;
	    }
	    
	    function fn_loginAlert(){
	    	alert("로그인 후 이용하세요!");
	    	$("[name=content]").blur();
	    	location.href="<%=request.getContextPath()%>/";
	    }
	    
	    
		</script>

<%@ include file = "/views/common/footer.jsp" %>
