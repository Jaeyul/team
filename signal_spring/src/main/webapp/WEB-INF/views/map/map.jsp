<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Korea Map</title>
</head>
<script src="/js/map/d3.v3.min.js"></script>
<script src="/js/map/topojson.v0.min.js"></script>

<style>
svg {
	background-color: lightskyblue;
}

.municipality {
	fill: #eee;
	stroke: #999;
}

.municipality:hover {
	fill: orange;
}



</style>

<body>

<div id="kMapIcon" style="visibility: hidden;">
	<img src="/img/koreamap.png" class="image" height="45" width="80" onclick="openMap()">
</div>

<div class="mapTest" id="mapTest" style="float: left; border-style: solid;border-color:#9A91AC ;"></div>


<script>
var colorConfirm = [];
var bw = document.body.clientWidth;
var bh = document.body.clientHeight;


function getList(str){	
	$("svg").animate({width: 0}, "slow");
	$('#regeonName').val(str);
	$('#regeon').html(str);
	$('#categoryWindow').css("display","");
	$('#categoryWindow').animate({width: bw*(4/5)}, "slow");
	$('#categoryWindow').css("float","none");
	$('#categoryWindow').css("margin","auto");	
	
	setTimeout(function(){ 
		$('#kMapIcon').css("visibility","visible");
	}, 800);	
}

function openMap(){
	$('#kMapIcon').css("visibility","hidden");
	$('#categoryWindow').animate({width: bw-(bw/2.05)}, "slow");
	$('#categoryWindow').css("float","right");
	$('#categoryWindow').css("margin","0");	
	$("svg").animate({width: (bw/2.15)}, "slow");	
	
}

function openWindow(){	
	$('#categoryNo').dropdown();
	$('#rSize').dropdown();
	$('.ui.basic.modal').modal('show');	
}

function createRoom(){
	var rName = $('#rName').val();
	rNameVal = {rName:rName};	
	var au = new AjaxUtil("room/check",rNameVal);	
	au.send(checkCallback);	
}

function checkCallback(res){		
	if(res.msg!=null){
		alert(res.msg);
	}else{
		$('#createRoomForm').submit();	
	}
}	

var w = 600, h = 870; 
var proj = d3.geo.mercator()
	.center([127.0, 35.9])	
	.scale(bw*8.5/2.3)
	.translate([(w/2.1), (h/2)]);

var path = d3.geo.path().projection(proj);
var ids = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
var svg = d3.select("#mapTest").append("svg")
	.attr("width", bw/2.1)
	.attr("height", bh/1.05);
    
d3.json("/js/map/provinces-topo-simple.json", function(error, kor) {
	var municipalities = topojson.object(kor, kor.objects['provinces-geo']);
	svg.selectAll('path').data(municipalities.geometries).enter().append('path')
	.attr('d', path)
	.attr("id", function(d) { return d.properties.name_eng; })
	.attr('class', 'municipality')
	.attr('onclick', 'getList(id)')	
	.attr('style','cursor:pointer;');
});


function changeBtns(){
	for(var key in colorConfirm){
		var id = colorConfirm[key];
		$('#'+id).addClass("active");
	}
}
function activeJY(id){
	var idx = colorConfirm.indexOf(id);
	if(idx==-1){
		colorConfirm[colorConfirm.length] = id;
	}else{
		colorConfirm.splice(idx);
		$('#'+id).removeClass("active");
		$('#'+id).blur();
	}
	changeBtns();
}
</script>

