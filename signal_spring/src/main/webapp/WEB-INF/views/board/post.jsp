<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${boardVO.bName}</title>
</head>
<link href='https://fonts.googleapis.com/css?family=Faustina'
	rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Fjalla One'
	rel='stylesheet'>
<style>
body p {
	font-family: 'Faustina';
	font-size: 22px;
}

h1 h2 h3 h4 {
	font-family: 'Fjalla One';
}
</style>

<body>
	<div id='content' class="ui segment">
		<br>
		<h2 style='font-family: Fjalla one;'
			class="title ui left floated header">Title : ${boardVO.bName}</h2>
		<h4 class="ui right floated header">Writer : ${boardVO.uiId}</h4>
		<div class="ui clearing divider"></div>
		<img src="/web/upload_images/${imageVO.imgId}.jpg">
		<p>${boardVO.bContent}</p>
	</div>

</body>



</html>