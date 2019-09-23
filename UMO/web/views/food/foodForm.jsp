
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
	table#big-table {
		border: 2px solid goldenrod;
		margin-top: 10%;
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
	
</style>
<section>

	<div>
		<table id="big-table">
		
			<tr>
				<th style="background-color:black;">  	
					<button id="img-back" style="border:none;padding:0px;"><img src="<%=request.getContextPath()%>/images/foodpoint/back.jpg" width="50px" height="205px"></button>
				</th> 
				<th colspan="3" style="background-color:white;" >
					<div id="img-container">
						<img id="0" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
						<img id="1" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png"> 
						<img id="2" style="width: 300px; height:200px" src="<%=request.getContextPath()%>/images/foodpoint/noimg.png">
					</div>
				</th>
				<th style="background-color:white;">
					<button id="img-front" style="border: none; padding:0px 0px 0px 0px; " ><img src="<%=request.getContextPath()%>/images/foodpoint/front.jpg" width="50px" height="205px"></button>
				</th>
			</tr>
			<tr>
				<td colspan="5">
					<button name="downfile" id="downfile">사진삭제</button>	
				</td>			
			</tr>
			<tr>
				<td colspan="5">
					<form>
					
						<input type="file" name="upfile" id="upfile" multiple/><!--multiple은 다중값으로 갖고 올수 있는 것   -->
						
						<table id="sml-table">
							<tr>
								<td>
									제목<input type="text" id="title" placeholder="가게상호명을 입력하세요" name="title"><br>
								</td>
							</tr>
							<tr>
								<td>
									주소<input type="text" id="addr" name="addr" /><br>
									전화번호<input type="text" id="tel" name="tel" /><br>
									음식종류<br>
									<input type="radio" id="foodtype" name="foodtype" value="한식"/>한식
									<input type="radio" id="foodtype" name="foodtype" value="중식"/>중식
									<input type="radio" id="foodtype" name="foodtype" value="일식"/>일식<br>
									기타:<input type="text" id="foodtype" placeholder="그 외 음식을 입력하세요" /><br>

									<br>
									가격(1인기준)<br>
									<input type="radio" id="bills" name="bills" value="~&#92;5,000"/>~&#92;5,000<br>
									<input type="radio" id="bills" name="bills" value="&#92;5,000~&#92;10,000"/>&#92;5,000~&#92;10,000<br>
									<input type="radio" id="bills" name="bills" value="&#92;10,000~&#92;15,000"/>&#92;10,000~&#92;15,000<br>
									<input type="radio" id="bills" name="bills" value="&#92;15,000~&#92;20,000"/>&#92;15,000~&#92;20,000<br>
									<input type="radio" id="bills" name="bills" value="&#92;20,000~"/>&#92;20,000~<br>
									기타:<input type="text" id="otherbill" placeholder="기타금액을 입력하세요" />
								</td>
							
							</tr>
							<tr>
								<td>
									주차여부
									<input type="radio" id="park" name="park" value="가능"/>가능
									<input type="radio" id="park" name="park" value="불가능"/>불가능<br>
								</td>
							</tr>
							<tr>
								<td>
									영업시간<input type="text" id="open" name="open" />
								</td>
							</tr>
							<tr>
								<td>
									메뉴
									<textarea id="content" name="content" cols="10" rows="5"
										placeholder="메뉴를 입력하시오" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<h3>내용</h3>
									<textarea id="content" name="content" cols="10" rows="20"
										placeholder="내용을입력하시오" /></textarea>
								</td>
							</tr>
							 <tr>
								<td>
									<input type="button" value="지도" id="btn_map";>
								
								</td>
							</tr>
							<tr>
								<td>
									<input type="submit" value="완료" style="margin-left: 40%; display:inline;" />
									<input type="button" value="취소"  id="btn_cancel";/>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>

	<script>
			
			
			
			var count = 0;//시작값
			$("#img-back").click(function(){
				count+=1;//초기값에 +1
				$("#"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인 곳, 속성 src에 foodpic에서 count값에서 foodpic의 길이를 나눈 나머지의 값이 0이면 여기서 src바꿔주기  
				$("#"+1).attr("src",foodpic[(count+1)%foodpic.length]);
				$("#"+2).attr("src",foodpic[(count+2)%foodpic.length]);
				console.log(count);
			});
			$("#img-front").click(function(){
				count-=1;//초기값을 -1
				if(count<0){count=foodpic.length-1;}//count가 0보다 작게 나오면 foodpic의 길이에서 -1을 뺀값을 count에 넣어줘(그럼 4)
				$("#"+0).attr("src",foodpic[count%foodpic.length]);//id값이 0인곳, 속성src에 foodpic길이에서 count를 나눈나머지값이 0이면 id값이 0인 곳에 src를 바꿔주기 
				$("#"+1).attr("src",foodpic[(count+1)%foodpic.length]);
				$("#"+2).attr("src",foodpic[(count+2)%foodpic.length]);
				console.log(count);
			});
			
			$("#btn_cancel").click(function(){
				location.href="<%=request.getContextPath()%>/food/foodList";
			});
			$("#btn_map").click(function(){
				location.href="<%=request.getContextPath()%>/food/foodForm";
			});
			
			
			
			//아래 사진 업로드, 파일선택 부분 코드
			var foodpic=[];
			$(function(){
				$("#upfile").change(function(){
					$("#preview").html("");//사진미리보기가 다 나오도록 처리
					$.each($(this)[0].files,function(i,item){//$.each() 메서드는 object와 배열모두 사용할수 있는 반복함수,jquery용,for in 반복문과 유사
						var reader = new FileReader();
						reader.onload=function(e){
/* 							var img=$("<img>").attr({"src":e.target.result ,"id":i}).css({"width":"300px","height":"200px"});
							$("#img-container").append(img); */
							
							
							
						/* 	아래는 
							i<3보다 작을때까지만 img태그를 만들고 container에 추가, foodpic배열에 이미지주소값을 요소로 추가 --> id값이 0,1,2인 img태그만 만들어서 세개만 container에 추가할려고, foodpic배열에 src추가 
						    i가 3보다 클때는 img태그를 만들지 않고 foodpic배열에 이미지주소값추가만 --> 그외에 애들은 foodpic이라는 배열에만 src를 추가해준다
						         이미지주소값 : e.tartget.result
						         배열에 요소 추가는 append로 합니다~~~ */
						    
							if(i<3){
								$("#"+i).attr({"src":e.target.result}).css({"width":"300px","height":"200px"});//img태그를 생성하는부분
								//$("#img-container").append(img);//div 태그에 하위태그를 추가할때 append
								foodpic.push(e.target.result);//배열에 요소를 추가할땐 push
							}else{
								foodpic.push(e.target.result);
							}
						}
						reader.readAsDataURL(item);
						console.log(item);
					});
				});
							
				
				
			$("#up-btn").on("click",function(){
				var fd=new FormData();
				$.each($("#upfile")[0].files,function(i,item){
					fd.append("file"+i,item);
				});
			
				$a.jax({
				url:"<%=request.getContextPath()%>/ajaxFile",
				data:fd,
				type:"post",
				processData:false,
				contentType:false,
				success:function(data){
					console.log(data);
					$("#preview").html("");
					$("#upfile").val("");
					}
				});
			});
			
			$("#downfile").on("click",function(){
				var a = foodpic.splice(foodpic.length-1,1);
				if(foodpic.length<=2){
					for(var i=2; i>foodpic.length; i--){
						$("#"+i).attr({"src":"<%=request.getContextPath()%>/images/foodpoint/noimg.png"});
						foodpic.push("<%=request.getContextPath()%>/images/foodpoint/noimg.png");
					}
				}else{
					$("#"+0).attr({"src":foodpic[0]});
					$("#"+1).attr({"src":foodpic[1]});
					$("#"+2).attr({"src":foodpic[2]});
				}
			});
			
			
			
	});
			
			
		</script>


</section>
<%@ include file="/views/common/footer.jsp"%>