<div id="categoryWindow" style="float: right; display : none ">
<br><br><br>

	<div> 
		<div class="ui segments">
			<div class="ui segment">
				<p id="regeon">??</p>
			</div>
			<div class="ui segments">
				
					<div class="ui segment">
						<c:forEach items="${clList}" var="colorList">	
							<c:choose>
								<c:when test="${colorList.colorNo eq '7'}">
									<button class="${colorList.colorClass}" id="${colorList.colorId}" onclick="activeJY(id)">${colorList.categoryName}</button>
									</div>
									<div class="ui segment">
								</c:when>
								<c:when test="${colorList.colorNo eq '12'}">									
									<button class="${colorList.colorClass}" id="${colorList.colorId}" onclick="activeJY(id)" style="color:${colorList.colorCode}">${colorList.categoryName}</button>
								</c:when>
								<c:when test="${colorList.colorNo eq '13'}">									
									<button class="${colorList.colorClass}" id="${colorList.colorId}" onclick="activeJY(id)" style="border-color:${colorList.colorCode}; color:#767676">${colorList.categoryName}</button>
									</div>
								</c:when>
								<c:otherwise>
									<button class="${colorList.colorClass}" id="${colorList.colorId}" onclick="activeJY(id)">${colorList.categoryName}</button>								
								</c:otherwise>
							</c:choose>								
						</c:forEach>
			</div>	
					
							
			<div class="ui segment">
				<div class="ui segment">
				
				
					<div class="ui relaxed divided list">
					  
					  <div class="item" style="height:45">
					    <i class="large github middle aligned icon"></i>
					    <div class="content">
					      <a class="header">Semantic-Org/Semantic-UI-Docs</a>
					      <div class="description">Updated 22 mins ago</div>
					    </div>
					  </div>
					  
					  <div class="item" style="height:45">
					    <i class="large github middle aligned icon"></i>
					    <div class="content">
					      <a class="header">Semantic-Org/Semantic-UI-Meteor</a>
					      <div class="description">Updated 34 mins ago</div>
					    </div>
					  </div>
					   <div class="item" style="height:45">
					    <i class="large github middle aligned icon"></i>
					    <div class="content">
					      <a class="header">Semantic-Org/Semantic-UI-Meteor</a>
					      <div class="description">Updated 34 mins ago</div>
					    </div>
					  </div>
					   <div class="item" style="height:45">
					    <i class="large github middle aligned icon"></i>
					    <div class="content">
					      <a class="header">Semantic-Org/Semantic-UI-Meteor</a>
					      <div class="description">Updated 34 mins ago</div>
					    </div>
					  </div>
					   <div class="item" style="height:45">
					    <i class="large github middle aligned icon"></i>
					    <div class="content">
					      <a class="header">Semantic-Org/Semantic-UI-Meteor</a>
					      <div class="description">Updated 34 mins ago</div>
					    </div>
					
					  
					  
					</div>
					
					
				</div>
			</div>
			<button class="ui primary button" style="float: right;" onclick="openWindow()">Make Room</button>
			<br><br><br>	
		</div>
	</div>
	
</div>

<div class="ui basic modal"  style="border-style: solid;">
	<div class="ui icon header">
	<i class="archive icon"></i>    
</div>  
	<div class="content" style="width:400; margin:auto">
		<form action="video" id="createRoomForm">
	    	방&emsp;이름:&emsp;
	    	<div class="ui input">
	  			<input type="text" placeholder="RoomName" id="rName" name="rName" required>
			</div>
			<br><br>
			
	    	카테고리:&emsp; 
	    	<select name="categoryNo" class="ui dropdown" name="categoryNo" id="categoryNo" required>
			  <option value="">Category</option>			  
			  <c:forEach items="${ctList}" var="cateList">
			  	<option value=${cateList.categoryNo}>${cateList.categoryName}</option>
			  </c:forEach>	  	  
			</select>			
			<br><br>
			
			방사이즈:&emsp;
	    	<select name="rSize" class="ui dropdown" id="rSize" name="rSize" required>
			  <option value="">Size</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			</select>
			<br><br>
			
			태&emsp;그&emsp;:&emsp;
	    	<div class="ui input">
	  			<input type="text" placeholder="Tag" id="rTag" name="rTag">
			</div>
			
			<input type="hidden" name="regeonName" id="regeonName">
			
			
		</form>
		
	</div>
  
	<div class="actions">
		<div class="ui red basic cancel inverted button">
			<i class="remove icon"></i>
			No
		</div>		
		<div class="ui green ok inverted button" onclick="createRoom()">
			<i class="checkmark icon"></i>
			Yes
		</div>
	</div>  
	
</div>

</body>



</html>
