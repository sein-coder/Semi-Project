<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
	table#big-table {
		border: 2px solid goldenrod;
		margin-top: 5%;
		margin-left: auto;
		margin-right: auto;
		border-spacing: 50px 20px;
	}
	table#sml-table {
		border: 2px solid goldenrod;
		margin-top: 5%;
		margin-left: auto;
		margin-right: auto;
		border-spacing: 50px 20px;
		width:1000px;height:100px;
	}
	
	/* th,td{
		border: 1px solid blue;
	} */
	</style>
	<section>
		<h2>Food Zone</h2>
		<div>
			<table id="big-table">
				<tr>
					<th>이미지 사진</th>
					<th>이미지 사진</th>
					<th>이미지 사진</th>
					<th>이미지 사진</th>
					<th>이미지 사진</th>
			   	</tr>
			   	<tr>
			   		<td colspan="5">
			   			<form>
							<table id="sml-table">
								<tr>
									<td>
										제목<input type="text" id="title" name="title" ><br>
									</td>
								</tr>
								<tr>
									<td>
										주소<input type="text" id="addr" name="addr"/><br>
										전화번호<input type="text" id="tel" name="tel"/><br>
										음식종류<br>
										<input type="radio" id="foodtype" name="한식"/>한식
										<input type="radio" id="foodtype" name="중식"/>중식
										<input type="radio" id="foodtype" name="일식"/>일식<br>
										기타:<input type="text" id="foodtype" placeholder="그 외 음식을 입력하세요"/><br>
		
										<br>
										가격(1인기준)<br>
										<input type="radio" id="bills" name="5000원이하"/>~5000원<br>
										<input type="radio" id="bills" name="10000"/>5000~10000원이하<br>
										<input type="radio" id="bills" name="15000원이하"/>10000~15000원이하<br>
										<input type="radio" id="bills" name="20000원이하"/>10000~20000원이하<br>
										<input type="radio" id="bills" name="25000원이하"/>25000원이하<br>
										기타:<input type="text" id="otherbill" placeholder="기타금액을 입력하세요"/>
									</td>
									<td>
										지도
									</td>
								</tr>
								<tr>
									<td>
										주차여부
										<input type="radio" id="park" name="park"/>가능
										<input type="radio" id="park" name="park"/>불가능<br>
									</td>
								</tr>
								<tr>
									<td>
										영업시간<input type="text" id="open" name="open"/>
									</td>
								</tr>
								<tr>
									<td>
										메뉴
									</td>
								</tr>
								<tr>
									<td>
										<h3>내용</h3>
										<textarea id="content" name="content" cols="10" rows="20" placeholder="내용을입력하시오"/></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<input type = "submit" value = "완료"/>
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
	</section>
<%@ include file="/views/common/footer.jsp"%>	