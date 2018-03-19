<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div id="mapTest" style="float: left; width: 49%;"></div>
<script>
function getList(str){
	alert(str);
}

var bw = document.body.clientWidth;
var bh = document.body.clientHeight
var w = 600, h = 870; 
var proj = d3.geo.mercator()
	.center([127.0, 35.9])	
	.scale(bw*8.5/2.3)
	.translate([w/2.1, h/2]);

var path = d3.geo.path().projection(proj);
var ids = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
var svg = d3.select("#mapTest").append("svg")
	.attr("width", bw/2)
	.attr("height", h);
    
d3.json("/js/map/provinces-topo-simple.json", function(error, kor) {
	var municipalities = topojson.object(kor, kor.objects['provinces-geo']);
	svg.selectAll('path').data(municipalities.geometries).enter().append('path')
	.attr('d', path)
	.attr("id", function(d) { return d.properties.name_eng; })
	.attr('class', 'municipality')
	.attr('onclick', 'getList(id)')
	.attr('style','cursor:pointer;');
    });

</script>
<div style="float: right; width: 49%;">

<input type="button" value="작아져라!" onclick="test()">

 <a href="login">한번 시도해봄</a>
</div>

</body>

</html>
