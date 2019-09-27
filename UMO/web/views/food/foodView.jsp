<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.umo.model.vo.Food,java.util.List,com.umo.model.vo.FoodComment" %>
<%@ include file = "/views/common/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=y8vul4gvp5&submodules=geocoder"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<%
	Food f = (Food)request.getAttribute("f");
	List<FoodComment> list = (List<FoodComment>)request.getAttribute("list");
	String cPage = request.getAttribute("cPage").toString();
	String tag;
	try{
		tag = request.getAttribute("tag").toString();
	}catch(NullPointerException e){
		tag = "";
	}
%>
	<style>
		section#foodview-container{margin-left: auto;margin-right: auto;align:center;width:100%;}
		div#div-container{margin-left:auto; margin-right: auto; }
		table#big-table {border: 2px solid goldenrod; margin-top:5px; margin-left: auto;margin-right: auto;border-spacing: 0px;}
		table#sml-table {border: 2px solid goldenrod; margin-left: auto;margin-right: auto;border-spacing: 50px 20px; width: 1000px; height: 100px; }
		span{font-size:20px;}
	</style>
	<style>
	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both;} 
	table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:100%;}
	table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
	table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
	table#tbl-comment button.btn-reply{display:none;}
	table#tbl-comment tr:hover {background:gold;}
	table#tbl-comment tr:hover button.btn-reply{display:inline;}
	table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
	table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
	table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
	table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
	table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
	table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}
</style>

<style>
	* {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }
    
    form {
        padding-top: 16px;
    }

    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }

    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }
