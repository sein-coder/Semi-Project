<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<title>사진 첨부하기 :: SmartEditor2</title>
<style type="text/css">
/* NHN Web Standard 1Team JJS 120106 */ 
/* Common */
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
body,input,textarea,select,button,table{font-family:'돋움',Dotum,Helvetica,sans-serif;font-size:12px}
img,fieldset{border:0}
ul,ol{list-style:none}
em,address{font-style:normal}
a{text-decoration:none}
a:hover,a:active,a:focus{text-decoration:underline}

/* Contents */
.blind{visibility:hidden;position:absolute;line-height:0}
#pop_wrap{width:383px}
#pop_header{height:26px;padding:14px 0 0 20px;border-bottom:1px solid #ededeb;background:#f4f4f3}
.pop_container{padding:11px 20px 0;}
#pop_footer{margin:21px 20px 0;padding:10px 0 16px;border-top:1px solid #e5e5e5;text-align:center}
h1{color:#333;font-size:14px;letter-spacing:-1px}
.btn_area{word-spacing:2px}
.pop_container .drag_area{overflow:hidden;overflow-y:auto;position:relative;width:341px;height:129px;margin-top:4px;border:1px solid #eceff2}
.pop_container .drag_area .bg{display:block;position:absolute;top:0;left:0;width:341px;height:129px;background:#fdfdfd url(./smartEditor2/img/fileUpload/bg_drag_image.png) 0 0 no-repeat}
.pop_container .nobg{background:none}
.pop_container .bar{color:#e0e0e0}
.pop_container .lst_type li{overflow:hidden;position:relative;padding:7px 0 6px 8px;border-bottom:1px solid #f4f4f4;vertical-align:top}
.pop_container :root .lst_type li{padding:6px 0 5px 8px}
.pop_container .lst_type li span{float:left;color:#222}
.pop_container .lst_type li em{float:right;margin-top:1px;padding-right:22px;color:#a1a1a1;font-size:11px}
.pop_container .lst_type li a{position:absolute;top:6px;right:5px}
.pop_container .dsc{margin-top:6px;color:#666;line-height:18px}
.pop_container .dsc_v1{margin-top:12px}
.pop_container .dsc em{color:#13b72a}
.upload{margin:0 4px 0 0;_margin:0;padding:6px 0 4px 6px;border:solid 1px #d5d5d5;color:#a1a1a1;font-size:12px;border-right-color:#efefef;border-bottom-color:#efefef;length:300px;}
:root  .upload{padding:6px 0 2px 6px;}
</style>
</head>
<body>
<div id="pop_wrap">
	<!-- header -->
    <div id="pop_header">
        <h1>사진 첨부하기</h1>
    </div>
    <!-- //header -->
    <!-- container -->
	
    <!-- [D] HTML5인 경우 pop_container 클래스와 하위 HTML 적용
	    	 그밖의 경우 pop_container2 클래스와 하위 HTML 적용      -->
    <!-- //content -->
    <div id="pop_container" class="pop_container">
    	<!-- content -->
        <div id="pop_content">
	        <p class="dsc"><em id="imageCountTxt">0장</em>/10장 <span class="bar">|</span> <em id="totalSizeTxt">0MB</em>/50MB</p>
        	<!-- [D] 첨부 이미지 여부에 따른 Class 변화 
            	 첨부 이미지가 있는 경우 : em에 "bg" 클래스 적용 //첨부 이미지가 없는 경우 : em에 "nobg" 클래스 적용   -->
				 
            <div class="drag_area" id="drag_area">
				<ul class="lst_type" >
				</ul>
            	<em class="blind">마우스로 드래그해서 이미지를 추가해주세요.</em><span id="guide_text" class="bg"></span>
            </div>
			<div style="display:none;" id="divImageList"></div>
            <p class="dsc dsc_v1"><em>한 장당 10MB, 1회에 50MB까지, 10개</em>의 이미지 파일을<br>등록할 수 있습니다. (JPG, GIF, PNG, BMP)</p>
        </div>
        <!-- //content -->
    </div>

    <!-- //container -->
    <!-- footer -->
    <div id="pop_footer">
	    <div class="btn_area">
            <a href="#"><img src="./smartEditor2/img/fileUpload/btn_confirm.png" width="49" height="28" alt="확인" id="btn_confirm"></a>
            <a href="#"><img src="./smartEditor2/img/fileUpload/btn_cancel.png" width="48" height="28" alt="취소" id="btn_cancel"></a>
        </div>
    </div>
    <!-- //footer -->
</div>

<script>

	var nImageInfoCnt = 0;
	var htImageInfo = [];		//image file정보 저장
	var aResult = [];

	var rFilter = /^(image\/bmp|image\/gif|image\/jpg|image\/jpeg|image\/png)$/i;  
	var rFilter2 = /^(bmp|gif|jpg|jpeg|png)$/i; 
	var nTotalSize = 0;
	var nMaxImageSize = 10*1024*1024;
	var nMaxTotalImageSize = 50*1024*1024;
	var nMaxImageCount = 10;
	var nImageFileCount = 0;
	var bSupportDragAndDropAPI = false;
	var oFileUploader;
	var welDropAreaUL = $("<div>");

	function dragEnter(ev) {
 		ev.stopPropagation();
 		ev.preventDefault();
     }
 	
     function dragExit(ev) {
     	ev.stopPropagation();
     	ev.preventDefault();
     }
     
 	function dragOver(ev) {
 		ev.stopPropagation();
 		ev.preventDefault();
     }
 	
 	function drop(ev) {
		ev.stopPropagation();
		ev.preventDefault();
		
		if (nImageFileCount >= 10){
			alert("최대 10장까지만 등록할 수 있습니다.");
			return;
		}
		
		if(typeof ev.dataTransfer.files == 'undefined'){
			alert("HTML5를 지원하지 않는 브라우저입니다.");
		}else{
			//변수 선언
			var wel,
				files,
				nCount,
				sListTag = '';
			
			//초기화	
			files = ev.dataTransfer.files;
			nCount = files.length;
						
			if (!!files && nCount === 0){
				//파일이 아닌, 웹페이지에서 이미지를 드래서 놓는 경우.
				alert("정상적인 첨부방식이 아닙니다.");
				return ;
			}
			
			for (var i = 0, j = nImageFileCount ; i < nCount ; i++){
				if (!rFilter.test(files[i].type)) {
					alert("이미지파일 (jpg,gif,png,bmp)만 업로드 가능합니다.");
				} else if(files[i].size > nMaxImageSize){
					alert("이미지 용량이 10MB를 초과하여 등록할 수 없습니다.");
				} else {
					//제한된 수만 업로드 가능.
					if ( j < nMaxImageCount ){
						sListTag += addImage(files[i]);
						
						//다음 사진을위한 셋팅
						j = j+1;
						nImageInfoCnt = nImageInfoCnt+1;
					} else {
						alert("최대 10장까지만 등록할 수 있습니다.");
						break;			
					}
				}
			}
			if(j > 0){
				//배경 이미지 변경
				startModeBG();
				if ( sListTag.length > 1){
					welDropAreaUL.prependHTML(sListTag);
				}
				//이미지 총사이즈 view update 
				updateViewTotalSize();
				//이미치 총 수 view update
				nImageFileCount = j;
				updateViewCount(nImageFileCount, 0);
				// 저장 버튼 활성화
				goStartMode();
			}else{
				readyModeBG();
			}
		}
    }
 	
 	function addImage(ofile){
    	//파일 사이즈
		var ofile = ofile,
			sFileSize = 0,
			sFileName = "",
			sLiTag = "",
			bExceedLimitTotalSize = false,
			aFileList = [];
		
		sFileSize = setUnitString(ofile.size);
		sFileName = cuttingNameByLength(ofile.name, 15);
		bExceedLimitTotalSize = checkTotalImageSize(ofile.size);

		if( !!bExceedLimitTotalSize ){
			alert("전체 이미지 용량이 50MB를 초과하여 등록할 수 없습니다. \n\n (파일명 : "+sFileName+", 사이즈 : "+sFileSize+")");
		} else {
			//이미지 정보 저장							
			htImageInfo['img'+nImageInfoCnt] = ofile;
			
    		//List 마크업 생성하기
			aFileList.push('	<li id="img'+nImageInfoCnt+'" class="imgLi"><span>'+ sFileName +'</span>');
			aFileList.push('	<em>'+ sFileSize +'</em>');
	        aFileList.push('	<a onclick="delImage(\'img'+nImageInfoCnt+'\')"><img class="del_button" src="./img/btn_del.png"  width="14" height="13" alt="첨부 사진 삭제"></a>');
			aFileList.push('	</li> ');   
			
			sLiTag = aFileList.join(" ");
			aFileList = [];
		}
		return sLiTag;
    }
 	
 	function setUnitString (nByte) {
 		var nImageSize;
 		var sUnit;
 		
 		if(nByte < 0 ){
 			nByte = 0;
 		}
 		
 		if( nByte < 1024) {
 			nImageSize = Number(nByte);
 			sUnit = 'B';
 			return nImageSize + sUnit;
 		} else if( nByte > (1024*1024)) {
 			nImageSize = Number(parseInt((nByte || 0), 10) / (1024*1024));
 			sUnit = 'MB';
 			return nImageSize.toFixed(2) + sUnit;
 		} else {
 			nImageSize = Number(parseInt((nByte || 0), 10) / 1024);
 			sUnit = 'KB';
 			return nImageSize.toFixed(0) + sUnit;
 		}
     }
 	
 	function cuttingNameByLength (sName, nMaxLng) {
 		var sTemp, nIndex;
 		if(sName.length > nMaxLng){
 			nIndex = sName.indexOf(".");
 			sTemp = sName.substring(0,nMaxLng) + "..." + sName.substring(nIndex,sName.length) ;
 		} else {
 			sTemp = sName;
 		}
 		return sTemp;
 	}
 	
 	function checkTotalImageSize(nByte){
 		if( nTotalSize + nByte < nMaxTotalImageSize){
 			nTotalSize = nTotalSize + nByte;
 			return false;
 		} else {
 			return true;
 		}
 	}

 	function startModeBG (){
 		var sClass = welTextGuide.className();
 		if(sClass.indexOf('nobg') < 0){
	 		welTextGuide.removeClass('bg');
	 		welTextGuide.className('nobg');
 		}
 	}
 	
 	function updateViewCount (nCount, nVariable){
 		var nCnt = nCount + nVariable;
 		elCountTxtTxt.innerHTML = nCnt +"장";
 		nImageFileCount = nCnt;
 		return nCnt;
 	}
 	
 	function updateViewTotalSize(){
 		var nViewTotalSize = Number(parseInt((nTotalSize || 0), 10) / (1024*1024));
 		elTotalSizeTxt.innerHTML = nViewTotalSize.toFixed(2) +"MB";
 	}
 	
 	function refreshTotalImageSize(sParentId){
 		var nDelImgSize = htImageInfo[sParentId].size;
 		if(nTotalSize - nDelImgSize > -1 ){
 			nTotalSize = nTotalSize - nDelImgSize;
 		} 
 	}
 	
elDropArea = document.getElementById("drag_area");

elDropArea.addEventListener("dragenter", dragEnter, false);
elDropArea.addEventListener("dragexit", dragExit, false);
elDropArea.addEventListener("dragover", dragOver, false);
elDropArea.addEventListener("drop", drop, false);

</script>

</body>
</html>