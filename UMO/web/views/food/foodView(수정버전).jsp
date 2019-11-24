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
					</div> <img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
				</li>

				<li data-color="#3498db">
					<div>
						<h3>Slide #2</h3>
						<span>Sub-title #2</span>
					</div> <img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
				</li>

				<li data-color="#9b59b6">
					<div>
						<h3>Slide #3</h3>
						<span>Sub-title #3</span>
					</div> <img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
				</li>

				<li data-color="#34495e">
					<div>
						<h3>Slide #4</h3>
						<span>Sub-title #4</span>
					</div> <img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
				</li>

				<li data-color="#e74c3c">
					<div>
						<h3>Slide #5</h3>
						<span>Sub-title #5</span>
					</div> <img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
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

		<article id="bo_v" style="width: 100%; height: auto !important;">
			<header>
				<h2 id="bo_v_title">
					<span style="display: inline-block; margin-right: 5px;" class="bo_v_tit">타이틀</span>
					<span>#태그</span>
				</h2>
		
               	<a href="#" id="ol_after_scrap" class="win_scrap">스크랩
                <strong class="scrap"><i class="fa fa-thumb-tack" aria-hidden="true"></i></strong>
                </a>

			</header>

			<section id="bo_v_info">
				<h2>페이지 정보</h2>
				<strong><span
					class="sv_member">작성자</span></strong><strong><a
					href="#bo_vc"> <i class="fa fa-commenting-o" aria-hidden="true"></i>
						건(댓글)</a></strong>
					<strong>
					<i class="fa fa-eye" aria-hidden="true"></i> 회(조회수)</strong>
					<strong class="if_date">
					<i class="fa fa-clock-o" aria-hidden="true"></i> 작성일</strong>

			</section>

			<section id="bo_v_atc">
				<h2 id="bo_v_atc_title">본문</h2>

				<div id="bo_v_img"></div>
				<div class="food-subtitle">
				
					<div class="food-tel">
						전화번호 : 
					</div>
					<div class="food-type">
						음식 종류 :
					</div>
					<div class="food-price">
						가격(1인기준) : 
					</div>
					<div class="food-parking">
						주차여부 :
					</div>
					<div class="food-operating">
						영업시간 : 
					</div>
					<div class="food-satisfy">
						만족도 : 
					</div>
				</div>
					
					<!-- 본문 내용 시작 { -->
				<div id="bo_v_con">
						
<!-- --------------------------------------------------------------------------------------- -->
						본문내용

<!-- ------------------------------------------------------------------------------------------------ -->
				</div>
				<!-- 지도부분 -->
				<div class="food-map" >
					<div id="map" style="width:100%;height:300px;margin-right: auto;margin-left: auto;"></div>
					<div class="search" style="position:absolute; z-index:9999; top:20px; left:20px;">
					 	<input type="hidden" id="road_address" name="road_address" value="서울특별시 강남구 테헤란로 14길 6 남도빌딩">
					 </div>
				</div>
			</section>

			<div id="bo_v_share"></div>



			<!-- 게시물 상단 버튼 시작 { -->
			<div id="bo_v_top">

				<ul class="bo_v_left">
				</ul>

				<ul class="bo_v_com">
					<li>
					<a href="#"
						class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i>목록</a>
					</li>
					<li><a href="#" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 수정</a></li>
					<li><a href="#" class="btn_b02 btn"><i
							class="fa fa-pencil" aria-hidden="true"></i> 삭제</a></li>
				</ul>

 				<ul class="bo_v_nb">
					<li class="btn_prv"><span class="nb_tit"><i
						class="fa fa-caret-up" aria-hidden="true"></i> 이전글</span>
						<a href="">이전 글이 없습니다.</a> 

						<span class="nb_date">이전글 작성일</span></li>
					<li class="btn_next"><span class="nb_tit"><i
						class="fa fa-caret-down" aria-hidden="true"></i> 다음글</span>
						<a href="">다음 글이 없습니다.</a> 
						<span class="nb_date">다음글작성일</span></li>
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
					<header style="z-index: 2">
						<h2>님의 댓글</h2>
						<span class="sv_member">의 댓글</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00">댓글작성일</time></span>
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p>댓글내용</p>
						<ul class="bo_vc_act">
							<li>
								<button id="btn-reply" class="btn_b03 btn-reply" value="답변">답변</button>
							</li>
							<li>
								<a href='#' onclick="comment_delete();" class="btn_b03">댓글삭제</a>
							</li>
						</ul>
					</div>
					</article>
					<!-- 레벨2댓글 구현부 -->
					<article style="margin-left: 50px">
					<header style="z-index: 2">
						<h2>님의 답변</h2>
						<span class="sv_member">의 답변</span>
						<span class="bo_vc_hdinfo"><i class="fa fa-clock-o"
							aria-hidden="true"></i> <time
								datetime="2019-09-29T16:47:00+09:00">2레벨댓글작성일</time></span>
							
					</header>
					<!-- 댓글 출력 -->
					<div class="cmt_contents">
						<p>2레벨댓글내용</p>
						<ul class="bo_vc_act">
							<li><a href='#'
								onclick="comment_delete();" class="btn_b03">삭제</a></li>
						</ul>
					</div>
			    	</article>
			</section>
			<!-- } 댓글 끝 -->

			<!-- 댓글 쓰기 시작 { -->
			<aside id="bo_vc_w" class="bo_vc_w">
				<h2>댓글쓰기</h2>
				<form name="fviewcomment" id="fviewcomment"
					action="#"
					onsubmit="" method="post"
					autocomplete="off">

					<textarea id="wr_content" name="wr_content" maxlength="10000"
						required class="required" title="내용" placeholder="댓글내용을 입력해주세요"></textarea>

					<div class="bo_vc_w_wr">
						<div class="btn_confirm">
							 <input type="submit"
								id="btn_submit" class="btn_submit" value="댓글등록">
						</div>
					</div>
					<!-- insert용 정보 저장 -->
					<input type="hidden" name="boardRef" value=""/>
					<input type="hidden" name="boardCommentRef" value="0"/>
					<input type="hidden" name="boardCommentLevel" value="1"/>
					<input type="hidden" name="boardWriter" value=""/>
				</form>
			</aside>
          </article>
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

<%@ include file = "/views/common/footer.jsp" %>