</style>
	
	<section id="foodview-container">
	<input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getMemberId():""%>"> 
	
	<div id="div-container">
		<div id="thumnail" style="margin-left:auto; margin-right:auto; width: 600px; height: 400px; border: 1px solid red;">
			<img src="<%=request.getContextPath() %>/upload/food/thumnail/<%= f.getBoard_Thumbnail() %>" style="width: 600px; height: 400px" >
		</div>
		<table id="big-table">
		
			<tr>
				<th style="background-color:black;">  	
					<button type="button" id="img-back" style="border:none;padding:0px;"><img src="<%=request.getContextPath()%>/images/foodpoint/back.jpg" width="50px" height="205px"></button>
				</th> 
				<th colspan="3" style="background-color:white;" >
					<div id="img-container">
						<img id="img0" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
						<img id="img1" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png"> 
						<img id="img2" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
					</div>
				</th>
				<th style="background-color:white;">
					<button type="button" id="img-front" style="border: none; padding:0px 0px 0px 0px; " ><img src="<%=request.getContextPath()%>/images/foodpoint/front.jpg" width="50px" height="205px"></button>
				</th>
			</tr>
			<tr>
				<td colspan="5">
						
						
						<table id="sml-table">
							<tr>
								<td>
									<span>제목:<%=f.getBoard_Title() %></span>
								</td>
							</tr>
							<tr>
								<td>
									<div class="content">							
								        <ul id="tag-list">
								        	
								        </ul>
								    </div>
								</td>
							</tr>
							<tr>
								<td>
									<span>전화번호 :<%=f.getBoard_tel() %></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>음식종류 :<%=f.getBoard_foodtype() %></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>가격(1인기준) :<%=f.getBoard_foodbill() %></span>
									
								</td>
							</tr>
							<tr>
								<td>
									<span>주차여부 :<%=f.getBoard_park() %></span>
									
								</td>
							</tr>
							<tr>
								<td>
									<span>영업시간 :<%=f.getBoard_open() %></span>
								</td>
							</tr>
							<tr>
								<td>
									<span id="grade">만족도:<%=f.getBoard_Grade() %></span>
								</td>
							</tr>
							<tr>
								<td>
									<h3>내용</h3>
									<div>
										<%=f.getBoard_Contents() %>
									</div>
								</td>
							</tr>
							
							 <tr>
								<td><!--지도  -->
									<div id="map" style="width:100%;height:400px;margin-right: auto;margin-left: auto;">
										 <div class="search" style="position:absolute; z-index:1000; top:20px; left:20px;">
										 	<input type="hidden" id="road_address" name="road_address" value="<%=f.getBoard_MAP()%>">
										 </div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<% if(request.getAttribute("tag")!=null) { %>
										<input type="button" value="목록"  id="btn_list" onclick="location.href='<%=request.getContextPath()%>/food/foodTagSearch?cPage=<%=cPage%>&tag=<%=tag%>'"/>
									<% } else { %>
										<input type="button" value="목록"  id="btn_list" onclick="location.href='<%=request.getContextPath()%>/food/foodList?cPage=<%=cPage%>'"/>
									<% } %>
								</td>
							</tr>
						</table>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="수정" id="btn_update" onclick="location.href='<%=request.getContextPath() %>/food/foodUpdate?board_no=<%=f.getBoard_No()%>&cPage=<%=cPage%>&tag=<%=tag%>'">
				</td>
				<td>
					<input type="button" value="삭제" id="btn_delete" onclick="location.href='<%=request.getContextPath() %>/food/foodBoardDelete?board_no=<%=f.getBoard_No()%>'">
				</td>
			</tr>
		</table>
	</div>
	<!-- 댓글  -->
	<div id="comment-container"></div>
		<div class="comment-editor">
			<form action="<%=request.getContextPath()%>/foodComment/insertComment" method="post" onsubmit="return fn_commentValidate();">
			<table style="margin-top:20px; margin-left:auto; margin-right:auto";>
				<tr>
					<td>
						<!-- 클라이언트에게 입력받을 필요가 없는 내용이다 -->
						<input type="hidden" name="boardRef" value="<%=f.getBoard_No() %>">
						<input type="hidden" name="boardCommentRef" value="0">		
						<input type="hidden" name="boardCommentLevel" value="1">
						<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():"" %>">
						<!--클라이언트에게 입력을 받아야 하는 내용을 작성을 하기  -->	
						<textarea style="min-right:100px;" name="content" rows="3" cols="60"></textarea>
					</td>
					<td>	
						<input type="submit" value="등록"/>
						<input type="submit" value="삭제"/>
					</td>
				</tr>
			</table>
			</form>
		
		
		
		</div>
	<table id="tbl-comment">
	<% if(!list.isEmpty()) {
		for(FoodComment comment : list){
			if(comment.getComment_Level()==1){
	%>
		<tr class="level1">
			<td>
				<sub class="comment-writer"><%=comment.getComment_Writer() %></sub>
				<sub class="comment-date"><%=comment.getDate()%></sub>
				<br>
				<%= comment.getComment_Contents() %>
			</td>
			<td>
				<button class="btn-reply" value="<%=comment.getComment_No()%>">답글</button>
				<button class="btn-delete" value="<%=comment.getComment_No()%>">삭제</button>
			</td>
		</tr>
	<%  } else {%>
			<tr class="level2">
			<td>
				<sub class="comment-writer"><%=comment.getComment_Writer() %></sub>
				<sub class="comment-date"><%=comment.getDate()%></sub>
				<br>
				<%=comment.getComment_Contents() %>
			</td>
			<td>
				<button class="btn-reply" value="<%=comment.getComment_No()%>">답글</button>
				<button class="btn-delete" value="<%=comment.getComment_No()%>">삭제</button><!--아직 안함  -->
				</td>
			</tr>
		<% 		}	
			}
		}	%>
	</table>
		
		
