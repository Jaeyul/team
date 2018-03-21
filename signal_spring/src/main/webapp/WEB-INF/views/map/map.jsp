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

<body onload="getData()">
<br>
<div id="kMapIcon" style="display:none;">
	<img src="/img/koreamap.png" class="image" height="50" width="50" onclick="openMap()">
</div>
<div id="mapTest" style="float: left; border-style: solid;border-color:#9A91AC ;"></div>
<script>
var colorConfirm = [];
var bw = document.body.clientWidth;
var bh = document.body.clientHeight;

function getList(str){	
	$("svg").animate({width: 0}, "slow");
	$('#regeon').html(str);
	$('#categoryWindow').css("display","");
	$('#categoryWindow').animate({width: bw*(4/5)}, "slow");
	$('#categoryWindow').css("float","none");
	$('#categoryWindow').css("margin","auto");
	setTimeout(function(){ 
		$('#kMapIcon').css("display","");
	}, 800);	
}
function openMap(){
	$('#kMapIcon').css("display","none");
	$('#categoryWindow').animate({width: bw-(bw/2.05)}, "slow");
	$('#categoryWindow').css("float","right");
	$('#categoryWindow').css("margin","0");	
	$("svg").animate({width: (bw/2.1)}, "slow");	
	
}

function openWindow(){
	
	
	$('#categorySelect').dropdown();
	$('#sizeSelect').dropdown();
	$('.ui.basic.modal').modal('show');	
}

function getData(){
	var au = new AjaxUtil("category/list");
	au.send(test);
	function test(res){		
		console.log(res);		
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
				<p id="regeon"></p>
			</div>
			<div class="ui segments">
					<div class="ui segment">
					  <button class="ui inverted red button" id="colorDB2828" onclick="activeJY(id)">Red</button>
					  <button class="ui inverted orange button" id="colorF2711C" onclick="activeJY(id)">Orange</button>
					  <button class="ui inverted yellow button" id="colorFBBD08" onclick="activeJY(id)">Yellow</button>
					  <button class="ui inverted olive button" id="colorB5CC18" onclick="activeJY(id)">Olive</button>
					  <button class="ui inverted green button" id="color21BA45" onclick="activeJY(id)">Green</button>
					  <button class="ui inverted teal button" id="color00B5AD" onclick="activeJY(id)">Teal</button>
					</div>
					<div class="ui segment">			    	
			  	 		<button class="ui inverted blue button" id="color2185D0" onclick="activeJY(id)">Blue</button>
						<button class="ui inverted violet button" id="color6435C9" onclick="activeJY(id)">Violet</button>
						<button class="ui inverted purple button" id="colorA333C8" onclick="activeJY(id)">Purple</button>
						<button class="ui inverted pink button" id="colorE03997" onclick="activeJY(id)">Pink</button>
						<button class="ui inverted brown button" id="colorA5673F" onclick="activeJY(id)">Brown</button>
						<button class="ui inverted grey button" id="color767676" onclick="activeJY(id)" style="color:#767676">Grey</button>
					</div>
			</div>
						
			<div class="ui segment">
				<div class="ui segment">
					<br><br><br><br><br><br>
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
		<form>
	    	방&emsp;이름:&emsp;
	    	<div class="ui input">
	  			<input type="text" placeholder="Room Name">
			</div>
			<br><br>
	    	카테고리:&emsp; 
	    	<select name="categoryNo" class="ui dropdown" id="categorySelect" name="">
			  <option value="">Category</option>			  
			  <c:forEach items="${list}" var="clist">
			  	<option value=${clist.categoryNo}>${clist.categoryName}</option>
			  </c:forEach>	  	  
			</select>			
			<br><br>
			방사이즈:&emsp;
	    	<select name="rSize" class="ui dropdown" id="sizeSelect">
			  <option value="">Size</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			</select>
		</form>
	</div>
  
	<div class="actions">
		<div class="ui red basic cancel inverted button">
			<i class="remove icon"></i>
			No
		</div>
		<div class="ui green ok inverted button">
			<i class="checkmark icon"></i>
			Yes
		</div>
	</div>
  
</div>


</body>



</html>
