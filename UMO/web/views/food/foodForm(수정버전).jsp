<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.umo.model.vo.Food,java.util.List,com.umo.model.vo.FoodComment" %>
<%@ include file = "/views/common/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=y8vul4gvp5&submodules=geocoder"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/food.css">

<style>
    .content ul {
        padding: 16px 0;
    }

    .content ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }

    .content ul li.tag-item {
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


<!-- 컨텐츠 시작-->
<div id="wrapper">
	<div id="container_wr">
		<div id="container">
		<h2 id="container_title">
			<span title="맛집게시판">맛집게시판</span>
		</h2>

<!-- 슬라이드 쇼 -->
		<div id="slider-wrap">
			<ul id="slider">
				<li data-color="#1abc9c">
					<div>
						<h3>Slide #1</h3>
						<span>Sub-title #1</span>
					</div> 
					<img class="images" src="https://fakeimg.pl/350x200/960a96/000?text=11111">
				</li>

				<li data-color="#3498db">
					<div>
						<h3>Slide #2</h3>
						<span>Sub-title #2</span>
					</div> 
					<img class="images" src="https://fakeimg.pl/350x200/D27328/000?text=22222">
				</li>

				<li data-color="#9b59b6">
					<div>
						<h3>Slide #3</h3>
						<span>Sub-title #3</span>
					</div> 
					<img class="images" src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
				</li>

				<li data-color="#34495e">
					<div>
						<h3>Slide #4</h3>
						<span>Sub-title #4</span>
					</div> 
					<img class="images" src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
				</li>

				<li data-color="#e74c3c">
					<div>
						<h3>Slide #5</h3>
						<span>Sub-title #5</span>
					</div> 
					<img class="images" src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
				</li>


			</ul>

			<!--controls-->
			<div class="btns" id="next">
				<i class="fa fa-arrow-right"></i>
			</div>
			<div class="btns" id="previous">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div id="counter"></div>

			<div id="pagination-wrap">
				<ul>
				</ul>
			</div>
			<!--controls-->
		</div>
<!--  -->
		
		<!-- 게시물 읽기 시작 { -->
		<form action="#" method="post" enctype="multipart/form-data">
		<article id="bo_v" style="width: 100%; height: auto !important;">
			<header>
				<h2 id="bo_v_title">
					<input type="text" name="title" class="frm_input full_input_title required" size="50" maxlength="200" required="required" placeholder="가게상호명을 입력하세요" autocomplete="off">
				</h2>

				<div class="content">
		            <input type="hidden" value="" name="tags" id="tags" />								
			        <ul id="tag-list">
			        </ul>
			        <input style="width: 22%;" class="frm_input" type="text" id="tag" size="15" placeholder="해시태그를 입력해주세요" />
			    </div>
			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>
				<strong>
					<span class="sv_member">작성자</span>
				</strong>
			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>
				<div class="food-subtitle">
				
					<div class="food-tel">
						전화번호 : <input class="frm_input" type="tel" name="tel" placeholder='02*-0000*-0000' id="si" pattern="[0-9]{2}-[0-9]{3}-[0-9]{4}" />
					</div>
					<div class="food-type">
						음식분류 :
						<select id="foodtype" name="foodtype" class="frm_input">
						    <option value="" disabled="disabled" selected="selected">분류 선택</option>
						    <option value="한식">한식</option>
						    <option value="중식">중식</option>
						    <option value="일식">일식</option>
   						    <option value="분식">분식</option>
						    <option value="카페">카페</option>
						    <option value="기타">기타</option>
						</select>
					</div>
					<div class="food-price">
						가격(1인기준) : 
						<select id="bills" name="bills" class="frm_input">
							<option value="" disabled="disabled" selected="selected">가격대 선택</option>
							<option value="~5,000">~5,000</option>
							<option value="5,000~10,000">5,000~10,000</option>
							<option value="10,000~15,000">10,000~15,000</option>
							<option value="15,000~20,000">15,000~20,000</option>
							<option value="20,000~25,000">20,000~25,000</option>
							<option value="25,000~">25,000~</option>
						</select>
					</div>
					<div class="food-parking">
						주차여부 :
						<input class="frm_input" type="radio" id="park" name="park" value="가능"/>가능
						<input class="frm_input" type="radio" id="park" name="park" value="불가능"/>불가능<br>
					</div>
					<div class="food-operating">
						영업시간 : 
						<input class="frm_input" type="text" id="si" name="time" placeholder="ex)오전 10:00~오후10:00"/> 
					</div>
					<div class="food-satisfy">
						만족도 : 
						<input class="frm_input" type="number" name="grade" step='10' min='0' max='100' value="0"/>
					</div>
				</div>
					
					<!-- 본문 내용 시작 { -->
				<div id="bo_v_con">	
<!-- --------------------------------------------------------------------------------------- -->
					<textarea name="ir1" id="ir1" rows="10" cols="95">
					</textarea>
<!-- ------------------------------------------------------------------------------------------------ -->
				</div>
				<!-- 지도부분 -->
				<div class="food-map" >
					<div id="map" style="width:100%;height:300px;margin-right: auto;margin-left: auto;"></div>
					<div class="search" style="position:relative; z-index:1000; top:-290px; left:-130px;">
					 	<input class="frm_input" id="address" name="address1" type="text" placeholder="검색할 주소"  style="width:200px;text-align:center;display:inline;">
					 	<input type="button" class="btn_b02 btn" id="submit" name="address2"  value="주소검색">
					 	<input type="hidden" id="road_address" name="road_address" value="">
				 	</div>
				</div>
			</section>

			<div id="bo_v_share"></div>
			
            <!-- 첨부파일 시작 { -->
			<div class="bo_w_flie write_div">
				<div class="file_wr write_div">
					<label for="bf_file_1" class="lb_icon">
						<i class="fa fa-download" aria-hidden="true"></i>
					</label>
					<input type="file" name="up_file" id="up_file" title="파일첨부  : 용량  10mb 이하만 업로드 가능" class="frm_file" multiple="multiple">
				</div>
			</div>
			<!-- 첨부파일 시작 { -->
				

			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">
				<ul class="bo_v_left">
				</ul>
				<ul class="bo_v_com">
					<li>
						<a href="#" class="btn_b02 btn">
						<i class="fa fa-pencil" aria-hidden="true"></i> 완료
						</a>
					</li>
					<li>
						<a href="#" class="btn_b01 btn">
						<i class="fa fa-pencil" aria-hidden="true"></i> 취소
						</a>
					</li>
				</ul>
			</div>
			<!-- } 게시물 상단 버튼 끝 -->

          </article>
          </form>
     </div>
		<!-- } 게시글 읽기 끝 -->
	</div>
	</div>
	</section>
</div>
</div>
</div>

<script>
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

    searchAddressToCoordinate('서울특별시 강남구 테헤란로 14길 6 남도빌딩');
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

<!-- 슬라이드쇼 script -->
<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();
$(document).ready(function(){
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });

    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 

       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
});//DOCUMENT READY
    
/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}

/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}

/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}

</script>

<!-- 해시태그 기능 -->
<script>
//해시태그 기능
var tag = {};
var counter = 0;

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

</script>

<script>
//에디터 설정부분
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
/* submit시 textarea에 데이터 저장 */
$("#frm").submit(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
});
</script>

<!-- 다중파일 업로드 -->
<script>
	var selcted_files = [];
	
	$(document).ready(function(){
		$("#up_file").on("change",function(e){
			selcted_files = []; //초기화
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			var index = 0;
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				selcted_files.push(f);
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					$(".images").eq(index).attr("src",e.target.result);
					index++;
				}
				reader.readAsDataURL(f);
			});
		});
	});
	
</script>

<%@ include file = "/views/common/footer.jsp" %>
