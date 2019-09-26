
<%@page import="com.umo.model.vo.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=y8vul4gvp5&submodules=geocoder"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<%
	
	Food f = (Food)request.getAttribute("f");

%>


<style>
	table#big-table {
		border: 2px solid goldenrod;
		margin-top: 5px;
		margin-left: auto;
		margin-right: auto;
		border-spacing: 0px;
	}

	table#sml-table {
		border: 2px solid goldenrod;
		margin-left: auto;
		margin-right: auto;
		border-spacing: 50px 20px;
		width: 1000px;
		height: 100px;
	}
	button#downfile{
		margin-left:700px;
	}
	/* th,td{
		border: 1px solid blue;
	} */
	input#si {
	margin-RIGHT:auto;
  	width:500px;
 	 height:40px;
  	font-size:20px;
}
	input#downfile{
	margin-left: 680px;
	}
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

    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }
</style>
<section>
	<form id="frm" action ="<%=request.getContextPath() %>/food/foodUpdateEnd?board_no=<%= f.getBoard_No() %>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getMemberId():""%>"> 
	<div>
	<div id="thumnail" style="margin-left:auto; margin-right:auto; margin-top:100px; width: 600px; height: 400px; border: 1px solid red;">
		<img id="thumnail_image" src="<%=request.getContextPath()%>/upload/food/thumnail/<%= f.getBoard_Thumbnail() %>" style="width: 600px; height: 400px;" >
	</div>
	<input style="margin-left: auto; margin-right: auto;" id="thumnail_select" name="thumnail_select" type="file" value="<%= f.getBoard_Thumbnail() %>">
	<input type="hidden" name="hidden_thumnail" value="<%= f.getBoard_Thumbnail() %>">
	<table id="big-table">
		<tr>
			<th style="background-color:black;">  	
				<button id="img-back" type="button" style="border:none;padding:0px;"><img src="<%=request.getContextPath()%>/images/foodpoint/back.jpg" width="50px" height="205px"></button>
			</th> 
			<th colspan="3" style="background-color:white;" >
				<div id="img-container">
					<img id="img0" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
					<img id="img1" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png"> 
					<img id="img2" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
					<!-- 다중 이미지 파일명 저장용 -->
					<input id="ori_file" type="hidden" name="ori_file" value="<%=f.getOriginal_Filename()%>">
					<input id="renamed_file" type="hidden" name="renamed_file" value="<%=f.getRenamed_Filename()%>">
				</div>
			</th>
			<th style="background-color:white;">
				<button id="img-front" type="button" style="border: none; padding:0px 0px 0px 0px; " ><img src="<%=request.getContextPath()%>/images/foodpoint/front.jpg" width="50px" height="205px"></button>
			</th>
		</tr>
		<tr>
			<td colspan="5">
					<input type="file" name="upfile" id="upfile" style="display:inline;" multiple /><!--multiple은 다중값으로 갖고 올수 있는 것   -->
					<input type="button" name="downfile" id="downfile" value="사진삭제">
					
					<table id="sml-table">
						<tr>
							<td>
								제목<input type="text" id="si" placeholder="가게상호명을 입력하세요" name="title" value="<%=f.getBoard_Title() %>"><br>
							</td>
						</tr>
						<tr>
							<td>
								해시태그
								<div class="content">
						            <input type="hidden" value="" name="tags" id="tags" />								
							        <ul id="tag-list">
							        </ul>
							        <input type="text" id="tag" size="7" placeholder="태그입력" />
							    </div>
							</td>
						<tr>
							<td>
								
								전화번호</br>
								<input type="tel" name="tel" placeholder='02*-0000*-0000' id="si" pattern="[0-9]{2}-[0-9]{3}-[0-9]{4}" value="<%=f.getBoard_tel()%>"/><br>
								음식종류<br>
								<input type="radio" id="foodtype" name="foodtype" value="한식" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("한식")?"checked":""%>/>한식
								<input type="radio" id="foodtype" name="foodtype" value="중식" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("중식")?"checked":""%>/>중식
								<input type="radio" id="foodtype" name="foodtype" value="일식" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("일식")?"checked":""%>/>일식
								<input type="radio" id="foodtype" name="foodtype" value="분식" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("분식")?"checked":""%>/>분식
								<input type="radio" id="foodtype" name="foodtype" value="카페" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("카페")?"checked":""%>/>카페
								<input type="radio" id="foodtype" name="foodtype" value="기타" <%=f.getBoard_foodtype()!=null&&f.getBoard_foodtype().equals("기타")?"checked":""%>/>기타
								
								<br>
								가격(1인기준)<br>
								<input type="radio" id="bills" name="bills" value="~5,000" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("~5,000")?"checked":"" %>/>~5,000<br>
								<input type="radio" id="bills" name="bills" value="5,000~10,000" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("5,000~10,000")?"checked":"" %>/>5,000~10,000<br>
								<input type="radio" id="bills" name="bills" value="10,000~15,000" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("10,000~15,000")?"checked":"" %>/>10,000~15,000<br>
								<input type="radio" id="bills" name="bills" value="15,000~20,000" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("15,000~20,000")?"checked":"" %>/>15,000~20,000<br>
								<input type="radio" id="bills" name="bills" value="20,000~25,000" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("20,000~25,000")?"checked":"" %>/>20,000~25,000<br>
								<input type="radio" id="bills" name="bills" value="25,000~" <%=f.getBoard_foodbill()!=null&&f.getBoard_foodbill().equals("25,000~")?"checked":"" %>/>25,000~<br>
							</td>
						
						</tr>
						<tr>
							<td>
								주차여부
								<input type="radio" id="park" name="park" value="가능" <%=f.getBoard_park()!=null&&f.getBoard_park().equals("가능")?"checked":"" %>/>가능
								<input type="radio" id="park" name="park" value="불가능" <%=f.getBoard_park()!=null&&f.getBoard_park().equals("불가능")?"checked":"" %>/>불가능<br>
							</td>
						</tr>
						<tr>
							<td>
           						 영업시간 <input type="text" id="si" name="time" placeholder="ex)오전 10:00 ~오후10:00" value="<%=f.getBoard_open()%>"/> 
								
							</td>
						</tr>
						<tr>
							<td>
								만족도<input type="number" name="grade" step='10' min='0' max='100' value="<%=f.getBoard_Grade() %>"/>
							</td>
						</tr>
						<tr>
							<td>
								<h3>내용</h3>
									<textarea name="ir1" id="ir1" rows="10" cols="100">
										<%=f.getBoard_Contents() %>
									</textarea>
							</td>
						</tr>
						 <tr>
							<td><!--지도  -->
								<div id="map" style="width:100%;height:400px;margin-right: auto;margin-left: auto;">
									 <div class="search" style="position:absolute; z-index:1000; top:20px; left:20px;">
									 	<input id="address" name="address1" type="text" placeholder="검색할 주소" style="width:200px; text-align:center; display:inline;" value="<%=f.getBoard_MAP()%>">
									 	<input id="submit" name="address2" type="button" value="주소검색">
									 	<input type="hidden" id="road_address" name="road_address" value="<%=f.getBoard_MAP()%>">
									 </div>
								</div>

							</td>
						</tr>
						<tr>
							<td>
								<input id="savebutton" type="submit" value="완료" style="margin-left: 40%; display:inline;"/>
								<input type="button" value="취소"  id="btn_cancel;" onclick="location.href='<%=request.getContextPath()%>/food/foodList'"/>
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>
	</div>
	</form>

