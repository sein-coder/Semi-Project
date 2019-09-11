



    $(document).ready(function(){
    	
    	$(".gecipan1,#subcenter-menu1").mouseenter(function(){
    		if($('#subcenter-menu1').css("display")=="none"){
    			$('#subcenter-menu1').css("display","block");
    			$('#subcenter-menu2').css("display","none");
    		}
    	});
    /*	$(".gongji,#subcenter-menu1").mouseleave(function(){
    		if($('#subcenter-menu1').css("display")=="block"){
    			$('#subcenter-menu1').css("display","none")
    		}
    	});*/
    	$(".gecipan2,#subcenter-menu2").mouseenter(function(){
    		if($('#subcenter-menu2').css("display")=="none"){
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","block");
    		}
    	});
    	/*$(".gecipan,#subcenter-menu2").mouseleave(function(){
    		if($('#subcenter-menu2').css("display")=="block"){
    			$('#subcenter-menu2').css("display","none")
    		}
    	});*/
    	$(".gecipan4").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	$(".gecipan5").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	$(".gecipan6").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	$(".gecipan7").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	$(".gecipan3").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	$(".gecipan3").mouseenter(function(){
    		/*if($('#subcenter-menu2').css("display")=="none"){*/
    			$('#subcenter-menu1').css("display","none");
    			$('#subcenter-menu2').css("display","none");
    		/*}*/
    	});
    	
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
$(".menu>a").click(function(){
    var submenu = $(this).next("ul");
    // submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
    if( submenu.is(":visible") ){
        submenu.slideUp();
    }else{
        submenu.slideDown();
    }
});
});

function doDisplay(){
var menuview = document.getElementsByClassName("menuview")[0];
var header=document.getElementById("header");
var intro=document.getElementById('intro');
var one=document.getElementById('one');
var two=document.getElementById('two');
var work=document.getElementById('work');
var contact=document.getElementById('contact');
var footer=document.getElementById('footer');
var trans1=document.getElementById('trans1');
var trans2=document.getElementById('trans2');

if(menuview.style.display=='block'){
    menuview.style.display='none';
    // header.style.left='0';
    // header.style.width='100%';
    intro.style.marginLeft='0%';
    intro.style.width='100%';
    one.style.marginLeft='0%';
    one.style.width='100%';
    two.style.marginLeft='0%';
    two.style.width='100%';
    work.style.marginLeft='0%';
    work.style.width='100%';
    contact.style.marginLeft='0%';
    contact.style.width='100%';
    // footer.style.marginLeft='0%';
    // footer.style.width='100%';

}else{
    menuview.style.display ='block';
    // header.style.left='10.2%';
    // header.style.width='89.8%';
    intro.style.marginLeft='10%';
    intro.style.width='90%';
    one.style.marginLeft='10%';
    one.style.width='90%';
    two.style.marginLeft='10%';
    two.style.width='90%';
    work.style.marginLeft='10%';
    work.style.width='90%';
    contact.style.marginLeft='10%';
    contact.style.width='90%';
    // footer.style.marginLeft='10%';
    // footer.style.width='90%';
}
}