<!-- 		
	</section> -->

	<script>
	//해시태그 표시 및 추가
	var tags = "<%=f.getBoard_menu()%>".split(",")

	$.each(tags,function(i,item){
		if(item!='null') {
		$("#tag-list").append("<li class='tag-item'>"+"#"+item+"</li>");
		}
	});
	
	var foodpic=[];
	//회전이미지값 받아오기 전처리
	foodpic = ("<%=f.getRenamed_Filename()%>").trim().split(",");
	
	for(var i=0; i<foodpic.length; i++){
		console.log(foodpic[i]);
		foodpic[i] = "<%=request.getContextPath()%>/upload/food/rotateimg/"+foodpic[i]
	}
	
	$("#img"+0).attr("src",foodpic[count%foodpic.length]);
	$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
	$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);
	
	var count = 0;//시작값
	$("#img-back").click(function(){
		count+=1;//초기값에 +1
		$("#img"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인 곳, 속성 src에 foodpic에서 count값에서 foodpic의 길이를 나눈 나머지의 값이 0이면 여기서 src바꿔주기  
		$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
		$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);
	});
	$("#img-front").click(function(){
		count-=1;//초기값을 -1
		if(count<0){count=foodpic.length-1;}//count가 0보다 작게 나오면 foodpic의 길이에서 -1을 뺀값을 count에 넣어줘(그럼 4)
		$("#img"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인곳, 속성src에 foodpic길이에서 count를 나눈나머지값이 0이면 id값이 0인 곳에 src를 바꿔주기 
		$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
		$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);
	});	
	
	//네이버 지도

	var mapOptions = {
	        center: new naver.maps.LatLng(37.3595704, 127.105399), //지도의 초기 중심 좌표
	        zoom: 8, //지도의 초기 줌 레벨
	        minZoom: 1, //지도의 최소 줌 레벨
	        zoomControl: true, //줌 컨트롤의 표시 여부
	        zoomControlOptions: { //줌 컨트롤의 옵션
	        position: naver.maps.Position.TOP_RIGHT,
	        mapTypeControl: true
	        }
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	var position = new naver.maps.LatLng(37.3595704, 127.105399);
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});

	
	//min/max 줌 레벨
	$("#min-max-zoom").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("minZoom") === 10) {
	        map.setOptions({
	            minZoom: 1,
	            maxZoom: 14
	        });
	        $(this).val(this.name + ': 1 ~ 14');
	    } else {
	        map.setOptions({
	            minZoom: 10,
	            maxZoom: 12
	        });
	        $(this).val(this.name + ': 10 ~ 12');
	    }
	});
	
	
	//지도 컨트롤
	$("#controls").on("click", function(e) {
	  e.preventDefault();
	
	  if (map.getOptions("scaleControl")) {
	      map.setOptions({ //모든 지도 컨트롤 숨기기
	          scaleControl: false,
	          logoControl: false,
	          mapDataControl: false,
	          zoomControl: false,
	          mapTypeControl: false
	      });
	      $(this).removeClass('control-on');
	  } else {
	      map.setOptions({ //모든 지도 컨트롤 보이기
	          scaleControl: true,
	          logoControl: true,
	          mapDataControl: true,
	          zoomControl: true,
	          mapTypeControl: true
	      });
	      $(this).addClass('control-on');
	  }
	});

	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        query: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        if (response.v2.meta.totalCount === 0) {
	            /* return alert('totalCount' + response.v2.meta.totalCount); */
	            return alert("정확한 주소를 입력해주시기 바랍니다 \n (EX:서울특별시 강남구 테헤란로 14길 6 남도빌딩)");
	        }

	        var htmlAddresses = [],
	            item = response.v2.addresses[0],
	            point = new naver.maps.Point(item.x, item.y);

	        if (item.roadAddress) {
	            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	        }

	        if (item.jibunAddress) {
	            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	        }

	        if (item.englishAddress) {
	            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	        }
	        
	        $("#road_address").val(item.roadAddress);
			console.log($("#road_address").val());
			
	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:180px;line-height:100%;">',
	            '<h5 style="margin-top:5px;">검색 주소 : '+ address +'</h5>',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));

	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}

	function initGeocoder() {

	    $('#address').on('keydown', function(e) {
	        var keyCode = e.which;

	        if (keyCode === 13) { // Enter Key
	            searchAddressToCoordinate($('#address').val());
	        }
	    });

	    $('#submit').on('click', function(e) {
	        e.preventDefault();

	        searchAddressToCoordinate($('#address').val());
	    });

	    searchAddressToCoordinate('<%=f.getBoard_MAP()%>');
	}

	function makeAddress(item) {
	    if (!item) {
	        return;
	    }

	    var name = item.name,
	        region = item.region,
	        land = item.land,
	        isRoadAddress = name === 'roadaddr';

	    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

	    if (hasArea(region.area1)) {
	        sido = region.area1.name;
	    }

	    if (hasArea(region.area2)) {
	        sigugun = region.area2.name;
	    }

	    if (hasArea(region.area3)) {
	        dongmyun = region.area3.name;
	    }

	    if (hasArea(region.area4)) {
	        ri = region.area4.name;
	    }

	    if (land) {
	        if (hasData(land.number1)) {
	            if (hasData(land.type) && land.type === '2') {
	                rest += '산';
	            }

	            rest += land.number1;

	            if (hasData(land.number2)) {
	                rest += ('-' + land.number2);
	            }
	        }

	        if (isRoadAddress === true) {
	            if (checkLastString(dongmyun, '면')) {
	                ri = land.name;
	            } else {
	                dongmyun = land.name;
	                ri = '';
	            }

	            if (hasAddition(land.addition0)) {
	                rest += ' ' + land.addition0.value;
	            }
	        }
	    }

	    return [sido, sigugun, dongmyun, ri, rest].join(' ');
	}

	function hasArea(area) {
	    return !!(area && area.name && area.name !== '');
	}

	function hasData(data) {
	    return !!(data && data !== '');
	}

	function checkLastString (word, lastString) {
	    return new RegExp(lastString + '$').test(word);
	}

	function hasAddition (addition) {
	    return !!(addition && addition.value);
	}
	
	naver.maps.onJSContentLoaded = initGeocoder;
	
	//댓글 부분
	$(function(){
		$("[name=content]").focus(function(){
			if(<%=loginMember==null%> ){
				fn_loginAlert();
			}		
		})
		$(".btn-reply").click(function(){
			if(<%=loginMember==null%>){
				fn_loginAlert();
			}
			var tr=$("<tr>");
			var html="<td style='display:none; text-align:left;' colspan='2'>";
			html+="<form action='<%=request.getContextPath()%>/foodComment/insertComment' method='post'>";
			html+='<input type="hidden" name="boardRef" value="<%=f.getBoard_No()%>" >';
			html+='<input type="hidden" name="boardCommentRef" value="'+$(this).val()+'">';
			html+='<input type="hidden" name="boardCommentLevel" value="2">';
			html+='<input type="hidden" name="boardWriter" value="<%=loginMember!=null?loginMember.getMemberId():""%>">';
			html+='<textarea name="content" cols="100" rows="3"></textarea>';
			html+='<input type="submit" value="등록"/>';
			html+= '</form></td>';
			tr.html(html);
			tr.insertAfter($(this).parent().parent()).children("td").show().slidDown(800);
			$(this).off('click')//실행후 이벤트를 중단시킴
		});
		
		$(".btn-delete").click(function(){
			if(<%=loginMember==null%>){
				fn_loginAlert();
			}
			location.href="<%=request.getContextPath()%>/foodComment/deleteComment?boardRef=<%=f.getBoard_No()%>&boardCommentNo="+$(this).val()+"";
	
		});
	});
	function fn_commentValidate(){
		if(<%=loginMember==null%>){
			fn_loginAlert();
		}
		var len = $("[name=content]").val().trim().length;
		if(len<1){
			alert("내용을 입력하세요.");
			return false;
		}
	}
	
	function fn_loginAlert() {
		alert("로그인 후 이용하세요!");
		$("[name=content]").blur();
		location.href="<%=request.getContextPath()%>/memberLogin";
	}
	
	
	</script>
	</section>
<%@ include file = "/views/common/footer.jsp" %>