<script>
	//해시태그 초기화
	var tags = "<%=f.getBoard_menu()%>".split(",")
	var counter = 0;
	var tag = {};
	
	$.each(tags,function(i,item){
		addTag(tags[i]);
		$("#tag-list").append("<li class='tag-item'>"+"#"+item+"<span class='del-btn' idx='"+i+"'>x</span></li>");
	});
	
	// 태그를 추가한다.
    function addTag (value) {
        tag[counter] = value; // 태그를 Object 안에 추가
        counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
    }
    
    $("#tag").on("keypress", function (e) {
        // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
        if (e.key === "Enter" || e.keyCode == 32) {
            var tagValue = $(this).val(); // 값 가져오기
            // 값이 없으면 동작 ㄴㄴ
            if (tagValue !== "") {
                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
                // 태그 중복 검사
                if (result.length == 0) { 
                    $("#tag-list").append("<li class='tag-item'>"+"#"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    $(this).val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

    // 삭제 버튼 
    // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });


	var foodpic=[];
	//회전이미지값 받아오기 전처리
	foodpic = ("<%=f.getRenamed_Filename()%>").split(",");
	
	for(var i=0; i<foodpic.length; i++){
		foodpic[i] = "<%=request.getContextPath()%>/upload/food/rotateimg/"+foodpic[i]
	}
	
	$("#img"+0).attr("src",foodpic[count%foodpic.length]);
	$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
	$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/upload/food/contentimg/'+filepath+'">';
	    oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
	}
	
	//썸네일 이미지 부분
	$("#thumnail_select").change(function(){
		var reader = new FileReader();
		reader.onload = function(e){
			$("#thumnail_image").attr({"src":e.target.result}).css({"width":"600px","height":"400px"});
		}
		reader.readAsDataURL($(this)[0].files[0]); //파일리더가 파일을 읽어들여온다.
		console.log($("#thumnail_select").val());
	});

	var count = 0;//시작값
	$("#img-back").click(function(){
		count+=1;//초기값에 +1
		$("#img"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인 곳, 속성 src에 foodpic에서 count값에서 foodpic의 길이를 나눈 나머지의 값이 0이면 여기서 src바꿔주기  
		$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
		$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);
		console.log(count);
	});
	$("#img-front").click(function(){
		count-=1;//초기값을 -1
		if(count<0){count=foodpic.length-1;}//count가 0보다 작게 나오면 foodpic의 길이에서 -1을 뺀값을 count에 넣어줘(그럼 4)
		$("#img"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인곳, 속성src에 foodpic길이에서 count를 나눈나머지값이 0이면 id값이 0인 곳에 src를 바꿔주기 
		$("#img"+1).attr("src",foodpic[(count+1)%foodpic.length]);
		$("#img"+2).attr("src",foodpic[(count+2)%foodpic.length]);
		console.log(count);
	});
			
	//다중 사진 업로드, 파일선택 부분 코드
	
	var validation = false;

	$("#upfile").change(function(){
		foodpic = [];
		$.each($(this)[0].files,function(i,item){
			var reader = new FileReader();
			reader.onload=function(e){									
				if(i<3){
					$("#img"+i).attr({"src":e.target.result}).css({"width":"300px","height":"200px"});
				}
				foodpic.push(e.target.result);
			}
			reader.readAsDataURL(item);
		});
		
		form_validation();
		
	});
	
	function form_validation() {		
		var fd = new FormData();
		$.each($("#upfile")[0].files,function(i,item){
			fd.append("file"+i,item);
		});

		$.ajax({
			url:"<%= request.getContextPath() %>/ajaxFile",
			data:fd,
			type:"post", //무조건 post로 전송
			processData: false,
			contentType:false,
			success : function(data){
				$("#ori_file").val(data.split("/")[0]);
				$("#renamed_file").val(data.split("/")[1]);
				validation = true;
			},
			error : function(request,status,error){
				validation = false;
			}
		});
	}
	
	$("#frm").submit(function(){
		if(foodpic.length>0){			
			validation = true;
		}
		if(validation){
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
			
			var tags = "";
			
			for(var i=0; i<counter; i++){
				if(tag[i] != "") {
					tags += tag[i] + ",";											
				}
			}
			tags = tags.substring(0,tags.length-1);
			$("#tags").val(tags);
			
			return true;
		}else {
			return false;
		}
	});
			
	$("#downfile").on("click",function(){
		$("#img"+0).attr({"src":"<%=request.getContextPath()%>/images/foodpoint/noimg.png"});
		$("#img"+1).attr({"src":"<%=request.getContextPath()%>/images/foodpoint/noimg.png"});
		$("#img"+2).attr({"src":"<%=request.getContextPath()%>/images/foodpoint/noimg.png"});
		foodpic=[];
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
	
	//클릭한 지점으로 마커 옮기기
	
	$("#interaction, #tile-transition, #controls").addClass("control-on");
	
	var marker = new naver.maps.Marker({
	    position: position,
	    map: map
	});
	
	naver.maps.Event.addListener(map, 'click', function(e) {
	    marker.setPosition(e.coord);
	});
	
	//주소와 좌표 검색  API 사용하기
	map.setCursor('pointer');
	
	function searchCoordinateToAddress(latlng) {

	    infoWindow.close();

	    naver.maps.Service.reverseGeocode({
	        coords: latlng,
	        orders: [
	            naver.maps.Service.OrderType.ADDR,
	            naver.maps.Service.OrderType.ROAD_ADDR
	        ].join(',')
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var items = response.v2.results,
	            address = '',
	            htmlAddresses = [];

	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            address = makeAddress(item) || '';
	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
	        }

	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
	            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));

	        infoWindow.open(map, latlng);
	    });
	}

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
	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
	            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));

	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}

	function initGeocoder() {
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });

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
	    searchAddressToCoordinate("<%=f.getBoard_MAP()%>");
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
	
</script>


</section>
<%@ include file="/views/common/footer.jsp"%>