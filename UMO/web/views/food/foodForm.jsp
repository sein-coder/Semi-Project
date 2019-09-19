<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
	table#big-table {
		border: 2px solid goldenrod;
		margin-top: 5%;
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

	/* th,td{
		border: 1px solid blue;
	} */

</style>
<section>
	<button onclick="selectPic">사진선택하기</button>

	<div>
		<table id="big-table">
			<tr>
				<th style="background-color:black;">  	
					<button id="img-back" style="border:none;padding:0px"><img src="<%=request.getContextPath()%>/images/foodpoint/back.png" width="50px" height="205px"></button>
				</th> 
				<th colspan="3" style="background-color:black;" >
					<div id="img-container"></div>
				</th>
				<th style="background-color:black;">
					<button id="img-front" style="border: none; padding:0px;" ><img src="<%=request.getContextPath()%>/images/foodpoint/front.png" width="50px" height="205px"></button>
				</th>
			</tr>
			<tr>
				<td colspan="5">
					<form>
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
								<td>
									지도<%=request.getContextPath() %>
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
									<input type="submit" value="완료" style="margin-left: 45%;"/>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<button style="margin-left: 45%;">목록</button>
				</td>
			</tr>
		</table>
	</div>

	<script>
			var foodpic = [
	
				"https://i.ytimg.com/vi/uLYII90ybsk/maxresdefault.jpg",
				"https://ssproxy.ucloudbiz.olleh.com/v1/AUTH_e59809eb-bdc9-44d7-9d8f-2e7f0e47ba91/post_card/34667_thumb_1518591025.jpg",
				"https://d3af5evjz6cdzs.cloudfront.net/images/uploads/800x0/gil-mac-burger-4_539a52c2c03a8eb58451ef0bc53f109a.jpg",
				"http://thum.buzzni.com/unsafe/640x640/center/smart/http://cdn.image.buzzni.com/2018/05/16/0H4uB9IPoG.jpg",
				"http://cfs1.blog.daum.net/upload_control/download.blog?fhandle=MEFPWlBAZnMxLmJsb2cuZGF1bS5uZXQ6L0lNQUdFLzAvMC5qcGc=&filename=0.jpg"
			];
			for (var i = 0; i < 3; i++) {
				var tag = $("<img>").attr({
					"id":i,
					"src": foodpic[i],
					"width": "300px",
					"height": "200px"
				});
				if(i>2){
					tag.css("display","none")
				}
				$('#img-container').append(tag);
			}
			var count = 0;
			$("#img-back").click(function(){
				count+=1;
				$("#"+0).attr("src",foodpic[count%foodpic.length]);
				$("#"+1).attr("src",foodpic[(count+1)%foodpic.length]);
				$("#"+2).attr("src",foodpic[(count+2)%foodpic.length]);
			});
			$("#img-front").click(function(){
				count-=1;
				if(count<0) { count = foodpic.length-1; }
				$("#"+0).attr("src",foodpic[count%foodpic.length]);
				$("#"+1).attr("src",foodpic[(count+1)%foodpic.length]);
				$("#"+2).attr("src",foodpic[(count+2)%foodpic.length]);
			});
		</script>


</section>
<%@ include file="/views/common/footer.jsp"%>