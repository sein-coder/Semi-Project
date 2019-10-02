$(document).ready(function(){
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"anonymous"},
		type : "post", 
		success : function(data){ 
			for(var i=0; i<data.length; i++){
				var li = $("<li>");
				var a = $("<a >");
				var span = $("<span class='lt_date'>");
				a.html(data[i]["title"]);
				a.attr("href","./anonymousContentView?anonymousNo="+data[i]["no"]);
				span.html(data[i]["date"]);

				li.append(a);
				li.append(span);
				
				$("#anonymousBoard").append(li)
			}
		}
	});
	
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"grade"},
		type : "post", 
		success : function(data){ 
			for(var i=0; i<data.length; i++){
				var li = $("<li>");
				var a = $("<a >");
				var span = $("<span class='lt_date'>");
				a.html(data[i]["title"]);
				a.attr("href","./gradeContentView?gradeNo="+data[i]["no"]);
				span.html(data[i]["date"]);

				li.append(a);
				li.append(span);
				
				$("#gradeBoard").append(li)
			}
		}
	});
	
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"inquery"},
		type : "post", 
		success : function(data){ 
			for(var i=0; i<data.length; i++){
				var li = $("<li>");
				var a = $("<a >");
				var span = $("<span class='lt_date'>");
				a.html(data[i]["board_Title"]);
				a.attr("href","./inquery/inqueryView?Board_No="+data[i]["board_No"]);
				span.html(data[i]["board_Date"]);

				li.append(a);
				li.append(span);
				
				$("#inqueryBoard").append(li)
			}
		}
	});
	
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"free"},
		type : "post", 
		success : function(data){ 
			for(var i=0; i<data.length; i++){
				var li = $("<li>");
				var a = $("<a >");
				var span = $("<span class='lt_date'>");
				a.html(data[i]["title"]);
				a.attr("href","./freeContentView?freeNo="+data[i]["no"]);
				span.html(data[i]["date"]);

				li.append(a);
				li.append(span);
				
				$("#freeBoard").append(li)
			}
		}
	});
	
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"notice"},
		type : "post", 
		success : function(data){
			for(var i=0; i<data.length; i++){
				var li = $("<li class='empty_li'>");
				var a = $("<a>");
				a.html(data[i]["title"]);
				a.attr("href","./noticeContentView?noticeNo="+data[i]["no"]);
				
				li.append(a);
				
				$("#noticeboard").append(li)
			}
		}
	});
	
	$.ajax({
		url : "./mainPageBoardServlet", 
		dataType:"json",
		data : {"ajax":"food"},
		type : "post", 
		success : function(data){ 
			for(var i=0; i<data.length; i++){
				var li = $("<li>");
				var a = $("<a >");
				var img = $("<img>");
				a.html(data[i]["board_Title"]);
				a.attr("href","./food/foodView?board_no="+data[i]["board_No"]);

				img.attr({
					"src":"./upload/food/thumnail/"+data[i]["board_Thumbnail"],
					"width":"120px",
					"height":"130px"
				});

				a.append(img);
				li.append(a);
				
				$("#foodBoard").append(li)
			}
		}
	});
});