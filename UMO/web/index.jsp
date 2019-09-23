<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/views/common/error.jsp"%>
<!-- 외부파일을 불러오는 지시자 -> include -->
<%@ include file="views/common/header.jsp" %>
<style>
.foodimg{
width:30px;
height:30px;


}
</style>

<!-- Intro -->

<section id="intro" class="main style1" >
        <div class="content">
                <h2>안녕.</h2>
            <p>ㅎㅇㅎㅇㅎㅇ</p>
                <button class="move1 cursor">이동</button>
        </div>
</section>

<!-- One -->
    <section id="one" class="main style2" style="overflow: hidden;">
        <div class="content box style2" >
                <h2>공지게시판</h2>
            <div id="noticeboard" style="border:0px solid">
            
            </div>
        </div>
        <div class="content box style2" id="trans1" style="transform: translateX(150%) translateY(-100%);">
                <h2>자유게시판</h2>
		<div id="freeboard" style="border:0px solid">
		
		</div>
        </div>
        <div style="margin-top: -10%;">
            <button class="move2 cursor">이동</button>
        </div>
    </section>

<!-- Two -->
<section id="two" class="main style2" style="overflow: hidden;">
        <div class="content box style2">
                <h2>익명게시판</h2>
                <div id="anonymousboard"></div>
        </div>
        <div class="content box style2" id="trans2" style="transform: translateX(150%) translateY(-100%);" >
                <h2>질의게시판</h2>
            <div id="inqeurymousboard"></div>
        </div>
        <div style="margin-top: -10%;">
            <button class="move3 cursor">이동</button>
        </div>
    </section>

<!-- Work -->
<section id="work" class="main style3 primary">
        <div class="content">
                <h2>사진</h2>
                <p>사진</p>

 <!-- Gallery  -->
            <div class="gallery">
                <article>
                    <a href="images/fulls/01.jpg"><img class="galleryimage" src="images/food/BathBurger.jpg" title="The Anonymous Red" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/02.jpg"><img class="galleryimage" src="images/food/ihwasuyuggaejang.jpg" title="Airchitecture II" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/03.jpg"><img class="galleryimage" src="images/food/itaelibudaejjigae.jpg" title="Air Lounge" alt="" /></a>
                </article>
            </div>
            <br>
            <div class="gallery">
              <article>
                    <a href="images/fulls/04.jpg"><img class="galleryimage" src="images/food/jijonjjamppong.jpg" title="Carry on" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/05.jpg"><img class="galleryimage" src="images/food/mabuyugjeon.jpg" title="The sparkling shell" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/06.jpg"><img class="galleryimage" src="images/food/naiseusyawo.jpg" title="Bent IX" alt="" /></a>
                </article>
            </div>

        </div>
    </section>
           <!-- Gallery  -->
            <!-- <div class="gallery">
                <article>
                    <a href="images/fulls/01.jpg"><img class="galleryimage" src="images/food/BathBurger.jpg" title="The Anonymous Red" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/02.jpg"><img class="galleryimage" src="images/food/ihwasuyuggaejang.jpg" title="Airchitecture II" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/03.jpg"><img class="galleryimage" src="images/food/itaelibudaejjigae.jpg" title="Air Lounge" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/04.jpg"><img class="galleryimage" src="images/food/jijonjjamppong.jpg" title="Carry on" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/05.jpg"><img class="galleryimage" src="images/food/mabuyugjeon.jpg" title="The sparkling shell" alt="" /></a>
                </article>
                <article>
                    <a href="images/fulls/06.jpg"><img class="galleryimage" src="images/food/naiseusyawo.jpg" title="Bent IX" alt="" /></a>
                </article>
            </div>
        </div>
    </section> -->


<!-- Contact -->
<section id="contact" class="main style3 secondary">
        <div class="content">
                <h2>문의사항</h2>
                <p>door의4항</p>
            <div class="box" style="margin: auto;">
                <form method="post" action="#">
                    <div class="fields">
                        <!-- <div class="field half"><input type="text" name="name" placeholder="Name" /></div> -->
                        <div class="field half"><input type="email" name="email" placeholder="Email" /></div>
                        <br>
                        <div class="field"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
                    </div>
                    <ul>
                        <li><input type="submit" value="Send Message"  style="transform: translateY(35%);border: 0;border-radius: 3.5em;color: #ffffff;padding: 0 2em 0 2em;
                        height: 3.5em;"/></li>
                    </ul>
                </form>
            </div>
        </div>
    </section>
    
<script>
$('.move1').click(function(){
    var scroll=$('#one').offset();
    $('html').animate({scrollTop:scroll.top},1000)
});
$('.move2').click(function(){
    var scroll=$('#two').offset();
    $('html').animate({scrollTop:scroll.top},1000)
});
$('.move3').click(function(){
    var scroll=$('#work').offset();
    $('html').animate({scrollTop:scroll.top},1000)
});

$(document).ready(function(){
	var result="";
$.ajax({
	url : "<%=request.getContextPath()%>/noticeBoard", 
	dataType:"text",
	type : "post", 
	success : function(data){ 

		 var noticeboardlist=data.substring(1,data.length-1).split("<tr>");
		 for(var i = 3 ; i<noticeboardlist.length-1; i++){
			result += noticeboardlist[i].split(",")+"\n";
		}
		$('#noticeboard').html("<table class='table table-striped table-bordered table-hover'>"+result); 

	}
});
var result2="";
$.ajax({
	url : "<%=request.getContextPath()%>/freeBoard", 
	dataType:"text",
	type : "post", 
	success : function(data){ 

		 var freeboardlist=data.substring(1,data.length-1).split("<tr>");
		 for(var i = 3 ; i<8; i++){
			/* result2 += freeboardlist[i].split(",")+"\n"; */
		}
		$('#freeboard').html("<table class='table table-striped table-bordered table-hover'>"+result2); 

	}
});
 var result3="";
$.ajax({
	url : "<%=request.getContextPath()%>/anonymousBoard", 
	dataType:"text",
	type : "post", 
	success : function(data){ 
		console.log(data);
		 var anonymousBoardlist=data.substring(1,data.length-1).split("<tr>");
		 for(var i = 3 ; i<8; i++){
			/* result3 += anonymousBoardlist[i].split(",")+"\n"; */
		}
		$("#anonymousboard").html("<table class='table table-striped table-bordered table-hover'>"+result3); 

	}
});
var result5="";
$.ajax({
	url : "<%=request.getContextPath()%>/food/foodList",
	dataType:"text",
	type : "post", 
	success : function(data){ 
		 var foodboardlist=data.substring(1,data.length-1).split("<tr>");
			 for(var i = 3 ; i<foodboardlist.length-1; i++){
					result5 += foodboardlist[i].split(",")+"\n";
				}
			 $('#foodboard').html("<table class='table table-striped table-bordered table-hover'>"+result5); 
	}
	
});
});

</script>
	
<%@ include file="views/common/footer.jsp" %>	







