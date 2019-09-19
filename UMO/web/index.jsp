<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/views/common/error.jsp"%>
<!-- 외부파일을 불러오는 지시자 -> include -->
<%@ include file="views/common/header.jsp" %>
<!-- Intro -->

<section id="intro" class="main style1" >
        <div class="content">
            <header>
                <h2>안녕.</h2>
            </header>
            <p>ㅎㅇㅎㅇㅎㅇ</a>.</p>
            <footer>
                <button class="move1 cursor">이동</button>
            </footer>
        </div>
    </section>

<!-- One -->
    <section id="one" class="main style2" style="overflow: hidden;">
        <div class="content box style2" >
            <header>
                <h2>게시판1</h2>
            </header>
            <p>호로로로롤</p>
        </div>
        <div class="content box style2" id="trans1" style="transform: translateX(120.9%) translateY(-100%);">
            <header>
                <h2>게시판2</h2>
            </header>
            <p>ㅎ로로로롤</p>
        </div>
        <div style="margin-top: -10%;">
            <button class="move2 cursor">이동</button>
        </div>
    </section>

<!-- Two -->
<section id="two" class="main style2" style="overflow: hidden;">
        <div class="content box style2">
            <header>
                <h2>게시판3</h2>
            </header>
            <p>33333333333333</p>
        </div>
        <div class="content box style2" id="trans2" style="transform: translateX(120.9%) translateY(-100%);" >
            <header>
                <h2>게시판4</h2>
            </header>
            <p>44444444444</p>
        </div>
        <div style="margin-top: -10%;">
            <button class="move3 cursor">이동</button>
        </div>
    </section>

<!-- Work -->
<section id="work" class="main style3 primary">
        <div class="content">
            <header>
                <h2>사진</h2>
                <p>사진</p>
            </header>

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


<!-- Contact -->
<section id="contact" class="main style3 secondary">
        <div class="content">
            <header>
                <h2>문의사항</h2>
                <p>door의4항</p>
            </header>
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

</script>
	
<%@ include file="views/common/footer.jsp" %>	







