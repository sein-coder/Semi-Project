var count = 1;
function calendarbutton() {
    if (count % 2 == 1) {
        $(".calendarview").css("display", "block");
        count++;
    } else if (count % 2 == 0) {
        $(".calendarview").css("display", "none");
        count++;
    }
}

var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();//today의 Date를 세어주는 역할
function prevCalendar() {//이전 달
    // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
    buildCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() {//다음 달
    // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar();//달력 cell 만들어 출력
}
function buildCalendar() {//현재 달 달력 만들기
    var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    //이번 달의 첫째 날,
    //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
    //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
    //왜냐면 getMonth()는 0~11을 반환하기 때문
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    //이번 달의 마지막 날
    //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
    //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
    //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
    var tbCalendar = document.getElementById("calendar");
    //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
    var tbCalendarYM = document.getElementById("tbCalendarYM");
    //테이블에 정확한 날짜 찍는 변수
    //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
    //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
    tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

    /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
    while (tbCalendar.rows.length > 2) {
        //열을 지워줌
        //기본 열 크기는 body 부분에서 2로 고정되어 있다.
        tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
        //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
    }
    var row = null;
    row = tbCalendar.insertRow();
    //테이블에 새로운 열 삽입//즉, 초기화
    var cnt = 0;// count, 셀의 갯수를 세어주는 역할
    // 1일이 시작되는 칸을 맞추어 줌
    for (i = 0; i < doMonth.getDay(); i++) {
        /*이번달의 day만큼 돌림*/
        cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
        cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
    }
    /*달력 출력*/
    for (i = 1; i <= lastDate.getDate(); i++) {
        //1일부터 마지막 일까지 돌림
        cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
        cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
        cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
        if (cnt % 7 == 1) {/*일요일 계산*/
            //1주일이 7일 이므로 일요일 구하기
            //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
            cell.innerHTML = "<font color=red>" + i
            //1번째의 cell에만 색칠
        }
        if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
            //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
            cell.innerHTML = "<font color=skyblue>" + i
            //7번째의 cell에만 색칠
            row = calendar.insertRow();
            //토요일 다음에 올 셀을 추가
        }
        /*오늘의 날짜에 노란색 칠하기*/
        if (today.getFullYear() == date.getFullYear()
            && today.getMonth() == date.getMonth()
            && i == date.getDate()) {
            //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
            cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
        }
    }
}
$(document).ready(function () {
    buildCalendar();//
    
    
});




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

    function doDisplay() {
        var menuview = document.getElementsByClassName("menuview")[0];
        var header = document.getElementById("header");
        var intro = document.getElementById('intro');
        var one = document.getElementById('one');
        var two = document.getElementById('two');
        var work = document.getElementById('work');
        var contact = document.getElementById('contact');
        var footer = document.getElementById('footer');
        var trans1 = document.getElementById('trans1');
        var trans2 = document.getElementById('trans2');

        if (menuview.style.display == 'block') {
            menuview.style.display = 'none';
            // header.style.left='0';
            header.style.width='100%';
            intro.style.marginLeft = '0%';
            intro.style.width = '100%';
            one.style.marginLeft = '0%';
            one.style.width = '100%';
            two.style.marginLeft = '0%';
            two.style.width = '100%';
            work.style.marginLeft = '0%';
            work.style.width = '100%';
            contact.style.marginLeft = '0%';
            contact.style.width = '100%';
            // footer.style.marginLeft='0%';
            // footer.style.width='100%';

        } else {
            menuview.style.display = 'block';
            // header.style.left='10.2%';
            // header.style.width='89.8%';
            intro.style.marginLeft = '150px';
            intro.style.width ='calc(100% - 150px)';
            one.style.marginLeft = '150px';
            one.style.width = 'calc(100% - 150px)';
            two.style.marginLeft = '150px';
            two.style.width = 'calc(100% - 150px)';
            work.style.marginLeft = '150px';
            work.style.width = 'calc(100% - 150px)';
            contact.style.marginLeft = '150px';
            contact.style.width = 'calc(100% - 150px)';
            // footer.style.marginLeft='10%';
            // footer.style.width='90%';
        }
    }